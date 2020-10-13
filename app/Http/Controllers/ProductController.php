<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use FontLib\EOT\File;
use PDF;


class ProductController extends Controller
{
    public function addProduct(){
        return view('admin.product.addProduct');
    }


    public function saveProduct(Request $request){
        //dd($request->all());
        $sub_category_id = $request->sub_category_id;
        $productNo = \DB::table('tbl_product')->select('product_id')->where('sub_category_id',$sub_category_id)->get();
        $count = $productNo->count();
        $max = $productNo->max('product_id');
            
       

        $products = array();
        if($count==0){
            $products['product_id'] = $sub_category_id*1000 + $count+1;
        }
        else{
            $products['product_id'] = $max+1;
        }
        
        $products['product_name'] = $request->product_name;
        $products['sub_category_id'] = $request->sub_category_id;
        $products['brand_id'] = $request->brand_id;
        $products['product_short_description'] = $request->product_short_description;
        $products['product_long_description'] = $request->product_long_description;
        $products['product_price'] = $request->product_price;
        $products['product_size'] = $request->product_size;
        $products['product_color'] = $request->product_color;
        $products['publication_status'] = $request->publication_status;


        $image = $request->product_picture;
       


        if($image){
            $image_name = $products['product_id'];
            $ext = strtolower('png');
            $image_full_name = $image_name.'.'.$ext;
            $upload_path = 'public/images/';

            $image_url = $upload_path.$image_full_name;
            $success = $image->move($upload_path,$image_full_name);

            if($success){
                $products['product_picture'] = $image_url;

                DB::table('tbl_product')->insert($products);
                return redirect('/add-product')->with('msg','Product saved in database successfully!');
            }
        }

        //$products['product_picture'] = 'images/image.jpg';

        //DB::table('tbl_product')->insert($products);

        return redirect()->back()->with('msg','Sorry! Image not found.'); 
    }

    public function manageProduct(){
        $products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->orderBy('tbl_product.product_id')
            ->paginate(20);
        return view('admin.product.manageProduct',['products'=>$products]);

    }

    public function editProduct($product_id){
        $productById = DB::table('tbl_product')->where('product_id',$product_id)->first();
        return view('admin.product.editProduct', ['productById'=>$productById]);
    }

    public function updateProduct(Request $request){
        //dd($request->all());
        $product_id = $request->product_id;

        $products = array();
        $products['product_name'] = $request->product_name;
        $products['sub_category_id'] = $request->sub_category_id;
        $products['brand_id'] = $request->brand_id;
        $products['product_short_description'] = $request->product_short_description;
        $products['product_long_description'] = $request->product_long_description;
        $products['product_color'] = $request->product_color;
        $products['product_size'] = $request->product_size;
        $products['product_price'] = $request->product_price;
        $products['offer'] = $request->offer;
        $products['publication_status'] = $request->publication_status;

        $product_picture = $request->product_picture;

        if ($product_picture){

                $data = DB::table('tbl_product')
                        ->select('product_picture')
                        ->where('product_id',$product_id)
                        ->first();
                unlink($data->product_picture);


                $image_name = $product_id;
                $ext = strtolower('png');
                $image_full_name = $image_name.'.'.$ext;
                $upload_path = 'public/images/';

                $image_url = $upload_path.$image_full_name;
                $success = $product_picture->move($upload_path,$image_full_name);

                if($success){
                    //File::delete(public_path().$data->product_picture, $data->file->name);

                    $products['product_picture'] = $image_url;

                    DB::table('tbl_product')
                        ->where('product_id',$product_id)
                        ->update($products);
                    return redirect()->back()->with('msg','Product updated with image successfully!');
            }

        }else{
            DB::table('tbl_product')
                ->where('product_id',$product_id)
                ->update($products);
            return redirect()->back()->with('msg','Product updated without image successfully!');

        }



        /* DB::table('tbl_product')
            ->where('product_id',$product_id)
            ->update($products);
        //return redirect('/manage-product')->with('msg','Product updated without image successfully!'); */
    }

    public function activeProduct($product_id){
        DB::table('tbl_product')->where('product_id',$product_id)->update(['publication_status'=>1]);
        return redirect()->back()->with('msg','Product activated successfully!');
    }

    public function deactiveProduct($product_id){
        DB::table('tbl_product')->where('product_id',$product_id)->update(['publication_status'=>0]);

         return redirect()->back()->with('msg','Product deactivated successfully!');
    }


    public function deleteProduct($product_id){

        $data = DB::table('tbl_product')
                        ->select('product_picture')
                        ->where('product_id',$product_id)
                        ->first();
        unlink($data->product_picture);

        DB::table('tbl_product')->where('product_id',$product_id)->delete();

        return redirect()->back()->with('msg','Product deleted successfully!');
    }

    public function allPublishedCategory(){
        $all_published_category_info = DB::table('tbl_category')->get();
        return view('layout',['all_published_category_info'=>$all_published_category_info]);
    }

    public function manageAllPublishedProduct(){
       $products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_product.publication_status','1')
            ->orderBy('tbl_product.product_id')
            ->paginate(20);
        return view('admin.product.manageAllPublishedProduct',['products'=>$products]);
        
    }

    public function manageAllUnpublishedProduct(){
       $products = DB::table('tbl_product')
            ->join('tbl_sub_category', 'tbl_product.sub_category_id', '=', 'tbl_sub_category.sub_category_id')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->select('tbl_product.*', 'tbl_product.product_name','tbl_sub_category.sub_category_name','tbl_brand.brand_name')
            ->where('tbl_product.publication_status','0')
            ->orderBy('tbl_product.product_id')
            ->paginate(20);
        return view('admin.product.manageAllUnpublishedProduct',['products'=>$products]);

    }

    public function doUnpublishedProductPdf(){
        $unpublished_products = DB::table('tbl_product')
           ->select('tbl_product.product_id','tbl_product.product_name','tbl_product.product_price')
            ->where('tbl_product.publication_status','0')
            ->get();

        $pdf = PDF::loadView('admin.product.unpublishedProductsPdf',['unpublished_products'=>$unpublished_products]);
        $name = 'unpublished_products';
        return $pdf->stream('Jahazee'.'_'.$name.'.pdf');
    }

    public function doPublishedProductPdf(){
        $published_products = DB::table('tbl_product')
           ->select('tbl_product.product_id','tbl_product.product_name','tbl_product.product_price')
            ->where('tbl_product.publication_status','1')
            ->get();

        $pdf = PDF::loadView('admin.product.publishedProductsPdf',['published_products'=>$published_products]);
        $name = 'published_products';
        return $pdf->stream('Jahazee'.'_'.$name.'.pdf');
    }
}
