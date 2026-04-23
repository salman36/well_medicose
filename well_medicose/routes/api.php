<?php

use Illuminate\Http\Request;
use App\Models\ProductDetail;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\PharmacyController;
use App\Http\Controllers\Api\SubCategoryController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\ProductDetailController;
use App\Http\Controllers\Api\FeaturedProductController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */


Route::group(['namespace' => 'Api'], function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
    Route::post('forgotPassword', [AuthController::class, 'forgotPassword']);
    Route::post('confirmToken', [AuthController::class, 'confirmToken']);
    Route::post('resetPassword', [AuthController::class, 'changePassword']);


    // Route::get('notification', 'AuthController@notification');

    // Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    //     Route::get('logout',[AuthController::class,'logout']);
    //     // return $request->user();
    // });

    Route::group(['middleware' => 'userApi'], function () {
        Route::get('/pharmacies', [PharmacyController::class, 'getallPharmacies']);
        Route::get('/pharmacy/{id}', [PharmacyController::class, 'getpharmacy']);
        Route::get('/categories/{id}', [PharmacyController::class, 'categories']);
        Route::post('/subCategory', [PharmacyController::class, 'subcategories']);
        Route::get('brand', [PharmacyController::class, 'getBrand']);
        Route::get('brandProduct/{id}', [PharmacyController::class, 'getbrandProduct']);
        Route::post('nearByPharmacy', [PharmacyController::class, 'getNearbyPharmacies']);
        Route::get('featuredProduct', [FeaturedProductController::class, 'getfeaturedProduct']);
        Route::get('productDetail/{id}', [ProductDetailController::class, 'getProductDetail']);
        Route::get('category', [CategoryController::class, 'getcategory']);
        Route::get('subcategories', [SubCategoryController::class, 'getSubcategories']);
        Route::post('changepassword', [ProfileController::class, 'changePassword']);
        Route::get('getprofile', [ProfileController::class, 'show']);
        Route::post('updateprofile', [ProfileController::class, 'update']);
        Route::get('logout', [AuthController::class, 'logout']);
        Route::post('/create-order', [OrderController::class, 'store']);
        Route::get('/allOrder', [OrderController::class, 'getallOrder']);
        Route::get('/accountDetail/{id}', [PharmacyController::class, 'getaccountDetail']);
        Route::get('/searchProduct/{name}', [PharmacyController::class, 'searchProduct']);
        Route::post('/searchProductInPharmacy', [PharmacyController::class, 'getpharmacyProduct']);
        Route::post('/searchBrandProduct', [PharmacyController::class, 'searchBrandProduct']);
        Route::get('/popularPharmacy', [PharmacyController::class, 'getPopularPharmacy'])->name('popularPharmacy');
        Route::get('/notification', [NotificationController::class, 'getNotification']);
        Route::post('/seenNotification/{id}', [NotificationController::class, 'seenNotification']);
    });
});
