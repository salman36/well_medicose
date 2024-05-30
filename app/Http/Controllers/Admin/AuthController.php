<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function getLoginPage()
    {
        return view('admin.auth.login');
    }
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        $remember_me = ($request->remember_me) ? true : false;
        if (!auth()->guard('admin')->attempt(['email' => $request->email, 'password' => $request->password], $remember_me)) {
            return back()->with(['status' => true, 'message' => 'Invalid Email or Password']);
        }
        return redirect('admin/dashboard')->with(['status' => true, 'message' => 'Login Successfully']);
    }

}
