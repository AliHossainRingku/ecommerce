<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class AutocompleteController extends Controller
{
    public function index(){

    	return view('frontEnd.search.autocomplete');
    }

    public function fetch(Request $request){

    	if($request->get('query')){
    		$query = $request->get('query');
    		$data = DB::table('tbl_product')
    				->where('product_name','LIKE','%{$query}%')
    				->get();
    		$output = '<ul class="dropdown-menu" style="display:block; position:relative">';
    		foreach ($data as $row) {
    			$output .= '<li><a href="#">'.$row->country_name.'</a></li>';
    		}
    		$output .= '</ul>';

    		echo $output;
    	}

    	else echo "string";
    }


}
