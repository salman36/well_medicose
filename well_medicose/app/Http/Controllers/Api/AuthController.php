<?php

namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Support\Str;
use App\Mail\ForgotPassword;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Support\Facades\Validator;


class AuthController extends Controller
{
    /*register user */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|unique:users',
            'phone_no' => 'required',
            'password' => 'required|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone_no' => $request->phone_no,
            'address' => $request->address,
            'password' => Hash::make($request->password),
        ]);
        $token = $user->createToken($request->email)->plainTextToken;
        return response()->json([
            'status' => 'Ok',
            'message' => 'User Created Successfully',
            'token' => $token,
            'data' => $user
        ], 200);
    }


    /*login user */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }

        $credentials = $request->only('email', 'password');
        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($credentials['password'], $user->password)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        if ($user->is_active == 0) {
            return response()->json(['message' => 'Your user is not active'], 401);
        }

        // Update the user's FCM token
        $user->update(['fcm' => $request->fcm]);

        // Generate a new token for the user
        $token = $user->createToken($request->email)->plainTextToken;

        // Return the successful login response
        return response()->json([
            'status' => 'ok',
            'message' => 'User Logged In Successfully',
            'token' => $token,
            'user' => $user,
        ], 200);

        // This code will never be reached, so we can remove it.
        // return response()->json(['message' => 'Login details are not valid'], 401);
    }


    /*send otp through mail in forgot password */

    public function forgotPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }

        $user = User::where('email', $request->email)->first();
        if ($user) {
            $otp = random_int(1000, 9999);
            DB::table('password_resets')->insert([
                'email' => $request->email,
                'token' => $otp,
            ]);
            Mail::to($request->email)->send(new ForgotPassword($otp));
            return response()->json([
                'status' => 'Ok',
                'message' => 'OTP has been sended successfully on your email'
            ], 200);
        }

        return response()->json([
            'status' => 'failed',
            'message' => 'Invalid email address'
        ], 400);
    }


    public function confirmToken(Request $request)
    {
        $passwordReset = DB::table('password_resets')
            ->where('token', $request->token)
            ->first();
        if ($passwordReset) {
            // OTP is valid
            return response()->json([
                'status' => 'Ok',
                'message' => 'OTP has been successfuly verified'
            ], 200);
        }
        return response()->json([
            'status' => 'Failed',
            'message' => 'Invalid OTP'
        ], 400);
    }

    /*change user password */
    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->messages()], 400);
        }

        $email = $request->input('email');
        $password = $request->input('password');

        $user = User::where('email', $email)->first();

        if ($user) {
            $user->update(['password' => Hash::make($password)]);
            DB::table('password_resets')->where('email', $email)->delete();

            return response()->json([
                'status' => 'Ok',
                'message' => 'Password has been update successfully'
            ], 200);
        }
        return response()->json([
            'status' => 'Failed',
            'message' => 'Invalid email address'
        ], 400);
    }

    /*logout user  */
    public function logout()
    {
        $userId = Auth::guard('api')->id();
        PersonalAccessToken::where('tokenable_id', $userId)->delete();
        return response([
            'status' => 'Ok',
            'message' => 'Logout successful',
        ], 200);

    }
}
