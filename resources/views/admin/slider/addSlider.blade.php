@extends('admin_layout')

@section('admin_content')
    <h1>Add Slider</h1>

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
