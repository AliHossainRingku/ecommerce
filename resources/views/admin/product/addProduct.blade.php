@extends('admin_layout')

@section('admin_content')
    {{ Session::get('msg') }}
	<br>
    <form class="form-horizontal" action="{{URL::to('/save-product')}}" method="post" enctype="multipart/form-data">
        {{csrf_field()}}
		
		
		
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">Add Product</h3>
	</div>
	<div class="panel-body">
        <div class="form-group">
            <label class="control-label col-sm-2" for="product_name">Product Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="product_name" name="product_name" placeholder="Enter Product Name" required>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="category_id">Product Sub Category:</label>
            <div class="col-sm-10">

                <?php $all_published_category_info = DB::table('tbl_sub_category')
                    ->where('publication_status',1)
                    ->get();

                   
                ?>

                <select type="text" class="form-control" id="sub_category_id" name="sub_category_id">
                    <option value="0">Select Sub Category</option>
                @foreach($all_published_category_info as $category)

                     <?php $all_sub_category = DB::table('tbl_sub_category')
                    ->where('publication_status',1)
                    ->get(); ?>
                    @foreach($all_sub_category as $sub_category)
                        <h6>{{$sub_category->category_id}}</h6>
                    @endforeach
                <option style="color: red" value="{{ $category->sub_category_id }}">{{ $category->sub_category_name }}</option>
             

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
                    <option value="1">Select Brand</option>
                    @foreach($all_published_brand_info as $brand)
                        <option value="{{$brand->brand_id}}">{{ $brand->brand_name }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="product_short_description">Product Short Description:</label>
            <div class="col-sm-10">
                <textarea type="text" class="form-control" id="product_short_description" name="product_short_description" placeholder="Enter short description about product" required></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="product_long_description">Product Long Description:</label>
            <div class="col-sm-10">
                <textarea type="text" class="form-control" id="product_long_description" name="product_long_description" placeholder="Enter short description about product" required></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="product_price">Product Price:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="product_price" name="product_price" placeholder="Enter product price" required>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="product_picture">Product Picture:</label>
            <div class="col-sm-10">
                <input type="file" class="fa fa-file-code-o" id="product_picture" name="product_picture">
            </div>
        </div>

        <!-- div class="form-group">
            <label class="control-label col-sm-2" for="product_size">Product Size:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="product_size" name="product_size" placeholder="Enter product size" required>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="product_color">Product Color:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="product_color" name="product_color" placeholder="Enter product color" required>
            </div>
        </div -->

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
		</div>
		<div class="panel-footer">
			<button type="submit" class="btn btn-primary">Save</button>
		</div>
 
    </form>
	<br>

    <!--- Include of Form validation code from Admin Error.blade.php-->


@endsection
