<?php

namespace App\Http\Controllers\Pharmacy;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Brand;
use App\Models\Order;
use App\Models\Product;
use App\Models\Pharmacy;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Mail\PharmacyForgetPassword;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{
    public function getlogin()
    {

        return view('pharmacy.auth.login');
    }

    public function index()
    {
        return view('pharmacy.auth.register');
    }

    public function register(Request $request)
    {
        // dd($request);
        $request->validate([
            'branch_name' => ['required', 'string', 'max:255'],
            'phone_no' => 'required',
            'email' => 'required|unique:pharmacies',
            'password' => 'required',
            'password_confirmation' => 'required',
            'branch_no' => 'required',
            'address' => 'required',
            'license' => 'required',
            'opening_time' => 'required',
            'closing_time' => 'required',
        ]);
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $file->move(public_path('admin/assets/images/users/'), $filename);
            $image = 'public/admin/assets/images/users/' . $filename;
            // return $image;
        } else {
            $image = 'public/admin/assets/images/users/1675332882.jpg';
        }

        // $openingTime = $request->opening_time;
        // $closingTime = $request->closing_time;
        $openingTime = Carbon::createFromFormat('H:i', $request->opening_time)->format('h:i A');
        $closingTime = Carbon::createFromFormat('H:i', $request->closing_time)->format('h:i A');
        // return $closingTime;
        $pharmacy = new Pharmacy();
        $pharmacy->branch_name = $request->branch_name;
        $pharmacy->email = $request->email;
        $pharmacy->phone_no = $request->phone_no;
        $pharmacy->branch_no = $request->branch_no;
        $pharmacy->address = $request->address;
        $pharmacy->latitude = $request->latitude;
        $pharmacy->longitude = $request->longitude;
        $pharmacy->license = $request->license;
        $pharmacy->opening_time = $openingTime;
        $pharmacy->closing_time = $closingTime;
        $pharmacy->password = bcrypt($request->password);
        $pharmacy->image = $image;
        $pharmacy['is_active'] = '0';
        $pharmacy->save();

        return redirect()->route('login')->with(['status' => true, 'message' => 'Register pharmacy Successfully']);
    }

    public function show()
    {
        $pharmacyId = Auth::guard('pharmacy')->id();
        /*display user against pharmacy order */
        $user_Count = User::whereHas('orders', function ($query) use ($pharmacyId) {
            $query->where('pharmacy_id', $pharmacyId);
        })->count();
        $pendingOrder = Order::where('status', 'pending')->where('pharmacy_id', $pharmacyId)->count();
        $aprovedOrder = Order::where('status', 'approved')->where('pharmacy_id', $pharmacyId)->count();
        $products = Product::where('pharmacy_id', $pharmacyId)->count();
        return view('pharmacy.index', compact('user_Count', 'pendingOrder', 'aprovedOrder', 'products'));
    }

    // public function login(Request $request){

    //     $request->validate([
    //         'email' => 'required',
    //         'password' => 'required',
    //     ]);
    //     $credentials = $request->only('email', 'password');
    //     if (Auth::guard('pharmacy')->attempt($credentials)) {
    //         return redirect()->intended('pharmacy/pharmacy-dashboard')
    //                     ->withSuccess('Signed in');
    //     }
    //     return redirect("login")->withSuccess('Login details are not valid');
    // }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');
        $pharmacy = Pharmacy::where('email', $credentials['email'])->first();

        if ($pharmacy) {
            if ($pharmacy->is_active == 0) {

                return redirect()->route("login")->with(['status' => true, 'message' => 'Account has been deactivated from Admin']);
            }

            if (Auth::guard('pharmacy')->attempt($credentials)) {
                return redirect()->intended('pharmacy/pharmacy-dashboard')->withSuccess('Signed in');
            }
        }

        return redirect()->route("login")->with(['status' => true, 'message' => 'Login details are not valid']);
    }

    public function forgetPassword()
    {

        return view('pharmacy.auth.forgetPassword');
    }

    public function pharmacyResetPasswordLink(Request $request)
    {
        $request->validate([
            'email' => 'required|exists:pharmacies,email',
        ]);
        $exists = DB::table('password_resets')->where('email', $request->email)->first();
        if ($exists) {
            return back()->with('message', 'Reset Password link has been already sent');
        } else {
            $token = Str::random(30);
            DB::table('password_resets')->insert([
                'email' => $request->email,
                'token' => $token,
            ]);

            $data['url'] = url('pharmacy-change-password', $token);
            // {
            //     $pharmacy = Pharmacy::where('email', $request->email)->first();
            //     // return $pharmacy;
            //     $guard = 'web';
            // }

            // if ($pharmacy) {
            //     $email = DB::table('password_resets')->where('email', $request->email)->first();
            //     // return $email;
            //     if ($email) {
            //         $otp = random_int(1000, 9999);
            //         // return $otp;
            //         DB::table('password_resets')->where('email', $request->email)->update(['token' => $otp]);
            //     } else {
            //         // $token = Str::random(30);
            //         $otp = random_int(1000, 9999);
            //         // return $otp;
            //         DB::table('password_resets')->insert([
            //             'email' => $request->email,
            //             'token' => $otp,
            //             // 'otp' => $otp,
            //             'created_at' => Carbon::now(),
            //             // 'guard' => $guard,
            //         ]);
            //     }
            //     // $data['token'] = $otp;
            //     $data= $otp;
            //     // return $data;
            Mail::to($request->email)->send(new PharmacyForgetPassword($data));
            // return redirect()->route('otp')->with('success', 'We have sended you an OTP on email to retrieve your password');
            return back()->with('message', 'Reset Password Link Send Successfully');
        }
    }

    /*change password */
    public function change_password($id)
    {
        $user = DB::table('password_resets')->where('token', $id)->first();
        if (isset($user)) {
            return view('pharmacy.auth.chnagePassword', compact('user'));
        }
    }

    /*reset password */
    public function resetPassword(Request $request)
    {
        $request->validate([
            'password' => 'required|min:8',
            'confirmed' => 'required',

        ]);
        if ($request->password != $request->confirmed) {
            return back()->with(['error_message' => 'Password not matched']);
        }
        $password = bcrypt($request->password);
        $tags_data = [
            'password' => bcrypt($request->password)
        ];
        if (Pharmacy::where('email', $request->email)->update($tags_data)) {
            DB::table('password_resets')->where('email', $request->email)->delete();
            return redirect()->route('login')->with(['status' => true, 'message' => 'Password reset successfuly']);
        }


    }
}
