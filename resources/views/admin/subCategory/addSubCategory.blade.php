@extends('admin_layout')

@section('admin_content')
    <h1>Add Sub Category</h1>

    <hr>
        {{ Session::get('msg') }}

    <hr>

    <form class="form-horizontal" action="{{URL::to('/save-sub-category')}}" method="post">
        {{csrf_field()}}
    <div class="form-group">
        <label class="control-label col-sm-2" for="sub_category_name">Sub Category Name:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="sub_category_name" name="sub_category_name" placeholder="Enter Sub Category Name" required>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="sub_category_description">Sub Category Description:</label>
        <div class="col-sm-10">
            <textarea type="text" class="form-control" id="sub_category_description" name="sub_category_description" placeholder="Enter Sub Category Description" required></textarea>
        </div>
    </div>

    <?php $all_category_info = DB::table('tbl_category')
            ->where('publication_status',1)
            ->get();
    ?>
    <div class="form-group">
        <label class="control-label col-sm-2" for="category_id">Category:</label>
        <div class="col-sm-10">
            <select type="text" class="form-control" id="category_id" name="category_id"> 
                <option value="0">Select Category</option>
                @foreach($all_category_info as $category)
                <?php if($category->publication_status == 1){
                ?>
                <option style="color: red" value="{{ $category->category_id }}">{{ $category->category_name }}</option>
                <?php } else { ?> <option style="color: green" value="{{ $category->category_id }}">{{ $category->category_name }}</option>
                <?php }?>

                @endforeach 
            </select>
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

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-success btn-block">Submit</button>
        </div>
    </div>
    </form>

    <!--- Include of Form validation code from Admin Error.blade.php-->


@endsection
