<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Session;

class HomeController extends Controller
{
    public function index(){
        $all_published_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->orderByDesc('tbl_product.product_id','tbl_product.updated_at')
            ->paginate(6);

        $all_recommended_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(6)
            ->get();

        $all_trending_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(6)
            ->get();

        $all_offer_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->where('tbl_product.offer','>','0')
            ->inRandomOrder()
            ->limit(6)
            ->get();

        /*   ----Main Category Sample-----   */
        $all_stationery_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_category.category_id', '=', 'tbl_sub_category.category_id')
            ->join('tbl_super_category', 'tbl_super_category.super_category_id', '=', 'tbl_category.super_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_super_category.super_category_id',1)
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(6)
            ->get();

        $all_cleaning_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_category.category_id', '=', 'tbl_sub_category.category_id')
            ->join('tbl_super_category', 'tbl_super_category.super_category_id', '=', 'tbl_category.super_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_super_category.super_category_id',2)
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(6)
            ->get();

        $all_snacks_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_category.category_id', '=', 'tbl_sub_category.category_id')
            ->join('tbl_super_category', 'tbl_super_category.super_category_id', '=', 'tbl_category.super_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_super_category.super_category_id',3)
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(6)
            ->get();

        $all_business_gift_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_category.category_id', '=', 'tbl_sub_category.category_id')
            ->join('tbl_super_category', 'tbl_super_category.super_category_id', '=', 'tbl_category.super_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_super_category.super_category_id',4)
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(6)
            ->get();

        $all_printing_press_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_category.category_id', '=', 'tbl_sub_category.category_id')
            ->join('tbl_super_category', 'tbl_super_category.super_category_id', '=', 'tbl_category.super_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_super_category.super_category_id',5)
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(6)
            ->get();



        return view('frontEnd.home_content',['all_published_products'=>$all_published_products,'all_recommended_products'=>$all_recommended_products,'all_trending_products'=>$all_trending_products,'all_offer_products'=>$all_offer_products, 'all_stationery_products'=>$all_stationery_products, 'all_cleaning_products'=>$all_cleaning_products,'all_snacks_products'=>$all_snacks_products,'all_business_gift_products'=>$all_business_gift_products,'all_printing_press_products'=>$all_printing_press_products]);
    }

    public function showProductsBySubCategory($sub_category_id){

        $show_products_by_sub_category = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_product.publication_status',1)
            ->where('tbl_product.sub_category_id',$sub_category_id)
            ->orderBy('tbl_product.product_id')
            ->paginate(24);

        $show_recommended_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(6)
            ->get();
        $show_recommended_products2 = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(6)
            ->get();

        return view('frontEnd.showProductsBySubCategory',['show_products_by_sub_category'=>$show_products_by_sub_category,'show_recommended_products'=>$show_recommended_products,'show_recommended_products2'=>$show_recommended_products2]);
    }

    public function showProductsByBrand($brand_id){

        $show_products_by_brand = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_category.category_name','tbl_brand.brand_name')
            ->where('tbl_product.publication_status',1)
            ->where('tbl_product.brand_id',$brand_id)
            ->orderByDesc('tbl_product.product_id')
            ->paginate(6);
        return view('frontEnd.showProductsByBrand',['show_products_by_brand'=>$show_products_by_brand]);
    }

    public function showRecommendedProducts(){
        $show_recommended_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(24)
            ->get();
        return view('frontEnd.showRecommendedProducts',['show_recommended_products'=>$show_recommended_products]);
    }

    public function showTrendingProducts(){
        $show_trending_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->inRandomOrder()
            ->limit(24)
            ->get();
        return view('frontEnd.showTrendingProducts',['show_trending_products'=>$show_trending_products]);
    }

    public function showOfferProducts(){
        $show_offer_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_brand.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->where('tbl_product.offer','>','0')
            ->limit(24)
            ->get();
        return view('frontEnd.showOfferProducts',['show_offer_products'=>$show_offer_products]);
    }

    public function viewProduct($product_id){
        $view_products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_category.category_id', '=', 'tbl_sub_category.category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_category.category_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_product.publication_status',1)
            ->where('tbl_product.product_id',$product_id)
            ->orderByDesc('tbl_product.product_id','tbl_product.updated_at')
            ->get();
        return view('frontEnd.viewProduct',['view_products'=>$view_products]);

    }


