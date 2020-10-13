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

//home page management
Route::get('/','HomeController@index');


//Controls order by Admin of the company
Route::get('/admin/admin-login','AdminController@index');
Route::post('/admin','AdminController@dashboard');
Route::get('/admin-logout','AdminController@adminLogout');



//Auth::routes();

Route::group(['middleware' => 'AdminAuth'], function () {

    //Route::get('/dashboard','AdminController@showAdminDashboard');
    Route::post('admin-dashboard', 'AdminController@dashboard');
	
	//Category
	Route::get('/add-category', 'CategoryController@addCategory');
    Route::post('/save-category','CategoryController@saveCategory');
    Route::get('/manage-category', 'CategoryController@manageCategory');
    Route::get('/edit-category/{edit_id}', 'CategoryController@editCategory');
    Route::post('/update-category', 'CategoryController@updateCategory');
    Route::get('/delete-category/{id}', 'CategoryController@deleteCategory');
    Route::get('/active-category/{id}', 'CategoryController@activeCategory');
    Route::get('/deactive-category/{id}', 'CategoryController@deactiveCategory');
	
    //Sub Category
    Route::get('/add-sub-category', 'SubCategoryController@addSubCategory');
    Route::post('/save-sub-category','SubCategoryController@saveSubCategory');
    Route::get('/manage-sub-category', 'SubCategoryController@manageSubCategory');
    Route::get('/edit-sub-category/{edit_id}', 'SubCategoryController@editSubCategory');
    Route::post('/update-sub-category', 'SubCategoryController@updateSubCategory');
    Route::get('/delete-sub-category/{id}', 'SubCategoryController@deleteSubCategory');
    Route::get('/active-sub-category/{id}', 'SubCategoryController@activeSubCategory');
    Route::get('/deactive-sub-category/{id}', 'SubCategoryController@deactiveSubCategory');

    //Brand
    Route::get('/add-brand', 'BrandController@addBrand');
    Route::post('/save-brand','BrandController@saveBrand');
    Route::get('/manage-brand', 'BrandController@manageBrand');
    Route::get('/edit-brand/{edit_id}', 'BrandController@editBrand');
    Route::post('/update-brand', 'BrandController@updateBrand');
    Route::get('/delete-brand/{id}', 'BrandController@deleteBrand');
    Route::get('/active-brand/{id}', 'BrandController@activeBrand');
    Route::get('/deactive-brand/{id}', 'BrandController@deactiveBrand');

    //Product
    Route::get('/add-product', 'ProductController@addProduct');
    Route::post('/save-product', 'ProductController@saveProduct');
    Route::get('/manage-product', 'ProductController@manageProduct');
    Route::get('/manage-allpublished-product', 'ProductController@manageAllPublishedProduct');
    Route::get('/manage-allunpublished-product', 'ProductController@manageAllUnpublishedProduct');
    Route::get('/edit-product/{product_id}', 'ProductController@editProduct');
    Route::post('/update-product', 'ProductController@updateProduct');
    Route::get('/delete-product/{product_id}', 'ProductController@deleteProduct');
    Route::get('/view-product-admin/{product_id}', 'ProductController@viewProduct');
    Route::get('/active-product/{id}', 'ProductController@activeProduct');
    Route::get('/deactive-product/{id}', 'ProductController@deactiveProduct');
    Route::get('/do-pdf-published-product/{id}','ProductController@doPublishedProductPdf');
    Route::get('/do-pdf-unpublished-product/{id}','ProductController@doUnpublishedProductPdf');

    //Order Manage by Admin
    Route::get('/manage-order', 'OrderController@manageOrder');
    Route::get('/request-order', 'OrderController@requestOrder');
    Route::get('/view-request-order/{order_id}', 'OrderController@viewRequestOrder');
    Route::get('/view-shipping-order/{order_id}', 'OrderController@viewShippingOrder');
    Route::get('/view-payment-order/{order_id}', 'OrderController@viewPaymentOrder');
    Route::get('/view-served-order/{order_id}', 'OrderController@viewServedOrder');
    Route::post('/update-order', 'OrderController@updateOrder');
    Route::get('/shipping-order', 'OrderController@showShippingOrder');
    Route::get('/payment-order', 'OrderController@showPaymentOrder');
    Route::get('/confirm-order/{order_id}', 'OrderController@confirmOrder');
    Route::get('/confirm-shipping-order/{order_id}', 'OrderController@confirmShippingOrder');
    Route::get('/confirm-payment-order/{order_id}', 'OrderController@confirmPaymentOrder');
    Route::get('/delete-order/{order_id}', 'OrderController@deleteOrder');
    Route::get('/do-pdf/{order_id}','OrderController@doPdf');


    //Corporate order request by admin side
    Route::get('/corporate-order-request', 'CorporateOrderController@corporateOrderRequest');
    Route::get('/view-corporate-request-order/{order_id}', 'CorporateOrderController@viewCorporateRequestOrder');
    Route::get('/edit-corporate-order/{order_id}', 'CorporateOrderController@editCorporateRequestOrder');
    Route::post('/update-corporate-order', 'CorporateOrderController@updateCorporateRequestOrder');
    Route::get('/delete-corporate-order/{corporate_order_id}', 'CorporateOrderController@deleteCorporateOrder');
    Route::get('/do-pdf-rfq/{corporate_order_id}','CorporateOrderController@doPdfRfq');



    //Slider
    Route::get('/add-slider', 'SliderController@addSlider');
    Route::post('/save-slider', 'SliderController@saveSlider');
    Route::get('/manage-slider', 'SliderController@manageSlider');
    Route::get('/edit-slider/{slider_id}', 'SliderController@editSlider');
    Route::post('/update-slider', 'SliderController@updateSlider');
    Route::get('/delete-slider/{slider_id}', 'SliderController@deleteSlider');
// -- ADMIN PANEL TASK END -- //
});


