<?php

namespace App\Http\Controllers\Api;

use App\Models\Product;
use App\Models\OfferProduct;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FeaturedProductController extends Controller
{
    public function getfeaturedProduct()
    {
        $featuredId= OfferProduct::with('product')->pluck('product_id');
        $products = Product::with('productDetail')->whereIn('id', $featuredId)->get();

        return response()->json([
            'status' => true,
            'product' => $products,
        ], 200);
    }
}
