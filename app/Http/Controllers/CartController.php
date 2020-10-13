<?php

namespace App\Http\Controllers;

use Darryldecode\Cart\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use PhpParser\Node\Stmt\Echo_;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{
    public function addToCart(Request $request){

        //dd($request->all());
        $product_id = $request->product_id;


        $product_info = DB::table('tbl_product')
            ->where('product_id',$product_id)
            ->first();

        $product = array();
        $product['id'] = $request->product_id;
        $product['name'] = $request->product_name;
        $product['price'] = $request->product_price;
        $product['quantity'] = $request->quantity;
        $product['attributes'] = $request->product_picture;


        \Cart::add($product);

        /* $total = \Cart::getTotal();

        Session::put('total', $total);
        //\Cart::clear(); */

        //$product_info = \Cart::get();


        //echo $product_info;

        //DB::table('tbl_order')->insert($products_info);

        //return view('pages.add_to_cart',['product_info'=>$product_info]);
        $totalQty = \Cart::getTotalQuantity();
        Session::put('totalQty', $totalQty);
        return redirect()->back();

        //return view('frontEnd.add_to_cart',['product_info'=>$product_info]);

    }

    public function updateCart(Request $request){

        //dd($request->all());
        $product_id = $request->product_id;


        $product_info = DB::table('tbl_product')
            ->where('product_id',$product_id)
            ->first();

        $product = array();
        $product['id'] = $request->product_id;
        $product['name'] = $request->product_name;
        $product['price'] = $request->product_price;
        $product['quantity'] = $request->product_quantity;
        $product['attributes'] = $request->product_picture;

        //print_r($product);

         \Cart::add($product);

        $totalQty = \Cart::getTotalQuantity();
        Session::put('totalQty', $totalQty);
        return redirect()->back();

    }

    public function deleteCart($id){
        \Cart::remove($id);
        $totalQty = \Cart::getTotalQuantity();
        Session::put('totalQty', $totalQty);
        return Redirect::back();
}

    public function showCart(){
        //$all_published_category = DB::table('tbl_category')
          //  ->where('publication_status',1)
          //  ->get();

        $show_cart_items = view('frontEnd.showCart');//->with('all_published_category',$all_published_category);
        return view('layout')->with('frontEnd.showCart',$show_cart_items);


    }

    public function checkout(){
        $all_published_category = DB::table('tbl_category')
            ->where('publication_status',1)
            ->get();
        $check = view('frontEnd.checkout')->with('all_published_category',$all_published_category);
        return view('layout')->with('frontEnd.checkout',$check);
    }
}
