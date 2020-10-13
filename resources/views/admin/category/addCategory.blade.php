@extends('admin_layout')

@section('admin_content')
    <h1>Add Category</h1>

    <hr>
        {{ Session::get('msg') }}

    <hr>

    <form class="form-horizontal" action="{{URL::to('/save-category')}}" method="post">
        {{csrf_field()}}
    <div class="form-group">
        <label class="control-label col-sm-2" for="category_name">Category Name:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="category_name" name="category_name" placeholder="Enter Category Name" required>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="category_description">Category Description:</label>
        <div class="col-sm-10">
            <textarea type="text" class="form-control" id="category_description" name="category_description" placeholder="Enter Category Description" required></textarea>
        </div>
    </div>

    <?php $all_super_category_info = DB::table('tbl_super_category')
            ->where('publication_status',1)
            ->get();
    ?>

    <div class="form-group">
        <label class="control-label col-sm-2" for="super_category_id"> Super Category:</label>
        <div class="col-sm-10">
            <select type="text" class="form-control" id="super_category_id" name="super_category_id">
                <option value="0">Select Super Category</option>
                @foreach($all_super_category_info as $category)
                <?php if($category->publication_status == 0){
                ?>
                <option style="color: red" value="{{ $category->super_category_id }}">{{ $category->super_category_name }}</option>
                <?php } else { ?> <option style="color: green" value="{{ $category->super_category_id }}">{{ $category->super_category_name }}</option>
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
