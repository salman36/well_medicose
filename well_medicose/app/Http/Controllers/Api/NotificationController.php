<?php

namespace App\Http\Controllers\Api;

use App\Models\Order;
use App\Models\Notification;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


class NotificationController extends Controller
{
    public function getNotification(){
        $notifications = Notification::all();
        return response()->json($notifications);
    }

    public function seenNotification($id)
    {
        $notification = Notification::find($id);

        if (!$notification) {
            return response()->json(['error' => 'Notification not found'], 404);
        }

        $notification->update(['seen' => 1]);

        return response()->json(['message' => 'Notification marked as seen']);
    }
}
