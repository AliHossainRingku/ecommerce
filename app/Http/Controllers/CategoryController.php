<?php

namespace App\Http\Controllers;

use Collective\Html\FormFacade;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CategoryController extends Controller
{
    public function addCategory(){
        return view('admin.category.addCategory');
    }


    public function saveCategory(Request $request){
        //dd($request->all());
        //validate
       /* $this->validate($request,[
            'categoryName'=>'required|min:3|max:128|unique:categories',
            'categoryDescription'=>'required|min:1',
            'publicationStatus'=>'required'
        ]); */

        //$categories = new Category();

        $super_category_id = $request->super_category_id;
        $supCatNo = \DB::table('tbl_category')->where('super_category_id',$super_category_id)->get();
        $i = $supCatNo->count();
 

        $categories = array();

        $categories['category_id'] = $super_category_id*100 + $i+1;
        $categories['category_name'] = $request->category_name;
        $categories['category_description'] = $request->category_description;
        $categories['super_category_id'] = $request->super_category_id;
        $categories['publication_status'] = $request->publication_status;

        DB::table('tbl_category')->insert($categories);

        return redirect('/add-category')->with('msg','Category save in database successfully!');
    }

    public function manageCategory(){
        $categories = DB::table('tbl_category')->get();
        return view('admin.category.manageCategory',['categories'=>$categories]);

    }

    public function editCategory($category_id){
        $categoryById = DB::table('tbl_category')->where('category_id',$category_id)->first();
        return view('admin.category.editCategory', ['categoryById'=>$categoryById]);
    }

    public function updateCategory(Request $request){
        $category_id = $request->category_id;

        $categories = array();
        $categories['category_name'] = $request->category_name;
        $categories['category_description'] = $request->category_description;
        $categories['super_category_id'] = $request->super_category_id;
        $categories['publication_status'] = $request->publication_status;

        DB::table('tbl_category')
            ->where('category_id',$category_id)
            ->update($categories);
        return redirect('/manage-category')->with('msg','Category updated successfully!');
    }

    public function activeCategory($category_id){
        DB::table('tbl_category')->where('category_id',$category_id)->update(['publication_status'=>1]);
        return redirect('/manage-category')->with('msg','Category activated successfully!');
    }

    public function deactiveCategory($category_id){
        DB::table('tbl_category')->where('category_id',$category_id)->update(['publication_status'=>0]);
        return redirect('/manage-category')->with('msg','Category deactivated successfully!');
    }


    public function deleteCategory($id){
        DB::table('tbl_category')->where('category_id',$id)->delete();
        return redirect('/manage-category')->with('msg','Category deleted successfully!');
    }

    public function allPublishedCategory(){
        $all_published_category_info = DB::table('tbl_category')->where('publication_status',1)->get();
        $all_sub_category = DB::table('tbl_category')->where('parent_category',1)->get();
        return view('layout',['all_published_category_info'=>$all_published_category_info,'all_sub_category'=>$all_sub_category]);
    }


}
