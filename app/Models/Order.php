<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = [
        'code', 'user_id', 'pharmacy_id','status','image','payment','total_amount'
    ];
    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }
    public function pharmacy()
    {
        return $this->belongsTo(Pharmacy::class,'pharmacy_id','id');
    }
    public function orderItem()
    {
        return $this->hasMany(OrderItem::class,'order_id','id');
    }
    public function notification()
    {
        return $this->hasOne(Notification::class,'order_id');
    }
}
