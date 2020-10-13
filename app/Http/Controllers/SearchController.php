<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class SearchController extends Controller
{
    public function index(){
      return view('frontEnd.search.search');
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

    public function searchProducts(Request $request){
      //dd($request->all());
      $keyword = $request->search;

      if($keyword == null){
        $searchProducts = DB::table('tbl_product')
            ->where('tbl_product.product_id','null')
            ->orderBy('tbl_product.product_id')
            ->paginate(1);
        return view('frontEnd.search.searchProducts',['searchProducts'=>$searchProducts, 'keyword'=>$keyword]); 
      }

      else{
        $searchProducts = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('product_name','LIKE','%'.$keyword."%")
            ->where('tbl_product.publication_status','1')
            ->orderBy('tbl_product.product_id')
            ->limit(60)
            ->get();

        return view('frontEnd.search.searchProducts',['searchProducts'=>$searchProducts, 'keyword'=>$keyword]);
      }
      
    }
}

/*

class SearchController extends Controller
{
    public function index(){
      return view('frontEnd.search.search');
    }
    public function search(Request $request){
      if($request->ajax())
      {
      $output="";
      $products=DB::table('tbl_product')
                ->where('product_name','LIKE','%'.$request->search."%")
                ->limit(10)
                ->get();
      if($products)
      {
      foreach ($products as $key => $product) {
      $output.='<tr>'.
      '<td>'.$product->product_id.'</td>'.
      '<td>'.$product->product_name.'</td>'.
      '<td>'.$product->product_short_description.'</td>'.
      '<td>'.$product->product_price.'</td>'.
      '</tr>';
      }
      return Response($output);
         }
         }
      }
}

*/



/*
class SearchController extends Controller
{
    public function index(){

    	return view('frontEnd.searchItems');
    }

    public function autocomplete(Request $request){   
        dd($request->all());
    	//$data = DB::table('tbl_product')
    			//->select('sub_category_id')
    			//->where('sub_category_id','LIKE','%{$request->input('sub_category_id')}}%')
    			//->get();


    	//return response()->json($data);
    	return "Hello";
    	
    }
	
	public function search(Request $request){
        //dd($request->all());

        $product_name = $request->search_product;
        //echo $product_name;

        $products = DB::table('tbl_product')
               ->select('product_id','product_name','product_price','product_short_description')
               ->where('product_name','LIKE',"{$product_name}")
               ->orWhere('product_id','LIKE',"{$product_name}")
               ->orWhere('product_price','LIKE',"{$product_name}")
               ->get();

		//$products = DB::table('tbl_product')->get(); 

        echo $products;

       // return view('frontEnd.searchItems',['products'=>$products]);
	}
}
*/