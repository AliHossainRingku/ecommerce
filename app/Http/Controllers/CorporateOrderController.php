<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use FontLib\EOT\File;
use DB;
use PDF;


class CorporateOrderController extends Controller
{
    public function corporateOrder(){

        return view('frontEnd.corporateOrder');
    }

    public function postCorporateOrder(Request $request){
        //dd($request->all());
        $corporate = array();
        $corporate['company_name'] = $request->company_name;
        $corporate['company_email'] = $request->company_email;
        $corporate['company_mobile'] = $request->company_mobile;

        $corporate_order_id = DB::table('tbl_corporate_order')
           ->insertGetId($corporate);

        $image = $request->uploadFile1;
        if($image){
           $info = $image->getClientOriginalExtension();
            if($image && ($info=='jpg' || $info=='jpeg' || $info=='png' || $info=='gif')){
                $image_name = $corporate_order_id;
                $ext = strtolower('png');
                $image_full_name = $image_name.'.'.$ext;
                $upload_path = 'public/rfq_uploaded_file/';

                $image_url = $upload_path.$image_full_name;
                $success = $image->move($upload_path,$image_full_name);

                if($success){
                    $corporate['file'] = $image_url;

                    DB::table('tbl_corporate_order')
                    ->where('corporate_order_id',$corporate_order_id)
                    ->update($corporate);

                }
            }

            else if($image && ($info == 'xlsx' || $info=='xls')){
                $image_name = $corporate_order_id;
                $ext = strtolower('xlsx');
                $image_full_name = $image_name.'.'.$ext;
                $upload_path = 'public/rfq_uploaded_file/';

                $image_url = $upload_path.$image_full_name;
                $success = $image->move($upload_path,$image_full_name);

                if($success){
                    $corporate['file'] = $image_url;

                    DB::table('tbl_corporate_order')
                    ->where('corporate_order_id',$corporate_order_id)
                    ->update($corporate);

                }
            }

            else if($image && ($info == 'docx' || $info == 'doc')){
                $image_name = $corporate_order_id;
                $ext = strtolower('docx');
                $image_full_name = $image_name.'.'.$ext;
                $upload_path = 'public/rfq_uploaded_file/';

                $image_url = $upload_path.$image_full_name;
                $success = $image->move($upload_path,$image_full_name);

                if($success){
                    $corporate['file'] = $image_url;

                    DB::table('tbl_corporate_order')
                    ->where('corporate_order_id',$corporate_order_id)
                    ->update($corporate);

                }
            }

            else if($image && ($info == 'pdf')){
                $image_name = $corporate_order_id;
                $ext = strtolower('pdf');
                $image_full_name = $image_name.'.'.$ext;
                $upload_path = 'public/rfq_uploaded_file/';

                $image_url = $upload_path.$image_full_name;
                $success = $image->move($upload_path,$image_full_name);

                if($success){
                    $corporate['file'] = $image_url;

                    DB::table('tbl_corporate_order')
                    ->where('corporate_order_id',$corporate_order_id)
                    ->update($corporate);

                }
            }

            else if($image && ($info == 'zip')){
                $image_name = $corporate_order_id;
                $ext = strtolower('zip');
                $image_full_name = $image_name.'.'.$ext;
                $upload_path = 'public/rfq_uploaded_file/';

                $image_url = $upload_path.$image_full_name;
                $success = $image->move($upload_path,$image_full_name);

                if($success){
                    $corporate['file'] = $image_url;

                    DB::table('tbl_corporate_order')
                    ->where('corporate_order_id',$corporate_order_id)
                    ->update($corporate);

                }
            }

            else if($image && ($info == 'csv')){
                $image_name = $corporate_order_id;
                $ext = strtolower('csv');
                $image_full_name = $image_name.'.'.$ext;
                $upload_path = 'public/rfq_uploaded_file/';

                $image_url = $upload_path.$image_full_name;
                $success = $image->move($upload_path,$image_full_name);

                if($success){
                    $corporate['file'] = $image_url;

                    DB::table('tbl_corporate_order')
                    ->where('corporate_order_id',$corporate_order_id)
                    ->update($corporate);

                }
            }
            else if($image && ($info == 'txt')){
                $image_name = $corporate_order_id;
                $ext = strtolower('txt');
                $image_full_name = $image_name.'.'.$ext;
                $upload_path = 'public/rfq_uploaded_file/';

                $image_url = $upload_path.$image_full_name;
                $success = $image->move($upload_path,$image_full_name);

                if($success){
                    $corporate['file'] = $image_url;

                    DB::table('tbl_corporate_order')
                    ->where('corporate_order_id',$corporate_order_id)
                    ->update($corporate);

                }
            }
        }
        else{
            $corporate['file'] = '';
        }

        $product_name = array(); $product_specification = array(); $product_quantity = array();
 
        $product_name = $request->productName;
        $product_specification = $request->productSpecification;
        $product_quantity = $request->productQuantity;

        $num = count($product_name);


        for ($i=0; $i < $num; $i++) {
            $corporate_order = array();

            $corporate_order['corporate_order_id'] = $corporate_order_id;//from previous table

            $corporate_order['product_name'] = $product_name[$i];
            $corporate_order['product_specification'] = $product_specification[$i];
            $corporate_order['product_quantity'] = $product_quantity[$i];
    
            $corporate_order_details_id = DB::table('tbl_corporate_order_details')
                ->insertGetId($corporate_order);
        }

        return redirect()->back()->with('msg','Successfully done! Your Order no:'.$corporate_order_id);
    

    }



