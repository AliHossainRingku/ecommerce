@extends('admin_layout')

@section('admin_content')
    <h1>Edit Brand</h1>
    <hr>

    {!! Form::open(['url'=>'/update-brand','method'=>'POST', 'name'=>'editForm']) !!}
    <div class="form-group">
        <label for="brand_name">Brand Name:</label>
        <input type="text" class="form-control" name="brand_name" value="{{ $brandById->brand_name}}">
    </div>
    <div class="form-group">
        <label for="brand_description">Brand Description:</label>
        <textarea type="text" class="form-control" id="brand_description" name="brand_description">{{ $brandById->brand_description }}</textarea>
    </div>
    <div class="form-group">
        <label for="publication_status">Publication Status:</label>
        <select type="text" name="publication_status" class="form-control" id="publication_status">
            <option>Select Publication Status</option>
            <option value="1">Published</option>
            <option value="0">Unpublished</option>
        </select>
    </div>

    <input type="hidden" name="brand_id" value="{{ $brandById->brand_id }}">

    <button type="submit" class="btn btn-success btn-block">Submit</button>
    {!! Form::close() !!}

    <script>
        document.forms['editForm'].elements['publication_status'].value={{ $brandById->publication_status }}
    </script>

@endsection
