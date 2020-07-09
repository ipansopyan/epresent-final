<?php

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('present', 'DosenController@present');

Route::prefix('auth')->group(function () {
    Route::post('register', 'AuthController@register');
    Route::post('login', 'AuthController@login');
    Route::get('refresh', 'AuthController@refresh');
    Route::group(['middleware' => 'auth:api'], function(){
        Route::post('logout', 'AuthController@logout');
    });
});


Route::group(['middleware' => 'auth:api'], function(){  
    // admin
    Route::group(['middleware' => 'admin'], function(){
        Route::get('matkuls', 'MatkulController@index');
        Route::post('matkul/create', 'MatkulController@create');
        Route::put('matkul/{matkul}', 'MatkulController@update');
        Route::delete('matkul/{matkul}', 'MatkulController@destroy');
        Route::get('dosens', 'UserController@dosens');

        Route::get('mhs','UserController@mhs');
        Route::get('dsn','UserController@dsn');
        Route::delete('user/{user}', 'UserController@destroy');
    });
    // route dsn
    Route::group(['middleware' => 'dosen'], function(){
        Route::get('present/{mtkl_id}', 'PresentController@show');
    });    
});










