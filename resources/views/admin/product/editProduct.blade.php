@extends('admin_layout')

@section('admin_content')
    <h1>Edit Product</h1>

    <hr>
    {{ Session::get('msg') }}
    <hr>

    <form class="form-horizontal" action="{{URL::to('/update-product')}}" method="post" enctype="multipart/form-data" name="editForm">
        {{csrf_field()}}
        <div class="form-group">
            <label class="control-label col-sm-2" for="product_name">Product Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="product_name" name="product_name" value="{{$productById->product_name}}" required>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="sub_category_id">Product Category:</label>
            <div class="col-sm-10">

                <?php $all_published_sub_category_info = DB::table('tbl_sub_category')
                    ->where('publication_status',1)
                    ->get();
                ?>

                <select type="text" class="form-control" id="sub_category_id" name="sub_category_id">
                    <option>Select Category</option>
                    @foreach($all_published_sub_category_info as $category)
                        <option value="{{$category->sub_category_id}}">{{ $category->sub_category_name }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="brand_id">Product Brand:</label>
            <div class="col-sm-10">

                <?php $all_published_brand_info = DB::table('tbl_brand')
                    ->where('publication_status',1)
                    ->get();
                ?>

                <select type="text" class="form-control" id="brand_id" name="brand_id">
                    <option>Select Brand</option>
                    @foreach($all_published_brand_info as $brand)
                        <option value="{{$brand->brand_id}}">{{ $brand->brand_name }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="product_short_description">Product Short Description:</label>
            <div class="col-sm-10">
                <textarea type="text" class="form-control" id="product_short_description" name="product_short_description" required>{{$productById->product_short_description}}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="product_long_description">Product Long Description:</label>
            <div class="col-sm-10">
                <textarea type="text" class="form-control" id="product_long_description" name="product_long_description" required>{{$productById->product_long_description}}</textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="product_price">Product Price:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="product_price" name="product_price" placeholder="Enter product price" value="{{$productById->product_price}}" required>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="offer">Offer Percent:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="offer" name="offer" placeholder="Enter offer percent" value="{{$productById->offer}}" required>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="product_picture">Product Picture:</label>
            <div class="col-sm-10">
                <input type="file" class="fa fa-file-code-o" id="product_picture" name="product_picture">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="publication_status">Publication Status:</label>
            <div class="col-sm-10">
                <select type="text" class="form-control" id="publication_status" name="publication_status">
                    <option>Select Publication Status</option>
                    <option value="1">Published</option>
                    <option value="0">Unpublished</option>
                </select>
            </div>
        </div>
        <input type="hidden" name="product_id" value="{{ $productById->product_id }}">
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success btn-block">Submit</button>
            </div>
        </div>
    </form>

    <script>
        document.forms['editForm'].elements['sub_category_id'].value={{ $productById->sub_category_id }}
        document.forms['editForm'].elements['brand_id'].value={{ $productById->brand_id }}
        document.forms['editForm'].elements['publication_status'].value={{ $productById->publication_status }}

    </script>
    <!--- Include of Form validation code from Admin Error.blade.php-->


@endsection
