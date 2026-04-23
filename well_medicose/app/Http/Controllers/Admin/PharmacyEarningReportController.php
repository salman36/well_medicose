<?php

namespace App\Http\Controllers\Admin;

use App\Models\Order;
use App\Models\Pharmacy;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;

class PharmacyEarningReportController extends Controller
{
    public function index(){
        $pharmacies = Pharmacy::all();
        // return $pharmacies;
        return view('admin.pharmacyEarning.indax' , compact('pharmacies'));
    }
    public function getReports($id)
    {
        // return $id;
        // $pharmacyId = Auth::guard('pharmacy')->id();
        $currentDate = Carbon::now();

        // Get orders for the current date (daily)
        $dailyOrders = Order::where('pharmacy_id', $id)
            ->wheredate('created_at', $currentDate)
            ->get();

        // Get orders for the current date (weekly)
        $weeklyOrders = Order::where('pharmacy_id', $id)->whereBetween('created_at',
        [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
        ->get();

        // // Get orders for the current month (monthly)
        $monthlyOrders = Order::where('pharmacy_id', $id)
            ->whereYear('created_at', $currentDate->year)
            ->whereMonth('created_at', $currentDate->month)
            ->get();

        // // Get orders for the current yearly (yearly)
        $yearlyOrders = Order::where('pharmacy_id', $id)
            ->whereYear('created_at', $currentDate->year)
            ->get();

        // return [
        //     'daily' => $dailyOrders,
        //     'weekly' => $weeklyOrders,
        //     'monthly' => $monthlyOrders,
        //     'yearly' => $yearlyOrders,
        // ];
        return view('admin.pharmacyEarning.reports', compact('dailyOrders','weeklyOrders', 'monthlyOrders', 'yearlyOrders'));
    }
}
