@extends('admin_layout')

@section('admin_content')
    <?php $total = 0; ?>

    @foreach($corporate_order_by_id as $order)
    @endforeach

    <br><h2>Invoice : {{$order->corporate_order_id}}</h2><hr>

    <div class="col-sm-6">
        <table class="table table-bordered">
            <tr>
                <label>Customer Info</label>
            </tr>
            <tr>
                <th>Invoice No</th><td>{{$order->corporate_order_id}}</td>
            </tr>
            <tr>
                <th>Name</th><td>{{$order->company_name}}</td>
            </tr>
            <tr>
                <th>Contact</th><td>{{$order->company_mobile}}</td>
            </tr>
            <tr>
                <th>E-mail</th><td>{{$order->company_email}}</td>
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
                <th>Product Name</th>
                <th>Specification</th>
                <th>Quantity</th>
                
            </tr>
            @foreach($corporate_order_by_id as $order)
            
            <?php if($order->product_id) { ?>
            <tr>
                <td>{{$order->product_name}}</td>
                <td>{{$order->product_specification}}</td>
                <td>{{$order->product_quantity}}</td>
                   
            </tr> 
            <?php } else{ ?>

            <tr>
                <td>empty</td>
                <td>empty</td>
                <td>empty</td>
                   
            </tr>
            <?php } ?>
            @endforeach



        </table>

        <center><img src="{{asset($order->file)}}" style="max-height: 768px;max-width: 1024px;" alt="NO IMAGE UPLOADED"></center>
            <div id="order_confirmation">

                <a href="{{ URL::to('/confirm-corporate-order/'.$order->corporate_order_id) }}" class="btn btn-success pull-right">Confirm</a>
                <a href="{{ URL::to('/edit-corporate-order/'.$order->corporate_order_id) }}" class="btn btn-primary pull-right">Edit</a>
                <a href="{{ URL::to('/delete-corporate-order/'.$order->corporate_order_id) }}" class="btn btn-warning pull-right">Delete</a>
            </div>
    </div>
    <br><br>


@endsection