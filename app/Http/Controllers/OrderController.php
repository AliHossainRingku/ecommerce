<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use PDF;

session_start();


class OrderController extends Controller
{

    public function manageOrder(){
        $all_order_info = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_payment','tbl_order.payment_id','=','tbl_payment.payment_id')
            ->select('tbl_order.*','tbl_customer.*','tbl_shipping.*','tbl_payment.*')
            ->orderByDesc('tbl_order.order_id','tbl_order.updated_at')
            ->get();

        //echo $all_order_info;

        $manage_order = view('admin.order.manageOrder')->with('all_order_info',$all_order_info);

        return view('admin_layout')->with('admin.order.manageOrder',$manage_order);
    }

    public function requestOrder(){
        $request_order = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_payment','tbl_order.payment_id','=','tbl_payment.payment_id')
            ->select('tbl_order.*','tbl_customer.customer_name','tbl_shipping.shipping_name','tbl_shipping.shipping_address','tbl_shipping.shipping_mobile','tbl_payment.payment_method')
            ->where('order_status','=',0)
            ->where('shipping_status','=',0)
            ->where('payment_status','=',0)
            ->orderBy('tbl_order.order_id','tbl_order.updated_at')
            ->get();

        //echo $all_order_info;

        $request_order = view('admin.order.requestOrder')->with('request_order',$request_order);

        return view('admin_layout')->with('admin.order.requestOrder',$request_order);
    }

    public function viewRequestOrder($order_id){

        $order_by_id = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_payment','tbl_order.payment_id','=','tbl_payment.payment_id')
            ->select('tbl_order.*','tbl_order_details.*','tbl_customer.*','tbl_shipping.*')
            ->where('tbl_order.order_id','=',$order_id)
            ->where('order_status','=',0)
            ->where('shipping_status','=',0)
            ->where('payment_status','=',0)
            ->get();

        $view_order = view('admin.order.viewOrder')->with('order_by_id',$order_by_id);

        return view('admin_layout')->with('admin.order.viewOrder',$view_order);
    }

    public function deleteOrder($order_id){
        DB::table('tbl_order')
            ->where('tbl_order.order_id',$order_id)
            ->delete();
        /* DB::table('tbl_order_details')
            ->where('tbl_order_details.order_id',$order_id)
            ->delete();*/

        return redirect()->back()->with('msg','Order deleted successfully!');
    }




    public function viewShippingOrder($order_id){

        $order_by_id = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_payment','tbl_order.payment_id','=','tbl_payment.payment_id')
            ->select('tbl_order.*','tbl_order_details.*','tbl_customer.*','tbl_shipping.*')
            ->where('tbl_order.order_id','=',$order_id)
            ->where('order_status','=',1)
            ->where('shipping_status','=',0)
            ->where('payment_status','=',0)
            ->get();

        $view_order = view('admin.order.viewShippingOrder')->with('order_by_id',$order_by_id);

        return view('admin_layout')->with('admin.order.viewShippingOrder',$view_order);

    }

    public function viewPaymentOrder($order_id){

        $order_by_id = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_payment','tbl_order.payment_id','=','tbl_payment.payment_id')
            ->select('tbl_order.*','tbl_order_details.*','tbl_customer.*','tbl_shipping.*')
            ->where('tbl_order.order_id','=',$order_id)
            ->where('order_status','=',1)
            ->where('shipping_status','=',1)
            ->where('payment_status','=',0)
            ->get();

        $view_order = view('admin.order.viewPaymentOrder')->with('order_by_id',$order_by_id);

        return view('admin_layout')->with('admin.order.viewPaymentOrder',$view_order);

    }

    public function viewServedOrder($order_id){

        $order_by_id = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_payment','tbl_order.payment_id','=','tbl_payment.payment_id')
            ->select('tbl_order.*','tbl_order_details.*','tbl_customer.*','tbl_shipping.*')
            ->where('tbl_order.order_id','=',$order_id)
            ->get();

        $view_order = view('admin.order.viewOrder')->with('order_by_id',$order_by_id);

        return view('admin_layout')->with('admin.order.viewOrder',$view_order);
    }

