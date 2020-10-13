@extends('admin_layout')

@section('admin_content')
    <br><h3 align="center">Order Requests</h3>

    {{ Session::get('msg') }}

    <hr>
    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>SI</th>
            <th>Customer Name</th>
            <th>Invoice</th>
            <th>Mobile</th>
            <th>Order Total</th>
            <th>Payment</th>
            <th>Time</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>

        <?php
        $i = 0;
        ?>
        @foreach($request_order as $order)
            <tr class="center">
                <td>{{ ++$i }}</td>
                <td class="center">{{ $order->shipping_name }}</td>
                <td class="center">{{ $order->order_id }}</td>
                <td class="center">{{ $order->shipping_mobile }}</td>
                <td class="center">{{ $order->order_total }}</td>
                <td class="center">{{ $order->payment_method }}</td>
                <td class="center">{{ $order->updated_at }}</td>
                <td>
                    <a href="{{ URL::to('/view-request-order/'.$order->order_id) }}" >View</a> |
                    <a style="color:red;list-style: none" href="{{ URL::to('/delete-order/'.$order->order_id) }}" onclick="return confirm('Are you sure to delete it?')">Delete</a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
    </div>




@endsection
