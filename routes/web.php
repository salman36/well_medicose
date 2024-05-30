<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\FaqController;
use App\Http\Controllers\Admin\AuthController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\PolicyController;
use App\Http\Controllers\Admin\AboutusController;
use App\Http\Controllers\Admin\PackageController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Pharmacy\OrderController;
use App\Http\Controllers\Pharmacy\ReportController;
use App\Http\Controllers\Pharmacy\EarningController;
use App\Http\Controllers\Pharmacy\ProfileController;
use App\Http\Controllers\Admin\SubCategoryController;
use App\Http\Controllers\Admin\OfferProductController;
use App\Http\Controllers\Pharmacy\DashboardController;
use App\Http\Controllers\Admin\TermConditionController;
use App\Http\Controllers\Admin\PharmacyEarningReportController;
use App\Http\Controllers\Pharmacy\FaqController as PharmacyFaqController;
use App\Http\Controllers\Pharmacy\AuthController as PharmacyAuthController;
use App\Http\Controllers\Admin\PharmacyController as AdminPharmacyController;
use App\Http\Controllers\Pharmacy\AboutusController as PharmacyAboutController;
use App\Http\Controllers\Pharmacy\PolicyController as PharmacyPolicyController;
use App\Http\Controllers\Pharmacy\PackageController as PharmacyPackageController;
use App\Http\Controllers\Pharmacy\ProductController as PharmacyProductController;
use App\Http\Controllers\Pharmacy\TermConditionController as PharmacyTermConditionController;

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

Route::get('/', function () {
    return redirect()->route('login');
});

// for hit cron job on live
Route::get('/cron_job', function () {
    Artisan::call('schedule:work');
});

/*
Admin routes
* */
Route::get('/admin-auth', [AuthController::class, 'getLoginPage']);
Route::post('admin/login', [AuthController::class, 'Login']);
Route::get('/admin-forgot-password', [AdminController::class, 'forgetPassword']);
Route::post('/admin-reset-password-link', [AdminController::class, 'adminResetPasswordLink']);
Route::get('/change_password/{id}', [AdminController::class, 'change_password']);
Route::post('/admin-reset-password', [AdminController::class, 'ResetPassword']);


Route::prefix('admin')->middleware('admin')->group(function () {
    Route::get('dashboard', [AdminController::class, 'getdashboard']);
    Route::get('profile', [AdminController::class, 'getProfile']);
    Route::post('update-profile', [AdminController::class, 'update_profile']);
    Route::get('logout', [AdminController::class, 'logout']);
    /**user */
    Route::get('user/status/{id}', [UserController::class, 'status'])->name('user.status');
    /**pharmacy */
    Route::get('pharmacy/status/{id}', [AdminPharmacyController::class, 'status'])->name('pharmacy.status');
    /**pharmacy */


    /** resource controller */
    Route::resource('user', UserController::class);
    Route::resource('pharmacy', AdminPharmacyController::class);
    Route::resource('category', CategoryController::class);
    Route::resource('subCategory', SubCategoryController::class);
    Route::resource('brand', BrandController::class);
    Route::resource('product', ProductController::class);
    Route::resource('package', PackageController::class);
    Route::resource('offerProduct', OfferProductController::class);
    Route::post('get-Products-by-Pharmacy', [OfferProductController::class, 'getProduct'])->name('get-Products-by-Pharmacy');
    Route::get('product/status/{id}', [ProductController::class, 'status'])->name('products.status');
    Route::get('get-subcategory', [ProductController::class, 'getSubCategory']);
    Route::get('/get-subcategories/{id}', [ProductController::class, 'getSubCategories']);

    Route::resource('about', AboutusController::class);
    Route::resource('policy', PolicyController::class);
    Route::resource('terms', TermConditionController::class);
    Route::resource('faq', FaqController::class);
    Route::get('index' ,[PharmacyEarningReportController::class , 'index'])->name('index');
    Route::get('index/report/{id}' ,[PharmacyEarningReportController::class , 'getReports'])->name('getReports');

});
/*
pharmacy Auth routes
* */
Route::get('login', [PharmacyAuthController::class, 'getlogin'])->name('login');
Route::get('registerpage', [PharmacyAuthController::class, 'index'])->name('registerpage');
Route::post('register', [PharmacyAuthController::class, 'register'])->name('register');
Route::post('loginpharmacy', [PharmacyAuthController::class, 'login'])->name('loginpharmacy');
Route::get('pharmacy-forgot-password', [PharmacyAuthController::class, 'forgetPassword'])->name('pharmacy-forgot-password');
Route::post('/pharmacy-reset-password-link', [PharmacyAuthController::class, 'pharmacyResetPasswordLink']);
Route::get('/pharmacy-change-password/{id}', [PharmacyAuthController::class, 'change_password']);
Route::post('/pharmacy-reset-password', [PharmacyAuthController::class, 'ResetPassword']);
/*
pharmacy routes
* */
Route::group(['prefix' => 'pharmacy', 'middleware' => 'pharmacy', 'as' => 'pharmacy.'], function () {
    Route::get('pharmacy-dashboard', [PharmacyAuthController::class, 'show'])->name('pharmacydashboard');
    Route::get('logout', [ProfileController::class, 'logout'])->name('logout');
    Route::get('pharmacy-profile', [ProfileController::class, 'getProfile'])->name('pharmacy-profile');
    Route::post('pharmacy-update-profile', [ProfileController::class, 'update_profile']);
    Route::post('accountDetail',[ProfileController::class,'store'])->name('account_detail.store');
    Route::post('editaccount/{id}',[ProfileController::class,'update'])->name('account_detail.update');
    Route::get('package',[PharmacyPackageController::class,'create'])->name('package');
    Route::post('/purchase-package',[PharmacyPackageController::class,'purchase'])->name('purchase.package');


    Route::resource('pharmacyproduct', PharmacyProductController::class);
    Route::resource('about', PharmacyAboutController::class);
    Route::resource('policy',PharmacyPolicyController::class);
    Route::resource('terms',PharmacyTermConditionController::class);
    Route::resource('faq', PharmacyFaqController::class);

    Route::post('get-subcategory-by-category', [PharmacyProductController::class, 'getSubCategory']);
    Route::get('/get-subcategories/{id}', [PharmacyProductController::class, 'getSubCategories']);
    Route::get('product/status/{id}', [PharmacyProductController::class, 'status'])->name('product.status');
    Route::get('order', [OrderController::class, 'index'])->name('order');
    Route::get('orderStatus/{id}', [OrderController::class, 'status'])->name('orderStatus');
    Route::get('orderProduct', [OrderController::class, 'show'])->name('orderProduct');
    Route::get('earningHistory', [EarningController::class, 'getEarning'])->name('earningHistory');
    Route::get('reports', [ReportController::class, 'getReports'])->name('reports');
});