    public function showProductsOfStationery(){

        $show_products_of_stationery = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_sub_category.category_id', '=', 'tbl_category.category_id')
            ->join('tbl_super_category', 'tbl_category.super_category_id', '=', 'tbl_super_category.super_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*','tbl_super_category.super_category_name','tbl_category.category_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_product.publication_status',1)
            ->where('tbl_category.publication_status',1)
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_super_category.super_category_id',1)
            ->orderBy('tbl_product.product_id')
            ->paginate(24);
        return view('frontEnd.showProductsOfStationery',['show_products_of_stationery'=>$show_products_of_stationery]);
    }

    public function showProductsOfCleaning(){

        $show_products_of_cleaning = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_sub_category.category_id', '=', 'tbl_category.category_id')
            ->join('tbl_super_category', 'tbl_category.super_category_id', '=', 'tbl_super_category.super_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_product.publication_status',1)
            ->where('tbl_category.publication_status',1)
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_super_category.super_category_id',2)
            ->orderBy('tbl_product.product_id')
            ->paginate(24);
        return view('frontEnd.showProductsOfCleaning',['show_products_of_cleaning'=>$show_products_of_cleaning]);
    }

    public function showProductsOfSnacks(){

        $show_products_of_snacks = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_sub_category.category_id', '=', 'tbl_category.category_id')
            ->join('tbl_super_category', 'tbl_category.super_category_id', '=', 'tbl_super_category.super_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_product.publication_status',1)
            ->where('tbl_category.publication_status',1)
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_super_category.super_category_id',3)
            ->orderBy('tbl_product.product_id')
            ->paginate(24);
        return view('frontEnd.showProductsOfSnacks',['show_products_of_snacks'=>$show_products_of_snacks]);
    }

    public function showProductsOfBusinessGifts(){

        $show_products_of_business_gifts = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_sub_category.category_id', '=', 'tbl_category.category_id')
            ->join('tbl_super_category', 'tbl_category.super_category_id', '=', 'tbl_super_category.super_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_product.publication_status',1)
            ->where('tbl_category.publication_status',1)
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_super_category.super_category_id',4)
            ->orderBy('tbl_product.product_id')
            ->paginate(24);
        return view('frontEnd.showProductsOfBusinessGifts',['show_products_of_business_gifts'=>$show_products_of_business_gifts]);
    }

    public function showProductsOfPrintingPress(){

        $show_products_of_printing_press = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_category', 'tbl_sub_category.category_id', '=', 'tbl_category.category_id')
            ->join('tbl_super_category', 'tbl_category.super_category_id', '=', 'tbl_super_category.super_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_product.publication_status',1)
            ->where('tbl_category.publication_status',1)
            ->where('tbl_sub_category.publication_status',1)
            ->where('tbl_super_category.super_category_id',5)
            ->orderBy('tbl_product.product_id')
            ->paginate(24);
        return view('frontEnd.showProductsOfPrintingPress',['show_products_of_printing_press'=>$show_products_of_printing_press]);
    }

    public function viewCustomerProfile(){

        $customer_email = Session::get('customer_email');

        if($customer_email){
            //View order info
            $all_order_info = DB::table('tbl_order')
                ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
                ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
                ->join('tbl_payment','tbl_order.payment_id','=','tbl_payment.payment_id')
                ->select('tbl_order.*','tbl_customer.*','tbl_shipping.*','tbl_payment.*')
                ->where('tbl_customer.customer_email','=',$customer_email)
                ->orderByDesc('tbl_order.order_id','tbl_order.updated_at')
                ->get();

            //View Customer info
            $customer_info = DB::table('tbl_customer')
                ->select('tbl_customer.*')
                ->where('customer_email','=',$customer_email)
                ->get();
            return view('frontEnd.customerProfile',['customer_email'=>$customer_email,'customer_info'=>$customer_info,'all_order_info'=>$all_order_info]);
        }
        else{
            return redirect('/login-check');
        }
    }

    //FOOTER SECTIONS MEHOD
    public function seeAboutUs(){
        return view('frontEnd.footer.aboutus');
    }

    public function seePolicy(){
        return view('frontEnd.footer.policy');
    }

    public function seeCustomerService(){
        return view('frontEnd.footer.customerservice');
    }

    public function search(Request $request){
      if($request->ajax()){
        $output="";
        $products=DB::table('tbl_product')
                ->where('product_name','LIKE','%'.$request->search."%")
                ->where('publication_status','1')
                ->limit(10)
                ->get();
        if($products){
         foreach ($products as $key => $product) {
          $output.=
            '<tr>'.
            '<td><a href="view-product/'.$product->product_id.'">'.$product->product_name.'</a></td>'.
            '</tr>';
          }
          return Response($output);
        }
      }
    }

}
