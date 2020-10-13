@extends('layout')

@section('content')
	<div class="container">

		<!--ADD SECTION 2-->
		<div class="row bg-addColor">
			<div class="col-12">
				<div class="median-add1">
					<img src="{{asset('public/frontend/add/a3.png')}}">
				</div>
			</div>
		</div>

		
		<div class="row mb-4 pb-1 pt-4 bg-light-gray">
			<div class="col-12">
			@foreach($show_products_by_sub_category as $product)
			@endforeach
				<h5>{{$product->sub_category_name}}</h5>
			</div>
			<div class="underline-black"></div>
		</div>
		

		<div class="row mt-3 mb-3">
			@foreach($show_products_by_sub_category as $product)
			<div class="col-6 col-md-3 col-sm-4 col-lg-2 col-xl-2 mt-2 mb-2">
				<div class="productWall">
					<a href="{{URL::to('/view-product/'.$product->product_id)}}" >
						<div class="productImage">
							<img src="{{asset($product->product_picture)}}">
						</div>
						<div class="productInfo">
							<div class="productNameTag"><h6>{{$product->product_name}}</h6></div>
							<div class="productPriceTag"><h5><b>BDT. {{$product->product_price}}</b></h5></div>
						</div>
					</a>
					<div class="productCart">
							<form action="{{URL::to('/add-to-cart/'.$product->product_id)}}">
									{{csrf_field()}}
									<input type="hidden" name="product_name" id="product_name" value="{{$product->product_name}}"/>
									<input type="hidden" name="product_id" id="product_id" value="{{$product->product_id}}"/>
									<input type="hidden" name="product_price" id="product_price" value="{{$product->product_price}}"/>
									<input type="hidden" name="product_picture" id="product_picture" value="{{$product->product_picture}}"/>
									<input type="hidden" name="quantity" id="quantity" value="1"autocomplete="1"/>

									<button type="submit" class="btn btn-warning"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
						</form>
					</div>
				</div>
			</div>
			@endforeach
		</div>
		
		<div class="row">
			<div class="col-4">
				
			</div>
			<div class="pagination">
				<center>{{ $show_products_by_sub_category ->render() }}  </center>
			</div>
			<div class="col-4">
				
			</div>

		</div>
	
		
		<!--ADD SECTION 1-->
		<div class="row mt-4 mb-5 bg-addColor">
			<div class="col-12">
				<div class="median-add1">
					<img src="{{asset('public/frontend/add/a3.png')}}">
				</div>
			</div>
		</div>
		<!--END ADD SECTION 1-->
		
	</div>
			
@endsection