@extends('admin_layout')

@section('admin_content')
    <h1>Manage Brand</h1>

    {{ Session::get('msg') }}

    <hr>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>SI</th>
            <th>Category Name</th>
            <th>Category Description</th>
            <th>Publication Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>

        <?php
        $i = 0;
        ?>
        @foreach($brands as $brand)
            <tr>
                <td>{{ ++$i }}</td>
                <td>{{ $brand->brand_name }}</td>
                <td>{{ $brand->brand_description}}</td>
                <td><?php if($brand->publication_status == 1){ ?> <a style="color: green">Published</a><?php } else{ ?> <a style="color: darkred">Unpublished</a><?php } ?></td>
                <td>
                    <?php if($brand->publication_status == 1 ){ ?>
                    <a style="color:red" class="glyphicon glyphicon-remove" href="{{ url('/deactive-brand/'.$brand->brand_id) }}"></a> <?php } else{
                    ?>
                    <a style="color:green" class="glyphicon glyphicon-ok" href="{{ url('/active-brand/'.$brand->brand_id) }}"></a><?php }?>

                    |
                    <a href="{{ url('/edit-brand/'.$brand->brand_id) }}">Edit</a> |
                    <a style="color:red;" href="{{ url('/delete-brand/'.$brand->brand_id) }}" onclick="return confirm('Are you sure to delete it?')">Delete</a></td>
            </tr>
        @endforeach
        </tbody>
    </table>
    </div>




@endsection
