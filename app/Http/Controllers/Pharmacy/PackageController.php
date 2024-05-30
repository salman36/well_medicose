<?php

namespace App\Http\Controllers\Pharmacy;

use App\Models\Package;
use App\Models\Pharmacy;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class PackageController extends Controller
{

    /*create package */
    public function create()
    {
        $packages = Package::all();
        return view('pharmacy.packages.create', compact('packages'));
    }

    /*purchase package */
    public function purchase(Request $request)
    {
        $packageId = $request->input('id');
        // return $packageId;
        $package = Package::find($packageId);
        // return $package;
        $pharmacyId = Auth::guard('pharmacy')->id();
        // return $pharmacyId;
        $pharmacy = Pharmacy::find($pharmacyId);
        // return $pharmacy;
        // $pharmacy->package_id = $package->id;
        // $pharmacy->subscription = $package->validity;
        $pharmacy->subscription = date('d-m-Y', strtotime('+' . $package->validity . ' days'));
        // return $pharmacy->subscription;
        $pharmacy->save();

        return redirect()->route('pharmacy.pharmacy-profile')->with(['status'=> true,'message'=> 'Purchase Successfully']);
    }
}
