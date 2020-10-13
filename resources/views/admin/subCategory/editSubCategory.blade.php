@extends('admin_layout')

@section('admin_content')
    <h1>Edit Controller</h1>
    <hr>

    {!! Form::open(['url'=>'/update-sub-category','method'=>'POST', 'name'=>'editForm']) !!}
    <div class="form-group">
        <label for="categoryName">Sub Category Name:</label>
        <input type="text" class="form-control" name="sub_category_name" value="{{ $subCategoryById->sub_category_name}}">
    </div>
    <div class="form-group">
        <label for="sub_category_description">Sub Category Description:</label>
        <textarea type="text" class="form-control" id="sub_category_description" name="sub_category_description">{{ $subCategoryById->sub_category_description }}</textarea>
    </div>
    
    <?php $all_sub_category_info = DB::table('tbl_category')
            ->where('publication_status',1)
            ->get();
    ?>
    <div class="form-group">
        <label for="category_id">Category:</label>
        <select type="text" class="form-control" id="category_id" name="category_id">
                <option value="0">Select Category</option>
                @foreach($all_sub_category_info as $category)
                <?php if($category->category_id == 0){
                ?>
                <option style="color: red" value="{{ $category->category_id }}">{{ $category->category_name }}</option>
                <?php } else { ?> <option style="color: green" value="{{ $category->category_id }}">{{ $category->category_name }}</option>
                <?php }?>

                @endforeach 
            </select>
    </div>

    <div class="form-group">
        <label for="publication_status">Publication Status:</label>
        <select type="text" name="publication_status" class="form-control" id="publication_status">
            <option>Select Publication Status</option>
            <option value="1">Published</option>
            <option value="0">Unpublished</option>
        </select>
    </div>

    <input type="hidden" name="sub_category_id" value="{{ $subCategoryById->sub_category_id }}">

    <button type="submit" class="btn btn-success btn-block">Submit</button>
    {!! Form::close() !!}

    <script>
        document.forms['editForm'].elements['publication_status'].value={{ $subCategoryById->publication_status }}
        document.forms['editForm'].elements['category_id'].value={{ $subCategoryById->category_id }}
    </script>

@endsection
