@extends('layout')

@section('content')
            <div>
                <br><br><br><br>
                
                <center><img src="{{asset('public/frontend/add-banner/thankyou.png')}}" style="height: 200px; width: 300px;"></center>
                <center><p>Thank you for your ordering to <a href="http:\\www.jahazee.com">Jahazee.com</p></a> Your order no : </center><br><br><br><br><br><br><br><br><br><br><br><br>

                <?php $cart_items = Cart::getContent();

                foreach ($cart_items as $item){

                    $product = array();
                    $product['product_name'] = $item->name;
                    ?>

                <?php
                }
                ?>

            </div>


@endsection