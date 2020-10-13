<?php

namespace App\Http\Controllers;

use Collective\Html\FormFacade;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class SubCategoryController extends Controller
{
    public function addSubCategory(){
        return view('admin.subCategory.addSubCategory');
    }


    public function saveSubCategory(Request $request){
        //dd($request->all());
        //validate
       /* $this->validate($request,[
            'categoryName'=>'required|min:3|max:128|unique:categories',
            'categoryDescription'=>'required|min:1',
            'publicationStatus'=>'required'
        ]); */

        //$categories = new Category();

        $category_id = $request->category_id;
        $catNo = \DB::table('tbl_sub_category')->where('category_id',$category_id)->get();
        $i = $catNo->count();
            


        $subcategories = array();

        $subcategories['sub_category_id'] = $category_id*100 + $i+1;
        $subcategories['sub_category_name'] = $request->sub_category_name;
        $subcategories['sub_category_description'] = $request->sub_category_description;
        $subcategories['category_id'] = $request->category_id;
        $subcategories['publication_status'] = $request->publication_status;

        DB::table('tbl_sub_category')->insert($subcategories);

        return redirect('/add-sub-category')->with('msg','Sub Category save in database successfully!');
    }

    public function manageSubCategory(){
        $categories = DB::table('tbl_sub_category')->get();
        return view('admin.subCategory.manageSubCategory',['categories'=>$categories]);

    }

    public function editSubCategory($sub_category_id){
        $subCategoryById = DB::table('tbl_sub_category')->where('sub_category_id',$sub_category_id)->first();
        return view('admin.subCategory.editSubCategory', ['subCategoryById'=>$subCategoryById]);
    }

    public function updateSubCategory(Request $request){
        $sub_category_id = $request->sub_category_id;

        $subcategories = array();
        $subcategories['sub_category_name'] = $request->sub_category_name;
        $subcategories['sub_category_description'] = $request->sub_category_description;
        $subcategories['category_id'] = $request->category_id;
        $subcategories['publication_status'] = $request->publication_status;

        DB::table('tbl_sub_category')
            ->where('sub_category_id',$sub_category_id)
            ->update($subcategories);
        return redirect('/manage-sub-category')->with('msg','Sub Category updated successfully!');
    }

    public function activeSubCategory($super_category_id){
        DB::table('tbl_sub_category')->where('sub_category_id',$sub_category_id)->update(['publication_status'=>1]);
        return redirect('/manage-sub-category')->with('msg','Sub Category activated successfully!');
    }

    public function deactiveSubCategory($sub_category_id){
        DB::table('tbl_sub_category')->where('sub_category_id',$sub_category_id)->update(['publication_status'=>0]);
        return redirect('/manage-sub-category')->with('msg','SubCategory deactivated successfully!');
    }


    public function deleteSubCategory($id){
        DB::table('tbl_sub_category')->where('sub_category_id',$id)->delete();
        return redirect('/manage-sub-category')->with('msg','Sub Category deleted successfully!');
    }

    public function allPublishedSubCategory(){
        $all_published_sub_category_info = DB::table('tbl_category')->where('publication_status',1)->get();
        $all_sub_category = DB::table('tbl_category')->where('category_id',1)->get();
        return view('layout',['all_published_category_info'=>$all_published_category_info,'all_sub_category'=>$all_sub_category]);
    }


}
