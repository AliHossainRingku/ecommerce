@extends('admin_layout')

@section('admin_content')
    <h1>Edit Controller</h1>
    <hr>

    {!! Form::open(['url'=>'/update-category','method'=>'POST', 'name'=>'editForm']) !!}
    <div class="form-group">
        <label for="categoryName">Category Name:</label>
        <input type="text" class="form-control" name="category_name" value="{{ $categoryById->category_name}}">
    </div>
    <div class="form-group">
        <label for="category_description">Category Description:</label>
        <textarea type="text" class="form-control" id="category_description" name="category_description">{{ $categoryById->category_description }}</textarea>
    </div>

    <?php $all_super_category_info = DB::table('tbl_super_category')
            ->where('publication_status',1)
            ->get();
    ?>
    <div class="form-group">
        <label for="super_category_id">Super Category:</label>
            <select type="text" class="form-control" id="super_category_id" name="super_category_id">
                @foreach($all_super_category_info as $category)
                    <option style="color: green" value="{{ $category->super_category_id }}">{{ $category->super_category_name }}</option>
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

    <input type="hidden" name="category_id" value="{{ $categoryById->category_id }}">

    <button type="submit" class="btn btn-success btn-block">Submit</button>
    {!! Form::close() !!}

    <script>
        document.forms['editForm'].elements['publication_status'].value={{ $categoryById->publication_status }}

        document.forms['editForm'].elements['super_category_id'].value={{ $categoryById->super_category_id }}
    </script>

@endsection
