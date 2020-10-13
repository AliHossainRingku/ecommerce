<?php

namespace App\Http\Controllers;

use Darryldecode\Cart\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;

class CheckoutController extends Controller
{
    public function showCustomerRegistratioinForm(){
        return view('frontEnd.customerSignup');
    }
    public function customerRegistratioinPost(Request $request){
        //dd($request->all());
        $customer = array();
        $customer['customer_name'] = $request->customer_name;
        $customer['customer_email'] = $request->customer_email;
        $customer['customer_mobile'] = $request->customer_mobile;
        $customer['customer_password'] = md5($request->customer_password);
        $customer['customer_status'] = 0;

            $customer_id = DB::table('tbl_customer')
                ->insertGetId($customer);

            Session::put('customer_id',$customer_id);
            Session::put('customer_name',$customer['customer_name']);
            Session::put('customer_email',$customer['customer_email']);


        //DB::table('tbl_customer')->insert($customer);
        return redirect('/checkout')->with('msg','Customer info save in database successfully!');

    }

    public function customerLoginCheck(){
        $customer_email = Session::get('customer_email');
        if($customer_email != NULL){
            return redirect('/checkout');
        }
        else{
            return view('frontEnd.customerLogin');
        }
    }

    public function customerLoginCheckPost(Request $request){
        $customer_email = $request->customer_email;
        $customer_password = md5($request->customer_password);

        $user = DB::table('tbl_customer')
            ->select('customer_id','customer_email','customer_password')
            ->where('customer_email',$customer_email)
            ->where('customer_password',$customer_password)
            ->first();
        // If email and password match then....
        if($user){
            $customer_id = $user->customer_id;

            Session::put('customer_email',$customer_email);
            Session::put('customer_id',$customer_id);
            //return redirect('/checkout')->with('msg','Logged in successfully!');
            //echo "Congrats!";
            return redirect('/show-cart');
        }
        else
            return view('frontEnd.customerLogin')->with('msg','Sorry! Please try again.');
        //dd($request->all());
    }


    public function checkout(){
        return view('frontEnd.checkout');
    }

    /* public function confirmShipping(Request $request){
        dd($request->all());//
        $check = view('frontEnd.payment');

        $shipping = array();
        $shipping['shipping_name'] = $request->shipping_name;
        $shipping['shipping_mobile'] = $request->shipping_mobile;
        $shipping['shipping_address'] = $request->shipping_address;
        $shipping['shipping_email'] = $request->shipping_email;

        $shipping_id = DB::table('tbl_shipping')
            ->insertGetId($shipping);

        Session::put('shipping_id',$shipping_id);

        //$check = \Cart::getContent();
        //$cart_content = \Cart::getContent();
        //Session::put('cart_content',$cart_content);


        return view('layout')->with('frontEnd.payment',$check);

        //return view('frontEnd.confirmOrder');


    } */

    /* public function payment(Request $request){
        //dd($request->all());

        return view('frontEnd.payment');
    } */

    public function orderPlace(Request $request){
        //dd($request->all());

        $payment_status = 0;
        $order_status = 0;
        $shipping_status = 0;

        //Inserting into Shipping table
        $shipping = array();
        $shipping['shipping_name'] = $request->shipping_name;
        $shipping['shipping_mobile'] = $request->shipping_mobile;
        $shipping['shipping_address'] = $request->shipping_address;
        $shipping['shipping_email'] = $request->shipping_email;
        $shipping['shipping_status'] = $shipping_status;

        $shipping_id = DB::table('tbl_shipping')
            ->insertGetId($shipping);

        //Inserting into Payment table
        $paymentdata = array();
        $paymentdata['payment_method'] = $request->payment_method;;
        $paymentdata['payment_status'] = $payment_status;

        $payment_id = DB::table('tbl_payment')
            ->insertGetId($paymentdata);

        //Inserting into Order table
        if(Session::get('customer_email')==null){
            $customer_id = 0; //If customer don't login ID willbe 0
        }else{
            $customer_id = Session::get('customer_id');
        }
        $orderdata = array();
        $orderdata['customer_id'] = $customer_id;
        $orderdata['shipping_id'] = $shipping_id;
        $orderdata['payment_id'] = $payment_id;
        $orderdata['order_total'] = \Cart::getTotal();//Session::get('total');
        $orderdata['order_status'] = $order_status;

        $order_id = DB::table('tbl_order')
            ->insertGetId($orderdata);

        //These are for storing order
        $cart_contents = \Cart::getContent();
        foreach ($cart_contents as $cart_content){
            $odetailsdata = array();
            $odetailsdata['order_id'] = $order_id;
            $odetailsdata['product_id'] = $cart_content->id;
            $odetailsdata['product_name'] = $cart_content->name;
            $odetailsdata['product_price'] = $cart_content->price;
            $odetailsdata['product_sales_quantity'] = $cart_content->quantity;

            DB::table('tbl_order_details')
                ->insert($odetailsdata);
        }

        \Cart::clear();
        $totalQty = \Cart::getTotalQuantity();
        Session::put('totalQty', null);

        return view('frontEnd.confirmOrder');
    }

    public function seeOrderDetailsByCustomer($order_id){

        $customer_email = Session::get('customer_email');
        $order_by_id = DB::table('tbl_order')
                ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
                ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')
                ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
                ->select('tbl_order.*','tbl_order_details.*','tbl_customer.*','tbl_shipping.*')
                ->where('tbl_order.order_id','=',$order_id)
                ->get();

        $view_order = view('frontEnd.customer.viewOrderDetailsByCustomer')->with('order_by_id',$order_by_id);

        return view('layout')->with('frontEnd.customer.viewOrderDetailsByCustomer',$view_order);
    }

    public function customerLogout(){
        Session::flush();
        return Redirect::to('/');
    }
}
