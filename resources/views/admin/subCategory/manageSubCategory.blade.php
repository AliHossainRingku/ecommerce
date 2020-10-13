@extends('admin_layout')

@section('admin_content')
    <h1>Manage Sub Categories</h1>

    {{ Session::get('msg') }}

    <hr>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>SI</th>
            <th>Super Category Name</th>
            <th>Super Category Description</th>
            <th>Category</th>
            <th>Publication Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>

        <?php
        $i = 0;
        ?>
        @foreach($categories as $category)
            <tr>
                <td>{{ ++$i }}</td>
                <td>{{ $category->sub_category_name }}</td>
                <td>{{ $category->sub_category_description}}</td>

                <td><?php if($category->sub_category_id == 0){ ?> <a style="color: red">{{$category->category_id}}</a><?php } else { ?> <a style="color: green">{{$category->category_id}}</a><?php } ?></td>

                <td><?php if($category->publication_status == 1){ ?> <a style="color: green">Published</a><?php } else{ ?> <a style="color: darkred">Unpublished</a><?php } ?></td>
                <td>
                    <?php if($category->publication_status == 1 ){ ?>
                    <a style="color:red" class="glyphicon glyphicon-remove" href="{{ url('/deactive-sub-category/'.$category->sub_category_id) }}"></a> <?php } else{
                        ?>
                    <a style="color:green" class="glyphicon glyphicon-ok" href="{{ url('/active-sub-category/'.$category->sub_category_id) }}"></a><?php }?>

                    |
                    <a href="{{ url('/edit-sub-category/'.$category->sub_category_id) }}">Edit</a> |
                    <a href="{{ url('/delete-sub-category/'.$category->sub_category_id) }}" onclick="return confirm('Are you sure to delete it?')">Delete</a></td>
            </tr>
        @endforeach
        </tbody>
    </table>
    </div>




@endsection
