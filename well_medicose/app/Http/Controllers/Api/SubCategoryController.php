<?php

namespace App\Http\Controllers\Api;

use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SubCategoryController extends Controller
{
    public function getSubcategories()
    {
        $categories = Category::with('subCategory')->get();
        return response()->json([
            'categories' => $categories,

        ]);
    }
}
