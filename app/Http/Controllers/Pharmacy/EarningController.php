<?php

namespace App\Http\Controllers\Pharmacy;

use App\Models\Pharmacy;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class EarningController extends Controller
{
    public function getEarning(){
        $pharmacyId = Auth::guard('pharmacy')->id();
        $earnings = Pharmacy::withCount('orders')->where('id',$pharmacyId)
        ->withSum('orders','total_amount')
        ->get();
        // $earnings = Pharmacy::withCount(['orders' => function ($query) {
        //     $query->where('status', 'approved');
        // }])
        // ->where('id', $pharmacyId)
        // ->withSum(['orders' => function ($query) {
        //     $query->where('status', 'approved');
        // }], 'total_amount')
        // ->get();
        // return  $earnings;
        return view('pharmacy.earning.index',compact('earnings'));
    }
}