    public function updateOrder(Request $request){
        //dd($request->all());
        $product_id = $request->product_id;
        $order_qty = $request->quantity;

        $order_info = array();
        //$product['id'] = $request->product_id;
        //$order_info['product_sales_quantity'] = array();

        //$cartItem = Cart::add($id, $name, $price, $quantity);

        \Cart::update($product_id, array(
            'quantity' => $order_qty, // so if the current product has a quantity of 4, another 2 will be added so this will result to 6
        ));

        $totalQty = \Cart::getTotalQuantity();
        Session::put('totalQty', $totalQty);

        /* DB::table('tbl_order_details')
            ->where('order_id',$order_id)
            ->update($order_info); */
        return redirect('/show-cart')->with('msg','Order updated successfully!');
    }

    public function confirmOrder($order_id){
        $order = array();
        $order['order_status'] = 1;
            DB::table('tbl_order')
                ->where('order_id',$order_id)->update($order);
            return redirect('/request-order')->with('msg','Order confirmed successfully!');

    }

    public function confirmShippingOrder($order_id){
        $shipping = array();
        $shipping['shipping_status'] = 1;
        DB::table('tbl_shipping')
            ->where('shipping_id',$order_id)->update($shipping);
        return redirect('/shipping-order')->with('msg','Shipping confirmed successfully!');

    }

    public function confirmPaymentOrder($order_id){
        $payment = array();
        $payment['payment_status'] = 1;
        DB::table('tbl_payment')
            ->where('payment_id',$order_id)->update($payment);
        return redirect('/payment-order')->with('msg','Payment confirmed successfully!');

    }


    public function showShippingOrder(){
        $all_order_info = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_payment','tbl_order.payment_id','=','tbl_payment.payment_id')
            ->select('tbl_order.*','tbl_customer.*','tbl_shipping.*','tbl_payment.*')
            ->where('order_status','=',1)
            ->where('shipping_status','=',0)
            ->where('payment_status','=',0)
            ->orderByDesc('tbl_order.order_id','tbl_order.updated_at')
            ->get();

        //echo $all_order_info;

        $manage_order = view('admin.order.shippingOrder')->with('all_order_info',$all_order_info);

        return view('admin_layout')->with('admin.order.shippingOrder',$manage_order);
    }

    public function showPaymentOrder(){
        $all_order_info = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->join('tbl_payment','tbl_order.payment_id','=','tbl_payment.payment_id')
            ->select('tbl_order.*','tbl_customer.*','tbl_shipping.*','tbl_payment.*')
            ->where('order_status','=',1)
            ->where('shipping_status','=',1)
            ->where('payment_status','=',0)
            ->orderByDesc('tbl_order.order_id','tbl_order.updated_at')
            ->get();

        //echo $all_order_info;

        $manage_order = view('admin.order.paymentOrder')->with('all_order_info',$all_order_info);

        return view('admin_layout')->with('admin.order.paymentOrder',$manage_order);
    }

    /* public function orderPlace(Request $request){
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
        $orderdata = array();
        $orderdata['customer_id'] = Session::get('customer_id');
        $orderdata['shipping_id'] = $shipping_id
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
    } */


    public function doPdf($order_id){

        $order_data = DB::table('tbl_order_details')
            ->limit(10)
            ->get();

        $order_data = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->select('tbl_order.*','tbl_order_details.*','tbl_customer.*','tbl_shipping.*')
            ->where('tbl_order.order_id','=',$order_id)
            ->get();

        $order_data = $this->getCustomerData($order_id);


        $pdf = PDF::loadView('admin.order.pdfDocument',['order_data'=>$order_data]);
        return $pdf->stream('Jahazee'.strtolower(now()).'_'.$order_id.'.pdf');
        //return view('admin.order.pdfDocument')->with('order_data',$order_data);
    }

    public function getCustomerData($order_id){
        $order_data = DB::table('tbl_order_details')
            ->limit(10)
            ->get();

        $order_by_id = DB::table('tbl_order')
            ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
            ->join('tbl_order_details','tbl_order.order_id','=','tbl_order_details.order_id')
            ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
            ->select('tbl_order.*','tbl_order_details.*','tbl_customer.*','tbl_shipping.*')
            ->where('tbl_order.order_id','=',$order_id)
            ->get();

        return $order_by_id;
    }


}
