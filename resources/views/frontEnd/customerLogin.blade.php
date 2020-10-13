@extends('layout')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6 bg-default p-5 mt-5">
            <form class="form" action="{{URL::to('/customer-login')}}">
                {{@csrf_field()}}
                <h5>Login to your account</h5> {{Session::get('msg')}}
                <div class="form-group">
                    <input type="email" name="customer_email" class="form-control" placeholder="Email Address" required/>
                </div>
                <div class="form-group">
                    <input type="password" name="customer_password" class="form-control" placeholder="Password" required/>
                </div>
                <span>
                      <input type="checkbox" class="checkbox">
                      Keep me signed in
                </span>
                <div class="form-group" >
                    <button type="submit" class="btn btn-success col-md-5 btn-block justify-content-center">Login</button>
                </div>
                <a class="form-group" href="{{url('customer-registration')}}">You don't have acccount?</a>

                <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            </form>
        </div>
        <div class="col-md-3">
        </div>
    </div>
</div>

@endsection