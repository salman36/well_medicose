<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;
    protected $fillable = [
        'order_id', 'product_id','price','quantity','sub_total','total','discount_price'
    ];
    public function order()
    {
        return $this->belongsTo(Oreder::class, 'order_id','id');
    }
    public function product()
    {
        return $this->belongsTo(Product::class , 'product_id','id');
    }

    public function productDetail()
    {
        return $this->belongsTo(ProductDetail::class, 'product_detail_id');
    }
}
