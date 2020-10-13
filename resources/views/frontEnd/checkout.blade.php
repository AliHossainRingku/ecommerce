@extends('layout')

@section('content')

    <br><br><br><br>

    <?php 
        $customer_email = Session::get('customer_email');
        
        $address = DB::table('tbl_customer')->select('customer_name')->where(1);
    ?>

    <?php
        $total = Cart::getTotal();
        if($total){
    ?>
        <div class="container mt-5 mb-4">
        <div class="row">
            <div class="col-3">
            </div>
            <div class="col-sm-10 col-md-6" id="form-group-checkout">
                        <h5>Shipping Details</h5>
                        <form action="{{URL::to('/confirm-shipping')}}" method="post" enctype="multipart/form-data">
                            {{@csrf_field()}}
                            <div class="form-group">
                                <input type="text" name="shipping_name" id="shipping_name" class="form-control m-1" placeholder="Your Name *" required>
                            </div>
                            <div class="form-group">
                                <input type="text" name="shipping_mobile" id="shipping_mobile" class="form-control m-1" placeholder="Mobile *" required>
                            </div>
                            <div class="form-group">
                                <input type="text" name="shipping_address" id="shipping_address"  class="form-control m-1" placeholder="Address *" required>
                            </div>
                            <div class="form-group">
                                <input type="text" name="shipping_email" id="shipping_email" value="{{$customer_email}}" class="form-control m-1" placeholder="Email (Optional)">
                            </div>
                            <div class="form-group ml-1">
                                <input type="radio" name="payment_method" value="hand" checked> Hand Cash
                                <input type="radio" name="payment_method" value="bcash"> bCash
                                <input type="radio" name="payment_method" value="cheque"> Cheque<br>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-warning float-right">Confirm Shipping</button>
                            </div>

                        </form>
                </div>
                <div class="col-3">
                </div>
            </div>
        </div>

    <?php }else{ ?>
    <div class="container">
        <div class="row">
            <div class="col-md-3 bg-light-gray">
            </div>
            <div class="col-md-6 ">
                <h6>You have no cart yet. Please add to cart any product first.</h6>
            </div>
                
             <div class="col-md-3 bg-light-gray">
            </div>
        </div>
    </div>
    
    <?php } ?>

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>




@endsection