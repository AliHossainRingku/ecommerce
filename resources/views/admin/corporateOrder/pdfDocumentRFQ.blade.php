<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="{{asset('frontend/css/bootstrap.min.css')}}" rel="stylesheet">
</head>
<div>
    <h1 align="center">JAHAZEE.COM</h1>
    <p align="center">141, Mohammadi Plaza, Jubilee Road, Chittagong, Bangladesh.<br>
        Telephone: 01623549361, 01822-272575<br>
        E-mail: info@jahazee.com
    </p>
    <hr>

    <div style="margin-left: 0px;margin-right: 0px;">
        @foreach($corporate_order_data as $corporate_order)
        @endforeach
            <div width="100%" align="right">
                Date: <?php echo date_format(now(),"d/m/Y"); ?>
                <table align="left" style="font-size: 12px">
                    <tr>
                        <th align="left">Name: </th><td>Name: {{$corporate_order->company_name}}</td>
                    </tr>
                    <tr>
                        <th align="left">E-mail: </th><td>{{$corporate_order->company_email}}</td>
                    </tr>
                    <tr>
                        <th align="left">Mobile: </th><td>{{$corporate_order->company_mobile}}</td>
                    </tr>
                </table>
            </div>

            <h3 align="center">RFQ Bills</h3>

            <table align="center" width="100%" style="border-collapse:collapse; font-family: 'Times New Roman'; font-size: 10px; border: 0px">

                <tr>
                    <th style="border: 1px solid;padding: 10px" width="5%">SI.</th>
                    <th style="border: 1px solid;padding: 10px" width="40%">Product Name</th>
                    <th style="border: 1px solid;padding: 10px" width="20%">Specification</th>
                    <th style="border: 1px solid;padding: 10px" width="10%">Quantity</th>
                    <th style="border: 1px solid;padding: 10px" width="10%">Price(Tk)</th>
                    <th style="border: 1px solid;padding: 10px" width="10%">Sub-Total(Tk)</th>
                </tr>
                <?php $i=1; $total =0; ?>
                @foreach($corporate_order_data as $order)
                    <tr>
                        <td style="border: 1px solid;padding: 5px" width="5%">{{$i++}}.</td>
                        <td style="border: 1px solid;padding: 5px" width="40%">{{$order->product_name}}</td>
                        <td style="border: 1px solid;padding: 5px" width="20%">{{$order->product_specification}}</td>
                        <td style="border: 1px solid;padding: 5px" width="10%">{{$order->product_quantity}}</td>
                        <td style="border: 1px solid;padding: 5px" width="10%">{{$order->product_price}}</td>
                        <td style="border: 1px solid;padding: 5px" width="10%">{{$order->product_price*$order->product_quantity}}</td>
                    </tr>
                    <?php $total = $total + $order->product_price*$order->product_quantity; ?>
                @endforeach

                <tr>
                    <td style="border: 1px solid; padding: 10px" colspan="4"></td>
                    <td style="border: 1px solid; padding: 10px"  colspan="1" align="center"><b>Total</b></td>
                    <td style="border: 1px solid; padding: 10px"> <b>{{$total}}</b></td>
                </tr>
            </table><br><br>
    </div>
    <h6 align="right">Signature</h6>
            
            

</div>

</html>
