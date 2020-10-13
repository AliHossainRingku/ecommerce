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

    <div style="margin-left: 0px;margin-right: 0px">        
            <h3 align="center">All Published Products of Jahazee.com</h3>

            <table align="center" width="100%" style="border-collapse:collapse; font-family: 'Times New Roman'; font-size: 10px; border: 1px">
                <tr>
                    <th style="border: 1px solid;padding: 8px" width="5%">SI.</th>
                    <th style="border: 1px solid;padding: 8px" width="15%">Product ID</th>
                    <th style="border: 1px solid;padding: 8px" width="65%">Product Name</th>
                    <th style="border: 1px solid;padding: 8px" width="15%">Price(Tk)</th>
                </tr>
                <?php $i=1; $total =0; ?>
               @foreach($published_products as $product)
                    <tr>
                        <td style="border: 1px solid;padding: 5px" width="5%">{{$i++}}.</td>
                        <td style="border: 1px solid;padding: 5px" width="15%">{{$product->product_id}}</td>
                        <td style="border: 1px solid;padding: 5px" width="65%">{{$product->product_name}}</td>
                        <td style="border: 1px solid;padding: 5px" width="15%">{{$product->product_price}}</td>
                    </tr>
                @endforeach
            </table><br><br>
    </div>
            <h6 style="margin-right:0px;" align="right">Ali Hossain</h6>
            

</div>

</html>
