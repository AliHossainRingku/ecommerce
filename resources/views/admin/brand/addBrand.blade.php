@extends('admin_layout')

@section('admin_content')
    <h1>Add Brand</h1>

    <hr>
    {{ Session::get('msg') }}

    <hr>

    <form class="form-horizontal" action="{{URL::to('/save-brand')}}" method="post">
        {{csrf_field()}}
        <div class="form-group">
            <label class="control-label col-sm-2" for="brand_name">Brand Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="brand_name" name="brand_name" placeholder="Enter Brand Name" required>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="brand_description">Brand Description:</label>
            <div class="col-sm-10">
                <textarea type="text" class="form-control" id="brand_description" name="brand_description" placeholder="Enter Brand Description" required></textarea>
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
