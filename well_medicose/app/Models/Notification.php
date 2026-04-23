<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'pharmacy_id',
        'order_id',
        'code',
        'title',
        'body',
        'seen',
        'type'
    ];

    public function users(){

        return $this->belongsTo(User::class,'pharmacy_id','id');
    }
    public function pharmacy()
     {
         return $this->belongsTo(Pharmacy::class,'pharmacy_id','id');
     }
     public function order()
     {
         return $this->belongsTo(Order::class);
     }

}
