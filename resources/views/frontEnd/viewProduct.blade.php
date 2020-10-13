@extends('layout')

@section('content')
<div class="container p-5">
    
    <div class="row p-5">

    @foreach($view_products as $product)

                <div class="div-left">
                    <img src="{{asset($product->product_picture)}}" alt="" />
                </div>

                <div class="div-right">
                    <h5>{{$product->product_name}}</h5>
                        <p>Product ID: {{$product->product_id}}</p>
                        <p><b>Sub Category:</b> {{$product->sub_category_name}}</p>
                        <p><b>Category:</b> {{$product->category_name}}</p>
                        <p><b>Brand:</b> {{$product->brand_name}}</p>
                        <p><b>Price:</b> {{$product->product_price}} Tk.</p>
                        <p><b>Detail:</b>
                        {{$product->product_long_description}}</p>

                        <form action="{{URL::to('/add-to-cart/'.$product->product_id)}}">
                            {{csrf_field()}}
                            <input type="hidden" name="product_name" id="product_name" value="{{$product->product_name}}"/>
                            <input type="hidden" name="product_id" id="product_id" value="{{$product->product_id}}"/>
                            <input type="hidden" name="product_price" id="product_price" value="{{$product->product_price}}"/>
                            <input type="hidden" name="product_picture" id="product_picture" value="{{asset($product->product_picture)}}"/>

                            <span>
                                
                                <label>Quantity:</label>
                                <input style="border: gray 1px solid; padding: 5px; border-radius: 4px;" class="form-cart" type="text" name="quantity" id="quantity" value="1"autocomplete="1"/>
                                <button type="submit" class="btn btn-warning cart">
                                    <i class="fa fa-shopping-cart"></i>
                                    Add to cart
                                </button>
                            </span>
                        </form>
                        
                </div>  
           
        @endforeach
    </div>
</div>
@endsection