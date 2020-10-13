@extends('layout')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6 bg-default p-5 mt-5">
            <form class="form" action="{{URL::to('/customer-registration')}}" method="post" enctype="multipart/form-data">
                {{@csrf_field()}}
                <h5>New User Signup!</h5>
                <div class="form-group">
                     <input name="customer_name" id="customer_name" type="text" class="form-control" placeholder="Name" required/>
                </div>
               
                <div class="form-group">
                    <input name="customer_email" id="customer_email" type="email" class="form-control" placeholder="Email Address" required/>
                </div>

                <div class="form-group">
                    <input name="customer_mobile" id="customer_mobile" type="text" class="form-control" placeholder="Mobile No" required/>
                </div>

                <div class="form-group">
                    <input name="customer_password" id="customer_password" type="password" class="form-control" placeholder="Password" required/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success col-md-5 btn-block justify-content-center">Signup</button>
                </div>
                <a class="form-group" href="{{url('/customer-login')}}"> You have already an acccount?</a> 

                <br><br><br><br><br><br><br><br><br><br><br><br>
            </form>
        </div>
        <div class="col-md-3">
        </div>

    </div>


</div>

@endsection