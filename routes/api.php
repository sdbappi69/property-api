<?php

use App\Http\Controllers\Api\Oauth\LoginController;
use App\Http\Controllers\Api\PermissionController;
use App\Http\Controllers\Api\RoleController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\ProductCategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\CurrencyController;
use App\Http\Controllers\Api\InvoiceController;
use App\Http\Controllers\Api\QuotationController;
use App\Http\Controllers\Api\ExpenseCategoryController;
use App\Http\Controllers\Api\ExpenseController;
use App\Http\Controllers\Api\PaymentController;
use App\Http\Controllers\Api\CompanyController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


/*
|--------------------------------------------------------------------------
| Authentication routes
|--------------------------------------------------------------------------
|
|  Routes to obtain access_token and manage token refresh
|
*/
Route::group(array('prefix' => '/v1'), function () {
    Route::post('/login', [LoginController::class, 'login']);
    Route::post('/login/refresh', [LoginController::class, 'refresh']);
});

/*
|--------------------------------------------------------------------------
| Protected system routes
|--------------------------------------------------------------------------
|
| For both admin users and customers
|
*/
Route::prefix('v1')->middleware(['auth:api,customers', 'throttle:60,1'])->group(function () {

    Route::resource('/users', UserController::class);
    Route::resource('/customers', CustomerController::class);
    Route::resource('/product/categories', ProductCategoryController::class);
    Route::resource('/products', ProductController::class);
    Route::resource('/currencies', CurrencyController::class);
    Route::resource('/invoices', InvoiceController::class);
    Route::resource('/quotations', QuotationController::class);
    Route::resource('/expenses/categories', ExpenseCategoryController::class);
    Route::resource('/expenses', ExpenseController::class);
    Route::resource('/payments', PaymentController::class);
    Route::resource('/companies', CompanyController::class);

    Route::resource('roles', RoleController::class)->except(['create', 'edit']);
    // ->middleware(['scope:test1']);

    Route::resource('permissions', PermissionController::class)->except(['create', 'edit']);
    // ->middleware(['scope:test1']);
});



// Unprotected routes
// Dev only
//TODO  - remove this section on production launch
Route::group(array('prefix' => '/v0'), function () {
    Route::resource('/users', UserController::class);
    Route::resource('/customers', CustomerController::class);
    Route::resource('/product/categories', ProductCategoryController::class);
    Route::resource('/products', ProductController::class);
    Route::resource('/currencies', CurrencyController::class);
    Route::resource('/invoices', InvoiceController::class);
    Route::resource('/quotations', QuotationController::class);
    Route::resource('/expenses/categories', ExpenseCategoryController::class);
    Route::resource('/expenses', ExpenseController::class);
    Route::resource('/payments', PaymentController::class);
    Route::resource('/companies', CompanyController::class);

    Route::resource('roles', RoleController::class)->except(['create', 'edit']);
       // ->middleware(['scope:test1']);

    Route::resource('permissions', PermissionController::class)->except(['create', 'edit']);
       // ->middleware(['scope:test1']);
});
