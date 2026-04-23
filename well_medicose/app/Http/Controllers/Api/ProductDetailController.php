<?php

namespace App\Http\Controllers\Api;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\ProductDetail;
use App\Http\Controllers\Controller;

class ProductDetailController extends Controller
{
    public function getProductDetail($id)
    {
        $products = Product::with('productDetail','productInstruction','pharmacy:id,branch_name,address')->where('id', $id)->find($id);
        return response()->json([
            'status' => 'ok',
            'product' => $products,
        ], 200);

    }

}
