@extends('admin_layout')

@section('admin_content')
    <br><h3 align="center">Shipping Orders</h3>

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
                <td>
                    <a href="{{ URL::to('/view-payment-order/'.$order->order_id) }}" >View</a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
    </div>




@endsection
