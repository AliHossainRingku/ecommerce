@extends('layout')

@section('content')

    <div class="shopper-informations">
        <div class="row">
            <div class="col-sm-8" style="margin-left: 150px;>
                <div class="bill-to">
            <div>
                <h2>Payement</h2>
                <form action="{{URL::to('/confirm-order')}}" method="post" enctype="multipart/form-data">
                    {{@csrf_field()}}
                    <input type="radio" name="payment_gateway" value="bcash"> bCash<br>
                    <input type="radio" name="payment_gateway" value="mcash"> mCash<br>
                    <input type="radio" name="payment_gateway" value="handcash"> Hand Cash<br>
                    <button type="submit" class="btn btn-primary pull-right">Confirm Your Payment</button>
                </form>
            </div>
        </div>
    </div>
    </div>
    </div>

    <br>
    <br>
    <br>
    <br>


    <div>

    </div>




@endsection