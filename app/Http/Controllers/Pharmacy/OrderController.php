<?php

namespace App\Http\Controllers\Pharmacy;

use App\Models\User;
use App\Models\Order;
use App\Models\Notification;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\Mime\Message;

class OrderController extends Controller
{
    /*display all order against loggedd pharmacy */
    public function index()
    {
        $pharmacyId = Auth::guard('pharmacy')->id();
        $orders = Order::with('user')->where('pharmacy_id', $pharmacyId)->orderBy('id', 'DESC')->get();
        return view('pharmacy.order.index', compact('orders'));
    }

    /*update status of order */
    // public function status($id)
    // {
    //     $order = Order::find($id);
    //     $order->update(['status' => $order->status == 'pending' ? 'approved' : 'pending']);
    //     return redirect()->back()->with(['status' => true, 'message' => 'Status Updated sucessfully']);
    // }

    /*show order detail in model*/
    public function show(Request $request)
    {

        $data = Order::with('user', 'pharmacy', 'orderItem.product')->find($request->id);
        $product = view('pharmacy.order.model', compact('data'))->render();
        return response()->json($product);

    }

    // public function status($id)
    // {
    //     $order = Order::with('pharmacy','orderitem.product')->find($id);
    //     $order->update(['status' => $order->status == 'pending' ? 'approved' : 'pending']);
    //     // return $order;
    //     $orderItems = $order->orderitem;
    //     $products = [];
    //     // return $products;

    //     foreach ($orderItems as $orderItem) {
    //         $products[] = [
    //             'product_id' => $orderItem->product->id,
    //             'product_name' => $orderItem->product->name,
    //         ];
    //     }
    //     $selectedData = [
    //         // 'order_id' => $id,
    //         'user_id' => $order->user_id,
    //         'pharmacy_id' => $order->pharmacy_id,
    //         'code' => $order->code,
    //         'pharmacy_name' => $order->pharmacy->name,
    //         'products' => $products,
    //         'title' =>'Order Approval Request'
    //     ];
    //     return $selectedData;
    //     $notification = new Notification();
    //     $notification->user_id = $order->user_id;
    //     $notification->pharmacy_id = $order->pharmacy_id;
    //     $notification->title = "Order Approval Request";
    //     $notification->body = json_encode($selectedData);
    //     $notification->seen = $order->seen;
    //     $notification->save();

    //     $body = [
    //         'notification_id' => $notification->id,
    //         'order_id' => $id,
    //         // 'user_id' => $order->user_id,
    //         // 'pharmacy_id' => $order->pharmacy_id,
    //         // 'code' => $order->code,
    //         // 'pharmacy_name' => $order->pharmacy->name,
    //         // 'products' => $products,
    //         'title' =>'Order Approval Request',
    //         // 'created_at'=> $notification->created_at
    //             ];
    //     //  return $body;
    //     // $body = 'aaaaa';
    //     $user = User::where('id', $order->user_id)->first();
    //     // return $user;
    //     $data = [
    //         'to' => $user->fcm,
    //         'notification' => [
    //             'title' => 'Order Approval Request',
    //             'body' => 'Request Accepted',
    //         ],
    //         'data' => [
    //             'RequestData' => $body,
    //         ],
    //     ];

    //     $SERVER_API_KEY = 'AAAA8mStLOU:APA91bG29Hc-YamvMsPzrnAlfacdrxs9tqHeUegZv0Aufg3arTrKFCxtT_aEX-lxYJje0G4Yrno2UKAhkdLjWIlNM6bpOu3jmXFx0VrVQvN4mcHNxT94PJPtG1gO_uAFOl6aePQiQhdF';

    //     $dataString = json_encode($data);
    //     // dd($dataString);
    //     $headers = [
    //         'Authorization: key=' . $SERVER_API_KEY,
    //         'Content-Type: application/json',
    //     ];

    //     $ch = curl_init();
    //     curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
    //     curl_setopt($ch, CURLOPT_POST, true);
    //     curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    //     curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    //     curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    //     curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);
    //     $response = curl_exec($ch);
    //     curl_close($ch);
    //     return $response;
    //     return redirect()->back()->with(['status' => true, 'message' => 'Status Updated sucessfully']);

    // }

    public function status($id)
    /*send notification*/
    {
        $order = Order::with('pharmacy', 'orderitem.product')->find($id);
        $code = $order->code;
        $order->update(['status' => $order->status == 'pending' ? 'approved' : 'pending']);

        $selectedData = [
            'order_id' => $id,
            'code' => $code,
            'title' => 'Order Approval',
            'body' => 'Your order has been approved',
            'type' => 'Order Approval'
        ];
        // Save notification to the database
        $notification = new Notification();
        // return $notification;
        $notification->user_id = $order->user_id;
        $notification->pharmacy_id = $order->pharmacy_id;
        $notification->order_id = $id;
        $notification->code = $code;
        $notification->title = "Approval Request";
        $notification->body = 'your order has been approved';
        $notification->type = "Order Approval";
        $notification->seen = 0;
        $notification->save();


        $body = [
            'order_id' => $id,
            'code' => $code,
            'title' => 'Order Approval',
            'body' => 'Your order has been approved',
            'type' => 'Order Approval',
            'id' => $notification->id,
        ];

        // return $body;

        $user = User::where('id', $order->user_id)->first();

        $data = [
            'to' => $user->fcm,
            'notification' => [
                'order_id' => $id,
                'code' => $code,
                'title' => 'Order Approval',
                'body' => 'Your order has been approved',
                'type' => 'Order Approval'
            ],
            'data' => [
                'RequestData' => $body,
            ],
        ];
        // return $data;

        $SERVER_API_KEY = 'AAAA8mStLOU:APA91bG29Hc-YamvMsPzrnAlfacdrxs9tqHeUegZv0Aufg3arTrKFCxtT_aEX-lxYJje0G4Yrno2UKAhkdLjWIlNM6bpOu3jmXFx0VrVQvN4mcHNxT94PJPtG1gO_uAFOl6aePQiQhdF';

        $dataString = json_encode($data);
        $headers = [
            'Authorization: key=' . $SERVER_API_KEY,
            'Content-Type: application/json',
        ];
        // return $headers;

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);
        $response = curl_exec($ch);
        curl_close($ch);

        // Redirect back with a success message
        return redirect()->back()->with(['status' => true, 'message' => 'Status Updated successfully']);
    }


}