    public function corporateOrderRequest(){
        $all_corporate_order_info = DB::table('tbl_corporate_order')
            ->where('corporate_order_status','=',0)
            ->orderByDesc('corporate_order_id')
            ->get();

        $corporate_request_order = view('admin.corporateOrder.corporateOrderRequest')->with('all_corporate_order_info',$all_corporate_order_info);

        return view('admin_layout')->with('admin.corporateOrder.corporateOrderRequest',$corporate_request_order);
    }

    public function viewCorporateRequestOrder($order_id){

        $corporate_order_by_id = DB::table('tbl_corporate_order')
            ->join('tbl_corporate_order_details','tbl_corporate_order.corporate_order_id','=','tbl_corporate_order_details.corporate_order_id')
            ->select('tbl_corporate_order.*','tbl_corporate_order_details.*')
            ->where('tbl_corporate_order.corporate_order_id','=',$order_id)
            ->where('corporate_order_status','=',0)
            ->get();

        $view_corporate_order = view('admin.corporateOrder.viewCorporateOrder')->with('corporate_order_by_id',$corporate_order_by_id);

        return view('admin_layout')->with('admin.corporateOrder.viewCorporateOrder',$view_corporate_order);
    }

    public function editCorporateRequestOrder($order_id){

        $corporate_order_by_id = DB::table('tbl_corporate_order')
            ->join('tbl_corporate_order_details','tbl_corporate_order.corporate_order_id','=','tbl_corporate_order_details.corporate_order_id')
            ->select('tbl_corporate_order.*','tbl_corporate_order_details.*')
            ->where('tbl_corporate_order.corporate_order_id','=',$order_id)
            ->where('corporate_order_status','=',0)
            ->get();

        $edit_corporate_order = view('admin.corporateOrder.editCorporateOrder')->with('corporate_order_by_id',$corporate_order_by_id);

        return view('admin_layout')->with('admin.corporateOrder.editCorporateOrder',$edit_corporate_order);
    }

    public function updateCorporateRequestOrder(Request $request){
        //dd($request->all());
        $corporate_order_details_id = $request->corporate_order_details_id;

        $corporate_order = array();
        $corporate_order['product_name'] = $request->product_name;
        $corporate_order['product_specification'] = $request->product_specification;
        $corporate_order['product_quantity'] = $request->product_quantity;
        $corporate_order['product_price'] = $request->product_price;
        
        DB::table('tbl_corporate_order_details')
            ->where('corporate_order_details_id',$corporate_order_details_id)
            ->update($corporate_order);
        return redirect()->back()->with('msg','Corporate order updated successfully!');

    }

    public function deleteCorporateOrder($corporate_order_id){
        DB::table('tbl_corporate_order')
            ->where('tbl_corporate_order.corporate_order_id',$corporate_order_id)
            ->delete();
        DB::table('tbl_corporate_order_details')
            ->where('tbl_corporate_order_details.corporate_order_id',$corporate_order_id)
            ->delete();

        return redirect('/corporate-order-request')->with('msg','Corporate Order deleted successfully!');
    }


    public function doPdfRFQ($corporate_order_id){

        $corporate_order_data = DB::table('tbl_corporate_order_details')
            ->limit(10)
            ->get();

        $corporate_order_data = DB::table('tbl_corporate_order')
            ->join('tbl_corporate_order_details','tbl_corporate_order.corporate_order_id','=','tbl_corporate_order_details.corporate_order_details_id')
            ->select('tbl_corporate_order.*','tbl_corporate_order_details.*')
            ->where('tbl_corporate_order.corporate_order_id','=',$corporate_order_id)
            ->get();

        $corporate_order_data = $this->getCustomerData($corporate_order_id);


        $pdf = PDF::loadView('admin.corporateOrder.pdfDocumentRFQ',['corporate_order_data'=>$corporate_order_data]);
        return $pdf->stream('Jahazee'.strtolower(now()).'_'.$corporate_order_id.'.pdf');
        //return view('admin.order.pdfDocument')->with('order_data',$order_data);
    }

    public function getCustomerData($corporate_order_id){
        $corporate_order_data = DB::table('tbl_corporate_order_details')
            ->limit(10)
            ->get();

        $corporate_order_by_id = DB::table('tbl_corporate_order')
            ->join('tbl_corporate_order_details','tbl_corporate_order.corporate_order_id','=','tbl_corporate_order_details.corporate_order_id')
            ->select('tbl_corporate_order.*','tbl_corporate_order_details.*')
            ->where('tbl_corporate_order.corporate_order_id','=',$corporate_order_id)
            ->get();

        return $corporate_order_by_id;
    }

    ////---------------------------------------------------------------------
    public function corporateCustomerRegistratioin(Request $request){
        //dd($request->all());
        $corporate_customer = array();
        $corporate_customer['corporate_customer_name'] = $request->corporate_customer_name;
        $corporate_customer['corporate_customer_email'] = $request->corporate_customer_email;
        $corporate_customer['corporate_customer_mobile'] = $request->corporate_customer_mobile;
        $corporate_customer['corporate_customer_password'] = md5($request->corporate_customer_password);
        $corporate_customer['corporate_customer_status'] = 0;

        $customer_id = DB::table('tbl_corporate_customer')
            ->insertGetId($corporate_customer);

        Session::put('corporate_customer_id',$corporate_customer_id);
        Session::put('corporate_customer_name',$corporate_customer['customer_name']);
        Session::put('corporate_customer_email',$customer['corporate_customer_email']);


        //DB::table('tbl_customer')->insert($customer);
        return redirect('/corporate_checkout')->with('msg','Corporate_Customer info save in database successfully!');

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

    public function customerLogout()
    {
        Session::flush();
        return Redirect::to('/');
    }

}
