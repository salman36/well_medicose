<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'pharmacy_id',
        'category_id',
        'sub_category_id',
        'brand_id',
        'price',
        'stock',
        'description',
        'type',
        'image',
        'is_active',
     ];
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    public function subCategory()
    {
        return $this->belongsTo(SubCategory::class);
    }
    public function brand()
    {
        return $this->belongsTo(Brand::class , 'brand_id' , 'id');
    }

    public function productDetail(){

        return $this->hasMany(ProductDetail::class, 'product_id');

     }
     public function pharmacy()
     {
         return $this->belongsTo(Pharmacy::class,'pharmacy_id','id');
     }

     public function offerProduct()
     {
        return $this->hasMany(OfferProduct::class,'product_id');
     }

     public function productInstruction()
     {
        return $this->hasMany(ProductInstruction::class,'product_id');
     }

    public function orderItem()
    {
        return $this->hasMany(OrderItem::class, 'product_id');
    }
}
