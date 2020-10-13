<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CustomerController extends Controller
{
    public function getCustomerAccount(){
        $customer_email = Session::get('customer_email');

        if($customer_email != NULL){
            return redirect('/customer-account');
        }
        else{
            return view('frontEnd.customerLogin');
        }

    }
    public function showAllCustomerOrders(){
        $all_order_info = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_payment','tbl_order.payment_id','=','tbl_payment.payment_id')
            ->select('tbl_order.*','tbl_customer.*','tbl_shipping.*','tbl_payment.*')
            ->where('order_status','=',0)
            ->orderByDesc('tbl_order.order_id','tbl_order.updated_at')
            ->get();

        //echo $all_order_info;

        $manage_order = view('frontEnd.customer.customerProfile')->with('all_order_info',$all_order_info);

        return view('layout')->with('frontEnd.customer.customerProfile',$manage_order);
    }
}