//CUSTOMER SIDE ROUTES
//Products by category and brand

Route::get('/product_by_sub_category/{sub_category_id}', 'HomeController@showProductsBySubCategory');
Route::get('/product_by_brand/{brand_id}', 'HomeController@showProductsByBrand');
Route::get('/view-product/{product_id}', 'HomeController@viewProduct');
//
Route::get('/show_recommended_products', 'HomeController@showRecommendedProducts');
Route::get('/show_trending_products', 'HomeController@showTrendingProducts');
Route::get('/show_offer_products', 'HomeController@showOfferProducts');
Route::get('/show_products_of_stationery', 'HomeController@showProductsOfStationery');
Route::get('/show_products_of_cleaning', 'HomeController@showProductsOfCleaning');
Route::get('/show_products_of_snacks', 'HomeController@showProductsOfSnacks');
Route::get('/show_products_of_business_gifts', 'HomeController@showProductsOfBusinessGifts');
Route::get('/show_products_of_printing_press', 'HomeController@showProductsOfPrintingPress');

//Cart
Route::get('/add-to-cart/{product_id}', 'CartController@addToCart');
Route::post('/update-cart/{product_id}', 'CartController@updateCart');
Route::get('/delete-cart/{product_id}', 'CartController@deleteCart');
Route::get('/save-to-cart', 'CartController@addToCart');
Route::get('/show-cart', 'CartController@showCart');
Route::get('/checkout', 'CartController@checkout');

//Customer side login / signup / logout
Route::get('/login-check', 'CheckoutController@customerLoginCheck');
Route::get('/customer-registration', 'CheckoutController@showCustomerRegistratioinForm');
Route::post('/customer-registration', 'CheckoutController@customerRegistratioinPost');
Route::get('/customer-logout', 'CheckoutController@customerLogout');
Route::get('/customer-login', 'CheckoutController@customerLoginCheckPost');
Route::get('/customer-profile', 'HomeController@viewCustomerProfile');


//Corporate order client side
Route::get('/corporate-order', 'CorporateOrderController@corporateOrder');
Route::post('/corporate-order', 'CorporateOrderController@postCorporateOrder');

//Corporate order client side
Route::get('/printing-order', 'PrintingOrderController@printingOrder');
Route::post('/printing-order', 'PrintingOrderController@postPrintingOrder');


//Order by Customer
Route::post('/confirm-shipping', 'CheckoutController@orderPlace');
Route::post('/confirm-order', 'CheckoutController@orderPlace');
Route::get('/see-order/{order_id}', 'CheckoutController@seeOrderDetailsByCustomer');
//Route::post('/confirm-order', 'CheckoutController@confirmOrder');

//ABOUT US
Route::get('/aboutus', 'HomeController@seeAboutUs');
Route::get('/policy', 'HomeController@seePolicy');
Route::get('/customerservice', 'HomeController@seeCustomerService');



Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

//SEARCH 
//Route::get('search','SearchController@search')->name('search');
//Route::get('autocomplete','SearchController@autocomplete')->name('autocomplete');

//SEARCH AUTOCOMPLETE
Route::get('/autocomplete','AutocompleteController@index');
Route::post('/autocomplete/fetch','AutocompleteController@fetch')->name('autocomplete.fetch');

Route::get('/search','SearchController@index');
Route::get('/searchPost','HomeController@search');
Route::post('/search','SearchController@searchProducts');