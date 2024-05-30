<?php

namespace App\Http\Controllers\Pharmacy;

use Carbon\Carbon;
use App\Models\Package;
use App\Models\Pharmacy;
use Illuminate\Http\Request;
use App\Models\AccountDetail;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function getProfile()
    {
        $data = Pharmacy::find(Auth::guard('pharmacy')->id());
        $pharmacy = Pharmacy::find($data);
        $account = AccountDetail::where('pharmacy_id', $data->id)->first();
        $pharmacies = Pharmacy::where('id', $data->id)->first();
        $subscriptionDate = Carbon::parse($pharmacies->subscription);
        $currentDate = Carbon::now();
        $daysDifference = $currentDate->diffInDays($subscriptionDate);
        // return $daysDifference;
        return view('pharmacy.auth.profile', compact('data', 'account', 'pharmacies','daysDifference'));
    }

    public function update_profile(Request $request)
{
    // return $request;
    $request->validate([
        'branch_name' => 'required',
        'email' => 'required',
        'branch_no' => 'required',
        'address' => 'required',
        'license' => 'required',
        'phone_no' => 'required',
        'opening_time' => 'required',
        'closing_time' => 'required',
    ]);

    $pharmacy = Pharmacy::find(Auth::guard('pharmacy')->id());
    $data = $request->only(['branch_name', 'email', 'branch_no', 'address', 'license', 'phone_no','opening_time','closing_time']);

    if ($request->hasFile('image')) {
        $file = $request->file('image');
        $extension = $file->getClientOriginalExtension();
        $filename = time() . '.' . $extension;
        $file->move(public_path('admin/assets/images/users/'), $filename);
        $imagePath = 'public/admin/assets/images/users/' . $filename;
        $data['image'] = $imagePath;
    }

    $pharmacy->update($data);

    return back()->with(['status' => true, 'message' => 'Updated Successfully']);
}

    public function logout()
    {
        Auth::guard('pharmacy')->logout();
        return redirect('login');
    }

    // public function store(Request $request)
    // {
    //     $request->validate([
    //         'bank_name' => 'required',
    //         'account_holder_name' => 'required',
    //         'account_no' => 'required',
    //     ]);

    //     $id = Auth::guard('pharmacy')->id();
    //     $account = AccountDetail::where('pharmacy_id', $id)->first();
    //     if ($account) {
    //         // Account record exists, update the existing record
    //         $account->update($request->all());
    //     } else {
    //         // Account record doesn't exist, create a new record
    //         $account = AccountDetail::create($request->all() + ['pharmacy_id' => $id]);
    //     }

    //     return back()->with(['status' => true, 'message' => 'Saved Successfully']);
    // }

    public function store(Request $request)
    {
        $request->validate([
            'bank_name' => 'required',
            'account_holder_name' => 'required',
            'account_no' => 'required',
        ]);

        $accountData = [
            'bank_name' => $request->input('bank_name'),
            'account_holder_name' => $request->input('account_holder_name'),
            'account_no' => $request->input('account_no')
        ];

        $pharmacyId = Auth::guard('pharmacy')->id();

        $account = AccountDetail::updateOrCreate(['pharmacy_id' => $pharmacyId], $accountData);

        return redirect()->route('pharmacy.pharmacy-profile')->with(['ststus' => true, 'message' => 'Create Successfuly']);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'bank_name' => 'required',
            'account_holder_name' => 'required',
            'account_no' => 'required',
        ]);

        $account = AccountDetail::find($id);
        $account->update([
            'bank_name' => $request->bank_name,
            'account_holder_name' => $request->account_holder_name,
            'account_no' => $request->account_no,
        ]);

        return redirect()->route('pharmacy.pharmacy-profile')->with(['ststus' => true, 'message' => 'Update Successfuly']);
    }

}
