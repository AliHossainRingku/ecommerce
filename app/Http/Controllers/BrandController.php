<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BrandController extends Controller
{
    public function addBrand(){
        return view('admin.brand.addBrand');
    }


    public function saveBrand(Request $request){
        //dd($request->all());
        //validate
        /* $this->validate($request,[
             'categoryName'=>'required|min:3|max:128|unique:categories',
             'categoryDescription'=>'required|min:1',
             'publicationStatus'=>'required'
         ]); */

        //$categories = new Category();
        $brands = array();

        $brands['brand_name'] = $request->brand_name;
        $brands['brand_description'] = $request->brand_description;
        $brands['publication_status'] = $request->publication_status;

        DB::table('tbl_brand')->insert($brands);

        return redirect('/add-brand')->with('msg','Brand save in database successfully!');
    }

    public function manageBrand(){
        //$categories = Category::all();

        //$all_category_info = DB::table('tbl_category')->get();
        // $manage_category = view('admin.category.manageCategory');
        $brands = DB::table('tbl_brand')->get();
        return view('admin.brand.manageBrand',['brands'=>$brands]);

    }

    public function editBrand($brand_id){
        $brandById = DB::table('tbl_brand')->where('brand_id',$brand_id)->first();
        return view('admin.brand.editBrand', ['brandById'=>$brandById]);
    }

    public function updateBrand(Request $request){
    $brand_id = $request->brand_id;

    $brands = array();
    $brands['brand_name'] = $request->brand_name;
    $brands['brand_description'] = $request->brand_description;
    $brands['publication_status'] = $request->publication_status;

    DB::table('tbl_brand')
        ->where('brand_id',$brand_id)
        ->update($brands);
    return redirect('/manage-brand')->with('msg','Brand updated successfully!');
}
    public function activeBrand($brand_id){
        DB::table('tbl_brand')->where('brand_id',$brand_id)->update(['publication_status'=>1]);
        return redirect('/manage-brand')->with('msg','Brand activated successfully!');
    }

    public function deactiveBrand($brand_id){
        DB::table('tbl_brand')->where('brand_id',$brand_id)->update(['publication_status'=>0]);
        return redirect('/manage-brand')->with('msg','Brand activated successfully!');
    }

    public function deleteBrand($id){
        DB::table('tbl_brand')->where('brand_id',$id)->delete();
        return redirect('/manage-brand')->with('msg','Brand deleted successfully!');
    }

    public function allPublishedBrand(){
        $all_published_brand_info = DB::table('tbl_brand')->get();
        return view('layout',['all_published_brand_info'=>$all_published_brand_info]);
    }



}
