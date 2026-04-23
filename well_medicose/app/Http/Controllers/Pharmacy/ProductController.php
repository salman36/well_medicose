<?php

namespace App\Http\Controllers\Pharmacy;

use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use App\Models\Pharmacy;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use App\Models\ProductDetail;
use App\Models\ProductInstruction;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        /*display all product in index page */

        $pharmacy = Auth::guard('pharmacy')->id();
        $product = Product::where('pharmacy_id', $pharmacy)->with('category', 'subCategory', 'brand')->orderBy('id', 'DESC')->get();
        return view('pharmacy.product.index', compact('product'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        /*when create product then get Category, Pharmacy,Brand,SubCategory */
        $categories = Category::all();
        $subCategory = SubCategory::all();
        $brand = Brand::all();
        $pharmacies = Pharmacy::all();
        return view('pharmacy.product.create', compact('categories', 'subCategory', 'brand', 'pharmacies'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function store(Request $request)
    {
        $pharmacy = Pharmacy::find(Auth::guard('pharmacy')->id());
        // return $pharmacy;
        $dueDate = $pharmacy->subscription;
        // return $dueDate;
        $currentDate = date('d-m-Y');
        // return $currentDate;

        if ($dueDate >= $currentDate) {
            return redirect()->back()->with(['status' => false, 'message' => 'Package has expired.']);
        } else {
            $request->validate([
                'name' => 'required',
                'category_id' => 'required',
                'sub_category_id' => 'required',
                'type' => 'required',
                'image' => 'required|image'
            ]);
            if ($request->hasFile('image')) {
                $file = $request->file('image');
                $extension = $file->getClientOriginalExtension();
                $filename = time() . '.' . $extension;
                $file->move(public_path('admin/assets/images/users/'), $filename);
                $image = 'public/admin/assets/images/users/' . $filename;
            } else {
                $image = 'public/admin/assets/images/users/1675332882.jpg';
            }
            /*save data in productInstruction table */
            $title = $request->input('title', []);
            $description = $request->input('description', []);

            /*save data in product table */
            $product = Product::create([
                'name' => $request->name,
                'category_id' => $request->category_id,
                'sub_category_id' => $request->sub_category_id,
                'brand_id' => $request->brand_id,
                'type' => $request->type,
                'pharmacy_id' => $pharmacy->id,
                'image' => $image,
                'is_active' => '0',
            ]);

            /*get request product detail */
            $units = $request->units;
            $quantities = $request->quantity;
            $prices = $request->price;
            $discount = $request->discount;
            $totalStocks = $request->total_stock;

            /* save product detail */
            for ($i = 0; $i < count($units); $i++) {
                $productDetail = new ProductDetail();
                $productDetail->product_id = $product->id;
                $productDetail->units = $units[$i];
                $productDetail->quantity = $quantities[$i];
                $productDetail->price = $prices[$i];
                $productDetail->discount = $discount[$i];
                $productDetail->total_stock = $totalStocks[$i];
                $productDetail->save();

                /* save product instruction */
                if (isset($title[$i]) && isset($description[$i])) {
                    $productInstruction = new ProductInstruction();
                    $productInstruction->product_id = $product->id;
                    $productInstruction->title = $title[$i];
                    // Ensure the description does not exceed 255 characters
                    $productInstruction->description = substr($description[$i], 0, 255);
                    $productInstruction->save();
                }

            }

            return redirect()->route('pharmacy.pharmacyproduct.index')->with(['status' => true, 'message' => 'Created Successfully']);
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
        /*show product in model*/

        $data = Product::with('category', 'subCategory', 'brand', 'productDetail', 'pharmacy', 'productInstruction')->find($request->id);
        $product = view('pharmacy.product.model', compact('data'))->render();
        return response()->json($product);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    /*edit product */
    public function edit($id)
    {
        $product = Product::with('productDetail', 'productInstruction')->find($id);
        $categories = Category::all();
        $subCategories = SubCategory::where('category_id', $product->category_id)->get();
        $brands = Brand::all();
        $pharmacies = Pharmacy::all();
        return view('pharmacy.product.edit', compact('product', 'categories', 'subCategories', 'brands', 'pharmacies'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    /*update product */
    public function update(Request $request, $id)
    {
        // return $request;
        $request->validate([
            'name' => 'required',
            'category_id' => 'required',
            'sub_category_id' => 'required',
            'price' => 'required|array',
            'total_stock' => 'required|array',
            'units' => 'required|array',
            'quantity' => 'required|array',
            'type' => 'required',
            'price.*' => 'required',
            'total_stock.*' => 'required',
            'units.*' => 'required',
            'quantity.*' => 'required',
        ]);
        // return $request;

        $product = Product::find($id);
        $title = $request->input('title', []);
        $description = $request->input('description', []);

        /*when update product instruction then exist data delete */
        $product->productInstruction()->delete();

        if ($request->hasFile('image')) {
            $destination = 'public/admin/assets/img/users/' . $product->image;
            if (File::exists($destination)) {
                File::delete($destination);
            }
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $file->move('public/admin/assets/images/users', $filename);
            $image = 'public/admin/assets/images/users/' . $filename;
            $product->image = $image;
        }

        $product->update([
            'name' => $request->name,
            'category_id' => $request->category_id,
            'sub_category_id' => $request->sub_category_id,
            'brand_id' => $request->brand_id,
            'type' => $request->type,
        ]);

        $units = $request->units;
        $quantities = $request->quantity;
        $prices = $request->price;
        $discount = $request->discount;
        $totalStocks = $request->total_stock;

        // Delete existing product details related to the product
        $product->productDetail()->delete();

        for ($i = 0; $i < count($units); $i++) {
            $productDetail = new ProductDetail();
            $productDetail->product_id = $product->id;
            $productDetail->units = $units[$i];
            $productDetail->quantity = $quantities[$i];
            $productDetail->price = $prices[$i];
            $productDetail->discount = $discount[$i];
            $productDetail->total_stock = $totalStocks[$i];
            $productDetail->save();


            if (isset($title[$i]) && isset($description[$i])) {
                $productInstruction = new ProductInstruction();
                $productInstruction->product_id = $product->id;
                $productInstruction->title = $title[$i];
                // Ensure the description does not exceed 255 characters
                $productInstruction->description = substr($description[$i], 0, 255);
                $productInstruction->save();
            }
        }
        return redirect()->route('pharmacy.pharmacyproduct.index')->with(['status' => true, 'message' => 'Updated Successfully']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Product::destroy($id);
        return redirect()->route('pharmacy.pharmacyproduct.index')->with(['status' => true, 'message' => 'Deleted Successfully']);
    }
    public function status($id)
    {
        /*update status */

        $product = Product::find($id);
        $product->update(['is_active' => $product->is_active == 0 ? '1' : '0']);
        return redirect()->back()->with(['status' => true, 'message' => 'Status Updated sucessfully']);
    }

    /*get subCategory against category when product add*/
    public function getSubCategory(Request $request)
    {
        $data['SubCategory'] = SubCategory::where("category_id", $request->category_id)->get();
        return response()->json($data);
    }

     /*get subCategory against category when product edit*/
    public function getSubCategories(Request $request, $id)
    {
        $subCategory = SubCategory::where('category_id', $request->category_id)->get();
        return response()->json($subCategory);
    }
}
