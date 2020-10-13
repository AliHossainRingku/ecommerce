@extends('admin_layout')

@section('admin_content')
    <h1>Manage Slider</h1>

    {{ Session::get('msg') }}

    <hr>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>SI</th>
            <th>Slider Text</th>
            <th>Picture</th>
            <th>Publication Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>

        <?php
        $i = 0;
        ?>

            <tr>
                <td>{{ ++$i }}</td>
                <td></td>
                <td><img src="" style="height: 60px; width: 60px" /></td>

                <td>  <pre class="alert-danger">Unpublished</pre></td>
                <td style="font-size: 25px">

                    <a style="color:red" class="glyphicon glyphicon-remove" href="{{ url('/active-category/') }}"></a>

                    <a style="color:green" class="glyphicon glyphicon-ok" href="{{ url('/active-category/') }}"></a>

                    |
                    <a class="glyphicon glyphicon-edit" href="{{ url('/edit-product/') }}"></a> |
                    <a style="color:red;list-style: none" class="fa fa-trash-o" href="{{ url('/delete-product/') }}" onclick="return confirm('Are you sure to delete it?')"></a></td>
            </tr>

        </tbody>
    </table>
    </div>




@endsection
