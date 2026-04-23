<?php

namespace App\Http\Controllers\Admin;

use App\Models\Product;
use App\Models\Pharmacy;
use App\Models\OfferProduct;
use Illuminate\Http\Request;
use App\Mail\FeaturedProductMail;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;

class OfferProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $productIds = OfferProduct::pluck('product_id');
        $products = Product::with('category', 'subCategory', 'brand', 'pharmacy', 'offerProduct')->whereIn('id', $productIds)->orderBy('id', 'DESC')->get();
        return view('admin.offerProduct.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $pharmacies = Pharmacy::all();
        return view('admin.offerProduct.create', compact('pharmacies'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required',
            'date' => 'required',
        ]);
        $product = OfferProduct::where('product_id', $request->product_id)->first();
        // return $product;
        if ($product) {
            // Product already exists, update the date
            $product->update(['date' => $request->date]);
        } else {
            // Product does not exist, create a new record
            $product = OfferProduct::create([
                'product_id' => $request->product_id,
                'date' => $request->date,
            ]);
        }
        if ($product->wasRecentlyCreated) {
            $pharmacy = Pharmacy::find($request->pharmacy_id);
            $pharmacyEmail = $pharmacy->email;
            Mail::to($pharmacyEmail)->send(new FeaturedProductMail($product));
            return redirect()->route('offerProduct.index')->with(['status' => true, 'message' => 'Created Successfully']);
        } else {
            return redirect()->route('offerProduct.index')->with(['status' => false, 'message' => 'Product Already Featured']);
        }

    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $data = Product::with('category', 'subCategory', 'brand', 'productDetail', 'pharmacy', 'offerProduct','productInstruction')->find($request->id);
        $product = view('admin.offerProduct.model', compact('data'))->render();
        return response()->json($product);
    }

    /**
     * Show the form for editing the specified resource.
     *
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        OfferProduct::where('product_id', $id)->delete();
        return redirect()->route('offerProduct.index')->with(['status ' => true, 'message' => 'Deleted Successfully']);
    }

    public function getProduct(Request $request)
    {

        $product = Product::where('pharmacy_id', $request->pharmacy_id)->get();
        // return $product;
        return response()->json($product);
    }
}
