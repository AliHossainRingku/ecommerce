@extends('layout')

@section('content')
    <br><h2>My Orders</h2>

    {{ Session::get('msg') }}

    <hr>
    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>SI</th>
            <th>Customer Name</th>
            <th>Invoice</th>
            <th>Order Total</th>
            <th>Mobile</th>
            <th>Payment</th>
            <th>Time</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>

        <?php
        $i = 0;
        ?>
        @foreach($all_order_info as $order)
            <tr class="center">
                <td>{{ ++$i }}</td>
                <td class="center">{{ $order->customer_name }}</td>
                <td class="center">{{ $order->order_id }}</td>
                <td class="center">{{ $order->order_total }}</td>
                <td class="center">{{ $order->shipping_mobile }}</td>
                <td class="center">{{ $order->payment_method }}</td>
                <td class="center">{{ $order->updated_at }}</td>
                <td class="center"><?php if($order->order_status == 1){ ?>Confirmed<?php } else{ ?> Pending</pre><?php } ?></td>
                <td style="font-size: 25px">
                    <?php if($order->order_status == 1 ){ ?>
                    <a style="color:red" class="glyphicon glyphicon-remove"></a> <?php } else{
                    ?>
                    <a href="{{ URL::to('/confirm-order/'.$order->order_id) }}" style="color:green" class="glyphicon glyphicon-ok" ></a><?php }?>
                    |
                    <a class="glyphicon glyphicon-eye-open" href="{{ URL::to('/view-order/'.$order->order_id) }}" ></a> |
                    <a style="color:red;list-style: none" class="fa fa-trash-o" href="{{ URL::to('/delete-order/'.$order->order_id) }}" onclick="return confirm('Are you sure to delete it?')"></a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
    </div>




@endsection
