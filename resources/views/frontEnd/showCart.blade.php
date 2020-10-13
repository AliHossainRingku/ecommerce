@extends('layout')

@section('content')

    <?php
    $contents = Cart::getContent();
    $getTotal = Cart::getTotal();
    //$subTotal = Cart::getSubTotal();
    $total = 0;// Cart::getTotal();
    $totalQty = 0;
    ?>
    <br><br><br>
    
    <div class="container">
    <div class="row" >
        <div class="col-1">
            
        </div>
        <div class="col-10" id="show-cart">
            <center><h5>Your Cart</h5></center>
            <div>
                <table class="table" id="show-cart_table">
                    <thead>
                        <tr>
                            <th > </th>
                            <th >Product</th>
                            <th class="text-center">Quantity</th>
                            <th class="text-center">Modify</th>
                            <th class="text-right">Unit Price</th>
                            <th class="text-right">Total Price</th>
                            <th class="text-right"> Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($contents as $content)
                        <tr>
                        <form method="post" action="{{URL::to('/update-cart/'.$content->id)}}">
                                    {{csrf_field()}}
                            <td><img src="{{substr(($content->attributes),2,-2)}}" style="height: 60px; width: 50px" /> </td>
                            <td class="col-4 col-sm-4 col-md-4">{{$content->name}}<p>Product ID: {{$content->id}}</p></td>
                            <td><input class="form-control" name="product_quantity" type="text" value="{{$content->quantity}}" /></td>
                            <td>                                                
                                    <input type="hidden" name="product_id" id="product_id" value="{{$content->id}}"/>
                                    <input type="hidden" name="product_name" id="product_name" value="{{$content->name}}"/>
                                    <input type="hidden" name="product_price" id="product_price" value="{{$content->price}}"/>
                                    
                                    <input type="hidden" name="product_picture" id="product_picture" value="{{substr(($content->attributes),2,-2)}}"/>

                                    <button type="submit" class="btn btn-default"><i class="fa fa-shopping-cart"></i> Update</button>
                        </form>
                            </td>
                            <td class="text-right"><div class="productPriceTag">{{$content->price}} Tk.</div></td>

                            <?php
                                $price = $content->price;
                                $qty = $content->quantity;
                                $subTotal = $price * $qty;
                                $total = $total + $subTotal;
                                $totalQty = $totalQty + $qty ;
                            ?>
                            <td class="text-right"><div class="productPriceTag">{{$subTotal}}</div></td>
                            <td class="text-right"><a href="{{ url('/delete-cart/'.$content->id) }}"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button></a> </td>
                        </tr>
                        @endforeach

                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Net-Total</td>
                            <td class="text-right"><div class="productPriceTag">{{$total}} Tk.</div></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Shipping</td>
                            <td class="text-right">0 Tk.</td>
                            <td></td>
                        </tr>
                        <tr class=" bg-gray">
                            <td></td>
                            <td>Total Quantity: <span> {{$totalQty}} </span></td>
                            <td></td>
                            <td></td>
                            <td><strong>Total</strong></td>
                            <td class="text-right"><strong><div class="productPriceTag">{{$total+0}} Tk.</div></strong></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>

                        </tr>
                    </tbody>
                </table>

            </div>
            <div class="col mb-2">
            <div class="row">
                <div class="col-sm-6 col-md-6 text-right" id="show-cart-continue">
                    <a class="btn btn-lg btn-block btn-light"href="{{URL::to('/')}}">Continue Shopping</a>
                </div>
                <div class="col-sm-6 col-md-6 text-right" id="show-cart-checkout">
                     <a class="btn btn-lg btn-block btn-warning text-uppercase" href="{{URL::to('/checkout')}}">Checkout</a>
                </div>
            </div>
        </div>
        </div>
        <div class="col-1">
            
        </div>

        
    </div>
</div>
            <!-- END CART-->
            <br><br><br><br>
            <br><br><br><br>
@endsection
























