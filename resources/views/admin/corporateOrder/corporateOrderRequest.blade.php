@extends('admin_layout')

@section('admin_content')
    <br><h3 align="center">Order Requests</h3>

    {{ Session::get('msg') }}

    <hr>
    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>SI</th>
            <th>Quotation No.</th>
            <th>Company Name</th>
            <th>Company Email</th>
            <th>Mobile</th>
            <th>Time</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>

        <?php
        $i = 0;
        ?>
        @foreach($all_corporate_order_info as $order)
            <tr class="center">
                <td>{{ ++$i }}</td>
                <td class="center">{{ $order->corporate_order_id }}</td>
                <td class="center">{{ $order->company_name }}</td>
                <td class="center">{{ $order->company_email }}</td>
                <td class="center">{{ $order->company_mobile }}</td>
                <td class="center">{{ $order->updated_at }}</td>
                <td>
                    <a href="{{ URL::to('/view-corporate-request-order/'.$order->corporate_order_id) }}" >View</a> |
                    <a style="color:red;list-style: none" href="{{ URL::to('/delete-corporate-order/'.$order->corporate_order_id) }}" onclick="return confirm('Are you sure to delete it?')">Delete</a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
    </div>




@endsection
