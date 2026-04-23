<?php

namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use App\Models\Pharmacy;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use App\Models\AccountDetail;
use App\Models\ProductDetail;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class PharmacyController extends Controller
{
    public function getallPharmacies()
    {
        $pharmacies = Pharmacy::all();
        return response()->json($pharmacies);
    }
    public function getpharmacy($id)
    {
        $pharmacy = Pharmacy::find($id);
        $categoryIds = Product::where('pharmacy_id', $id)->distinct()->pluck('category_id');
        if (!empty($categoryIds[0])) {
            $categories = Category::whereIn('id', $categoryIds)->get();
            $subCategoryIds = Product::where([['pharmacy_id', $id], ['category_id', $categoryIds[0]]])->distinct()->pluck('sub_category_id');
            $subCategories = SubCategory::whereIn('id', $subCategoryIds)->get();
            $products = Product::with('productDetail')->where('pharmacy_id', $id)->where('sub_category_id', $subCategoryIds[0])->get();

            $openingTime = Carbon::parse($pharmacy->opening_time);
            $openingTimeAmPm = $openingTime->format('g:i A');

            $closingTime = Carbon::parse($pharmacy->closing_time);
            $closingTimeAmPm = $closingTime->format('g:i A');

            $currentTime = Carbon::now()->format('g:i A');
            if (Pharmacy::wherebetween($currentTime, [$openingTimeAmPm, $closingTimeAmPm])) {
                $pharmacy->status = 'Open';
            } else {
                $pharmacy->status = 'Closed';
            }


            $data = array('pharmacy' => $pharmacy, 'categories' => $categories, 'subcategory' => $subCategories, 'products' => $products);
        } else {
            $data = array('pharmacy' => $pharmacy, 'categories' => [], 'subcategory' => [], 'products' => []);
        }

        return response()->json([
            'status' => 'Ok',
            'data' => $data,
        ], 200);
    }

    /*get all subCategory against category_id */
    public function categories($id)
    {
        $category = Category::with('subcategory')->find($id);

        return response()->json([
            'status' => 'Ok',
            'category' => $category,
        ], 200);
    }

    /*get product against subcategories_id */
    // public function subcategories($id)
    // {
    //     $subcategory = SubCategory::with('product.productDetail')->find($id);
    //     return response()->json($subcategory);

    // }
    public function subcategories(Request $request)
    {
        $data = $request;
        // Ensure that both the pharmacy_id and subcategory_id are present in the request data.
        if (!isset($data['pharmacy_id']) || !isset($data['subcategory_id'])) {
            return response()->json(['error' => 'Both pharmacy_id and subcategory_id are required.'], 400);
        }

        $pharmacyId = $data['pharmacy_id'];
        $subcategoryId = $data['subcategory_id'];

        // Find the SubCategory with the given ID and load related products and product details,
        // but filter products based on the pharmacy ID.
        $subcategory = SubCategory::with([
            'product' => function ($query) use ($pharmacyId) {
                $query->where('pharmacy_id', $pharmacyId);
            },
            'product.productDetail'
        ])->find($subcategoryId);

        return response()->json($subcategory);
    }


    /*get product against subcategories_id */
    public function products($id)
    {
        $subcategory = SubCategory::find($id);
        $products = $subcategory->products;
        return response()->json($products);
    }

    /*get near by pharmacy */
    public function getNearbyPharmacies(Request $request)
    {
        $latitude = $request->input('latitude');
        $longitude = $request->input('longitude');

        $nearbyPharmacies = Pharmacy::selectRaw(

            'pharmacies.*, ( 6371 * acos( cos( radians(?) ) *
            cos( radians( latitude ) )
            * cos( radians( longitude ) - radians(?)
            ) + sin( radians(?) ) *
            sin( radians( latitude ) ) )
        ) AS distance',
            [$latitude, $longitude, $latitude]
        )
            ->having('distance', '<=', 20) // Adjust the distance as needed
            ->orderBy('distance')
            ->get();

        foreach ($nearbyPharmacies as $pharmacy) {

            $openingTime = Carbon::parse($pharmacy->opening_time);
            $openingTimeAmPm = $openingTime->format('g:i A');

            $closingTime = Carbon::parse($pharmacy->closing_time);
            $closingTimeAmPm = $closingTime->format('g:i A');

            $currentTime = Carbon::now()->format('g:i A');
            if (Pharmacy::wherebetween($currentTime, [$openingTimeAmPm, $closingTimeAmPm])) {
                $pharmacy->status = 'Open';
            } else {
                $pharmacy->status = 'Closed';
            }
        }
        return response()->json(['data' => $nearbyPharmacies]);
    }


    public function getBrand()
    {
        $brand = Brand::all();
        return response()->json(['data' => $brand]);
    }

    /*get all product against brand id */
    public function getbrandProduct($id)
    {
        $brandProduct = Product::with('productDetail')->where('brand_id', $id)->get();

        return response()->json(['data' => $brandProduct]);
    }

    /*get accountDetail against Pharmacy_id */
    public function getaccountDetail($id)
    {
        $account = AccountDetail::where('pharmacy_id', $id)->get();

        return response()->json(['data' => $account]);
    }

    /*search all pruduct with name and lowest price against allpharmacy*/
    public function searchProduct($name)
    {
        $result = Product::with([
            'productDetail' => function ($query) {
                $query->select('product_id', 'units', 'price', 'quantity', 'discount')->orderBy('price', 'asc');
            }
        ])
            ->where('name', 'LIKE', '%' . $name . '%')
            ->get();

        if ($result->isNotEmpty()) {
            // Sorting the collection by the lowest price using a custom callback
            $result = $result->sortBy(function ($product) {
                return $product->productDetail->first()->price;
            });

            return response()->json(['product' => $result->values()]);
        } else {
            return response()->json(['product' => []]);
        }
    }

    /*search all pruduct with name against pharmacy id*/
    public function getpharmacyProduct(Request $request)
    {
        $name = $request->input('name');
        $pharmacyId = $request->input('id');

        if (empty($pharmacyId) || empty($name)) {
            return response()->json(['products' => []]);
        }

        $products = Product::with('productDetail')->whereHas('pharmacy', function ($query) use ($pharmacyId) {
            $query->where('id', $pharmacyId);
        })->where('name', 'LIKE', '%' . $name . '%')->get();

        return response()->json(['product' => $products->values()]);

    }

    /*search all pruduct with name against brand id*/
    public function searchBrandProduct(Request $request)
    {
        $name = $request->input('name');
        $brandId = $request->input('id');

        if (empty($brandId) || empty($name)) {
            return response()->json(['products' => []]);
        }

        $products = Product::with('productDetail')->whereHas('brand', function ($query) use ($brandId) {
            $query->where('id', $brandId);
        })->where('name', 'LIKE', '%' . $name . '%')->get();

        return response()->json(['product' => $products->values()]);

    }

    /*get all popular pharmacy againas order*/
    public function getPopularPharmacy()
    {
        $popularPharmacies = Pharmacy::where('status', 1)->get();
        return response()->json(['popular_pharmacies' => $popularPharmacies]);

    }

}
