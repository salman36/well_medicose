<?php

namespace App\Http\Controllers\Api;

use App\Models\Order;
use App\Mail\NewOrder;
use App\Models\Product;
use App\Models\Pharmacy;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use App\Models\ProductDetail;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class OrderController extends Controller
{
    public function store(Request $request)
    {
        // return $request;
        if ($request->input('payment') === 'online') {
            if ($request->hasFile('image')) {
                $file = $request->file('image');
                $extension = $file->getClientOriginalExtension();
                $filename = time() . '.' . $extension;
                $file->move(public_path('admin/assets/images/users/'), $filename);
                $image = 'public/admin/assets/images/users/' . $filename;
            }
        } else {
            $image = null;
        }
        // return $request;
        $order = new Order();
        // $order->code = uniqid();
        $order->code = random_int(10000000, 99999999);
        $order->user_id = Auth::guard('api')->id();
        $order->pharmacy_id = $request->input('pharmacy_id');
        $order->status = 'pending';
        $order->image = $image;
        $order->payment = $request->payment;
        $order->save();

        $orderId = $order->id;
        $code = $order->code;
        if (isset($request->product_id)) {

            // for ($i = 0; $i < count($request->product_id); $i++) {
            //     $productDetail = ProductDetail::find($request->product_detail_id[$i]);
            //     $orderItem = new OrderItem();
            //     $orderItem->order_id = $orderId;
            //     $orderItem->product_id = $request->product_id[$i];
            //     $orderItem->product_detail_id = $request->product_detail_id[$i];
            //     $orderItem->quantity = $request->quantity[$i];
            //     $orderItem->price = $productDetail->price;
            //     $totalAmount = $productDetail->price * $request->quantity[$i];
            //     if ($productDetail->discount) {
            //         $orderItem->discount_price = $productDetail->discount;
            //         $discount = $productDetail->discount * $totalAmount / 100;
            //         $orderItem->sub_total = $totalAmount - $discount;
            //     } else {
            //         $orderItem->discount_price = 0;
            //         $orderItem->sub_total = $totalAmount;
            //     }

            //     $orderItem->save();
            // }
            for ($i = 0; $i < count($request->product_id); $i++) {
                $productDetail = ProductDetail::find($request->product_detail_id[$i]);

                // Check if $productDetail is a valid object
                if ($productDetail) {
                    $orderItem = new OrderItem();
                    $orderItem->order_id = $orderId;
                    $orderItem->product_id = $request->product_id[$i];
                    $orderItem->product_detail_id = $request->product_detail_id[$i];
                    $orderItem->quantity = $request->quantity[$i];
                    $orderItem->price = $productDetail->price;
                    $totalAmount = $productDetail->price * $request->quantity[$i];

                    if ($productDetail->discount) {
                        $orderItem->discount_price = $productDetail->discount;
                        $discount = $productDetail->discount * $totalAmount / 100;
                        $orderItem->sub_total = $totalAmount - $discount;
                    } else {
                        $orderItem->discount_price = 0;
                        $orderItem->sub_total = $totalAmount;
                    }

                    $orderItem->save();
                }
            }

            $orderItems = OrderItem::with('product')->where('order_id', $orderId)->get();
            // return $orderItems;
            $total = 0;

            foreach ($orderItems as $item) {
                $total += $item->sub_total;
            }
            $order->total_amount = $total;
            $order->save();
            $user = Auth::guard('api')->user();
            $userName = $user->name;

            $pharmacy = Pharmacy::where('id', $order->pharmacy_id)->first();
            $orderData = [
                'pharmacyName' => $pharmacy->branch_name,
                'userName' => $userName,
                'code' => $order->code,
                'items' => [],
                'totalAmount' => $order->total_amount,
            ];
            // return $orderData ;
            foreach ($orderItems as $orderItem) {
                $product = $orderItem->product;
                $itemData = [
                    'product' => $product->name,
                    'price' => $orderItem->price,
                    'discount' => $orderItem->discount_price,
                    'quantity' => $orderItem->quantity,
                    'subTotal' => $orderItem->sub_total,
                ];
                $orderData['items'][] = $itemData;
                // return $orderData;
            }
            Mail::to($pharmacy->email)->send(new NewOrder($orderData));
            return response()->json(['message' => 'Order created successfully', 'code' => $code], 201);
        }
    }

    public function getallOrder()
    {
        $userId = Auth::guard('api')->id();
        $orders = Order::with([
            'orderItem.product' => function ($query) {
                $query->select('id', 'name', 'image', 'type');
            },
            'orderItem.productDetail' => function ($query) {
                $query->select('id', 'price', 'units', 'quantity');
            }
        ])
            ->where('user_id', $userId)->orderBy('id', 'DESC')
            ->get();
        return response()->json(['order' => $orders]);
    }

}
