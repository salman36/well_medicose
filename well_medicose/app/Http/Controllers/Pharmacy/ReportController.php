<?php

namespace App\Http\Controllers\Pharmacy;

use App\Models\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class ReportController extends Controller
{
    public function getReports()
    {
        $pharmacyId = Auth::guard('pharmacy')->id();
        $currentDate = Carbon::now();

        // Get orders for the current date (daily)
        $dailyOrders = Order::where('pharmacy_id', $pharmacyId)
            ->wheredate('created_at', $currentDate)
            ->get();

        // Get orders for the current date (weekly)
        $weeklyOrders = Order::where('pharmacy_id', $pharmacyId)->whereBetween('created_at',
        [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
        ->get();

        // // Get orders for the current month (monthly)
        $monthlyOrders = Order::where('pharmacy_id', $pharmacyId)
            ->whereYear('created_at', $currentDate->year)
            ->whereMonth('created_at', $currentDate->month)
            ->get();

        // // Get orders for the current yearly (yearly)
        $yearlyOrders = Order::where('pharmacy_id', $pharmacyId)
            ->whereYear('created_at', $currentDate->year)
            ->get();

        // return [
        //     'daily' => $dailyOrders,
        //     'weekly' => $weeklyOrders,
        //     'monthly' => $monthlyOrders,
        //     'yearly' => $yearlyOrders,
        // ];
        return view('pharmacy.reports.index', compact('dailyOrders','weeklyOrders', 'monthlyOrders', 'yearlyOrders'));
    }
}
