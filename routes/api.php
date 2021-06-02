<?php

use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\ProductCategoryController;
use App\Http\Controllers\Api\ProductController;
use Illuminate\Http\Request;
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
Route::group(array('prefix' => '/v1'), function () {
    Route::resource('/users', UserController::class);
    Route::resource('/customers', CustomerController::class);
    Route::resource('/product/categories', ProductCategoryController::class);
    Route::resource('/products', ProductController::class);
});
