@extends('layout')

@section('content')
    <?php $total = 0; ?>

    @foreach($order_by_id as $order)
    @endforeach

    <br><h2>Invoice : {{$order->order_id}}</h2><hr>

    <div class="col-sm-6">
        <table class="table table-bordered">
            <tr>
                <label>Customer Info</label>
            </tr>
            <tr>
                <th>Invoice No</th><td>{{$order->order_id}}</td>
            </tr>
            <tr>
                <th>Name</th><td>{{$order->customer_name}}</td>
            </tr>
            <tr>
                <th>Contact</th><td>{{$order->customer_mobile}}</td>
            </tr>
            <tr>
                <th>E-mail</th><td>{{$order->customer_email}}</td>
            </tr>
        </table>
    </div>

    <div class="col-sm-6">
        <table class="table table-bordered">
            <tr>
                <label>Shipping Details</label>
            </tr>
            <tr>
                <th>Name</th><td>{{$order->shipping_name}}</td>
            </tr>
            <tr>
                <th>Address</th><td>{{$order->shipping_address}}</td>
            </tr>
            <tr>
                <th>Contact</th><td>{{$order->shipping_mobile}}</td>
            </tr>
            <tr>
                <th>E-mail</th><td>{{$order->shipping_email}}</td>
            </tr>
        </table>
    </div>

    <div class="col-sm-12">
        <table class="table table-striped table-bordered" border="1px">
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Sub Total</th>
            </tr>
            @foreach($order_by_id as $order)
                <?php $total = $total + $order->product_sales_quantity * $order->product_price ?>
                <tr>
                    <td>{{$order->product_name}}</td>
                    <td>{{$order->product_sales_quantity}}</td>
                    <td>{{$order->product_price}}</td>
                    <td>{{$order->product_sales_quantity * $order->product_price}}</td>
                </tr>
            @endforeach

            <tr>
                <td></td>
                <td></td>
                <td><b>Total</b></td>
                <td><b>{{$total}}</b></td>
            </tr>

        </table>
    </div>

    <a href="{{ URL::to('/do-pdf/'.$order->order_id) }}" class="fa fa-print pull-right">PDF</a>

@endsection