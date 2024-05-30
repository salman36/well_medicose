<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OfferProduct extends Model
{
    use HasFactory;
    protected $table = 'offer_products';
    protected $fillable = [
        'product_id',
        'date',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
