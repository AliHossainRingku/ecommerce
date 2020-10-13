@extends('admin_layout')

@section('admin_content')
    <h1>All Published Product</h1>
    <a href="{{url('/manage-allpublished-product')}}" class="btn btn-success mt-5">Published</a>
    <a href="{{url('/manage-allunpublished-product')}}" class="btn btn-warning mt-5">Unpublished</a>
    {{ Session::get('msg') }}

    <hr>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>SI</th>
            <th>ID</th>
            <th>Product Name</th>
            <th>Sub Category</th>
            <th>Brand</th>
            <th>Picture</th>          
            <th>Price</th>
            <th>Offer</th>
            <th>Publication Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>

        <?php
        $i = 0;
        ?>
        @foreach($products as $product)
            <tr>
                <td>{{ ++$i }}</td>
                <td>{{ $product->product_id }}</td>
                <td>{{ $product->product_name }}</td>
                <td>{{ $product->sub_category_name }}</td>
                <td>{{ $product->brand_name }}</td>
                <td><img src="{{ $product->product_picture }}" style="height: 60px; width: 60px" /></td>
                
                <td>{{ $product->product_price}}</td>
                <?php if($product->offer==0){ ?><td>No offer</td> <?php } else{ ?><td> {{ $product->offer}}%</td> <?php }?>
                <td><?php if($product->publication_status == 1){ ?><a style="color: green" >Published</a><?php } else{ ?> <a style="color: darkred">Unpublished</a><?php } ?></td>
                <td>
                    <?php if($product->publication_status == 1 ){ ?>
                    <a style="color:red" class="glyphicon glyphicon-remove" href="{{ url('/deactive-product/'.$product->product_id) }}"></a> <?php } else{
                    ?>
                    <a style="color:green" class="glyphicon glyphicon-ok" href="{{ url('/active-product/'.$product->product_id) }}"></a><?php }?>

                    |
                    <a href="{{ url('/edit-product/'.$product->product_id) }}">Edit</a> |
                    <a style="color:red;list-style: none" href="{{ url('/delete-product/'.$product->product_id) }}" onclick="return confirm('Are you sure to delete it?')">Delete</a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
    
    <a href="{{url('/do-pdf-published-product/{id}')}}"><span class="fa fa-print"> </span> PDF</a>

    <div>
        <center>{{ $products->render() }}  </center>
    </div>

    </div>


@endsection
