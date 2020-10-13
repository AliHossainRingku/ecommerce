@extends('admin_layout')

@section('admin_content')
    <?php $total = 0; ?>

    @foreach($corporate_order_by_id as $corporate_order)
    @endforeach

    <br><h2>Invoice : {{$corporate_order->corporate_order_id}}</h2><hr>

    <div class="col-sm-6">
        <table class="table table-bordered">
            <tr>
                <label>Customer Info</label>
            </tr>
            <tr>
                <th>Invoice No</th><td>{{$corporate_order->corporate_order_id}}</td>
            </tr>
            <tr>
                <th>Name</th><td>{{$corporate_order->company_name}}</td>
            </tr>
            <tr>
                <th>Contact</th><td>{{$corporate_order->company_mobile}}</td>
            </tr>
            <tr>
                <th>E-mail</th><td>{{$corporate_order->company_email}}</td>
            </tr>
        </table>
    </div>

    <div class="col-sm-6">
        <table class="table table-bordered">
            <tr>
                <label>Shipping Details</label>
            </tr>
            <tr>
                <th>Name</th><td></td>
            </tr>
            <tr>
                <th>Address</th><td></td>
            </tr>
            <tr>
                <th>Contact</th><td></td>
            </tr>
            <tr>
                <th>E-mail</th><td></td>
            </tr>
        </table>
    </div>

    <div class="col-sm-12">
        <table class="table table-striped table-bordered" border="1px">
            <tr>
                <th>SI</th>
                <th>Product Name</th>
                <th>Specification</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th>Sub Total</th>
                <th>Action</th>
                
            </tr>
            <?php $i = 1;?>

            
            @foreach($corporate_order_by_id as $corporate_order)
            <tr>
            	{!! Form::open(['url'=>'/update-corporate-order','method'=>'POST', 'name'=>'editForm']) !!}

                <td><?php echo $i++; ?></td>
                <td><input type="text" name="product_name" value="{{$corporate_order->product_name}}"></td>
                <td><input type="text" name="product_specification" value="{{$corporate_order->product_specification}}"></td>
                <td><input type="text" name="product_quantity" value="{{$corporate_order->product_quantity}}"></td>
                <td><input type="text" name="product_price" value="{{$corporate_order->product_price}}"></td>
                <td>{{$corporate_order->product_quantity * $corporate_order->product_price}}</td>
                <input type="hidden" name="corporate_order_details_id" value="{{ $corporate_order->corporate_order_details_id }}">
                <td><button type="submit">Update</button></td>
                  {!! Form::close() !!}
 
            </tr>
            @endforeach

            
           

        </table>
            <div id="order_confirmation">

                <a href="{{ URL::to('/update-corporate-order') }}" class="btn btn-success pull-right">Update</a>
                <a href="{{ URL::to('/delete-corporate-order/'.$corporate_order->corporate_order_id) }}" class="btn btn-warning pull-right">Delete</a>
                <a style="font-size: 35px" href="{{ URL::to('/do-pdf-rfq/'.$corporate_order->corporate_order_id) }}" class="fa fa-file-pdf-o pull-right"></a>
            </div>
    </div>
    <br><br>


@endsection