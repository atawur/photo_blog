<?php

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


Auth::routes();

Route::get('/', 'HomeController@index');
Route::get('/home', 'HomeController@index')->name('home');
Route::post('/get_cities', 'HomeController@gatCities')->name('get_cities');

/*====================================== */
Route::get('/dashboard', 'DashBoardController@index')->name('dashboard');
Route::get('/create_new_user', 'UserController@index');
Route::post('/store', 'UserController@create')->name('store');
Route::get('/send_email', 'UserController@send_email')->name('send_email');

Route::get('/add_new_photo', 'PhotoController@add_photo')->name('add_photo');
Route::post('/create_photo', 'PhotoController@create_photo')->name('create_photo');
Route::get('/all_photos', 'PhotoController@allPhotos')->name('all_photos');
Route::get('/edit_photo/{id}', 'PhotoController@editPhoto')->name('edit_photo');
Route::post('/edit_photo/{id}', 'PhotoController@editPhotoPost')->name('edit_photo.post');


Route::get('/my_collections', 'CollectionController@index')->name('my_collections');
Route::post('/add_to_my_collection', 'CollectionController@add_to_my_collection')->name('add_to_my_collection');

Route::get('/user_collections', 'CollectionController@userCollections')->name('user_collections');
Route::post('/user_search_post', 'CollectionController@userSearch')->name('users_collection.post');
