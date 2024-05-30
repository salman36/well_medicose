<?php

namespace App\Http\Controllers\admin;

use App\Models\User;
use App\Models\Admin;
use App\Models\Brand;
use App\Models\Product;
use App\Models\Pharmacy;
use Illuminate\Support\Str;
use App\Models\OfferProduct;
use Illuminate\Http\Request;
use App\Mail\ResetPasswordMail;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class AdminController extends Controller
{
    //
    public function getdashboard(){
        $pharmacy_Count = Pharmacy::all()->count();
        $user_Count = User::all()->count();
        $product_Count = Product::all()->count();
        $brand_Count = Brand::all()->count();
        $featured_Count = OfferProduct::all()->count();
        return view('admin.index',compact('pharmacy_Count', 'user_Count', 'product_Count', 'brand_Count', 'featured_Count'));
    }
    public function getProfile(){
        $data=Admin::find(Auth::guard('admin')->id());
        return view('admin.auth.profile',compact('data'));
    }

    public function update_profile(Request $request){
        $request->validate([
            'name'=>'required',
            'email'=>'required',
            'phone'=>'required'
        ]);
        $data = $request->only(['name','email','phone']);
        if ($request->hasfile('image'))
        {
            $file =$request->file('image');
            $extension = $file->getClientOriginalExtension(); // getting image extension
            $filename = time().'.' . $extension;
            $file->move(public_path('/admin/assets/images/users/'),$filename);
            $data['image']='public/admin/assets/images/users/'.$filename;
        }
        Admin::find(Auth::guard('admin')->id())->update($data);
        return back()->with(['status'=>true, 'message' => 'Updated Successfully']);
    }
    public function forgetPassword(){
        return view('admin.auth.forgetPassword');
    }
    public function adminResetPasswordLink(Request $request){
        $request->validate([
            'email'=>'required|exists:admins,email',
        ]);
        $exists = DB::table('password_resets')->where('email',$request->email)->first();
        if ($exists){
            return back()->with(['status'=>true, 'message' =>'Reset Password Link Has Been Already Sent']);
        }else{
            $token = Str::random(30);
            DB::table('password_resets')->insert([
                'email'=>$request->email,
                'token'=>$token,
            ]);

            $data['url'] = url('change_password',$token);
            Mail::to($request->email)->send(new ResetPasswordMail($data));
            return back()->with(['status'=>true, 'message' =>'Reset Password Link Send Successfully']);
        }
    }
    public function change_password($id)
    {

        $user = DB::table('password_resets')->where('token',$id)->first();

        if(isset($user))
        {
            return view('admin.auth.chnagePassword',compact('user'));
        }
    }

    public function resetPassword (Request $request)
    {

       $request->validate([
            'password' => 'required|min:8',
            'confirmed' => 'required',

        ]);
       if ($request->password !=$request->confirmed)
       {

           return back()->with(['status'=>true, 'message' => 'Password not matched']);
       }
        $password=bcrypt($request->password);
        $tags_data = [
            'password' => bcrypt($request->password)
        ];
        if (Admin::where('email',$request->email)->update($tags_data)){
            DB::table('password_resets')->where('email',$request->email)->delete();
            return redirect('admin')->with(['status'=>true, 'message' => 'Password Reset Successfully']);
        }


    }
    public function logout(){
        Auth::guard('admin')->logout();
        return redirect('admin-auth')->with(['status'=>true, 'message' => 'Logout Successfully']);;
    }

}
