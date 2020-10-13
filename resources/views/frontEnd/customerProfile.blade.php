@extends('layout')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-12">
            <h5 class="title text-center">User Profile</h5>
        </div>
        
        <div class="col-2">   
        </div>
        <div class="col-8 mb-5" id="customer_profile">
            @if($customer_email != null)

                @foreach($customer_info as $customer)
                    <label>Name:</label> {{ $customer->customer_name }}<br>
                    <label>Email:</label> {{ $customer->customer_email }}<br>
                    <label>Mobile:</label> {{ $customer->customer_mobile }}<br>
                @endforeach

            @else
                <h6>You did't login yet. Please login first to see your profile. </h6>
            @endif
       
            <br><h6>My Orders</h6>

            {{ Session::get('msg') }}

            <hr>
            <table class="table table-bordered">
                <thead class="thead-light">
                <tr>
                    <th>SI</th>
                    <th>Invoice</th>
                    <th>Order Total</th>
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
                        <td class="center">{{ $order->order_id }}</td>
                        <td class="center">{{ $order->order_total }}</td>
                        <td class="center">{{ $order->payment_method }}</td>
                        <td class="center">{{ $order->updated_at }}</td>
                        <td class="center"><?php if($order->order_status == 1){ ?>Confirmed<?php } else{ ?> Pending</pre><?php } ?></td>
                        <td>
                            <a href="{{ URL::to('/see-order/'.$order->order_id) }}" ><i class="glyphicon glyphicon-eye-open"></i>View</a>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>

            <div class="col-2">
            </div>
    </div>
</div>

@endsection