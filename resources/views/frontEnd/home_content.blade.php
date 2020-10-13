@extends('layout')

@section('content')
		<!-- My DETAIL PAGE WITHOUT SIDEBAR AND HEADER-->
<div id="main-contents" class="active">

			<!-- SLIDER -->
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner">
				<div class="carousel-item active">
				  <img class="d-block w-100" src="{{asset('public/frontend/banner/b1.jpg')}}" alt="First slide">
				  <div class="carousel-caption d-md-block">
					<a href="{{url('/corporate-order')}}"><button class="btn btn-warning btn-lg" data-toggle="modal" data-target="#corporateOrderModal">Corporate Order</button></a>
				  </div>
				</div>
				<div class="carousel-item">
				  <img class="d-block w-100" src="{{asset('public/frontend/banner/b2.jpg')}}" alt="Second slide">
				  <div class="carousel-caption d-md-block">
					<a href="{{url('/corporate-order')}}"><button class="btn btn-warning btn-lg" data-toggle="modal" data-target="#corporateOrderModal">Corporate Order</button></a>
				  </div>
				</div>
				<div class="carousel-item">
				  <img class="d-block w-100" src="{{asset('public/frontend/banner/b3.jpg')}}" alt="Third slide">
				  <div class="carousel-caption d-md-block">
					<a href="{{url('/corporate-order')}}"><button class="btn btn-warning btn-lg" data-toggle="modal" data-target="#corporateOrderModal">Corporate Order</button></a>
				  </div>
				</div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			  </a>
			</div>
			<!--AFTER SLIDE DIV-->
			<div class="container-fluid offer pt-1 pb-0 bg-orange d-none d-md-block">
				<div class="row">
					<div class="col-md-4 m-right">
						<h5 >Free Shipping</h5>
						<p> on order over Tk. 2000 </p>
					</div>
					<div class="col-md-4 m-right">
						<h5 >Call us anytime</h5>
						<p> +880 17378 59493 </p>
					</div>
					<div class="col-md-4">
						<h5 >Our location</h5>
						<p>New market, Chittagong. </p>
					</div>
				</div>
			</div>
			
			
			<!--MAIN CONTENT START HERE-->
			
	<div class="container">
		
		<div class="row mb-4 pb-1 pt-4 bg-light-gray">
			<div class="col-12">
				<a href="{{url('show_recommended_products')}}"><h5>Recommended Products</h5></a>
			</div>
			<div class="underline-black"></div>
		</div>
		

		<div class="row mt-3 mb-3">
			@foreach($all_recommended_products as $product)
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
		
	
		<div class="row mb-4 pb-1 pt-4 bg-light-gray">
			<div class="col-12">
				<a href="{{url('show_trending_products')}}"><h5>Trending Products</h5></a>
			</div>
			<div class="underline-black"></div>
		</div>
		

		<div class="row mt-3 mb-3">
			@foreach($all_trending_products as $product)
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
	
		<div class="row mb-4 pb-1 pt-4 bg-light-gray">
			<div class="col-12">
				<a href="{{url('show_offer_products')}}"><h5>Offer Products</h5></a>
			</div>
			<div class="underline-black"></div>
		</div>
		

		<div class="row mt-3 mb-3">
			@foreach($all_offer_products as $product)
			<div class="col-6 col-md-3 col-sm-4 col-lg-2 col-xl-2 mt-2 mb-2">
				<div class="productWall">
					<div class="product-offer" >{{$product->offer}}% OFF</div>
					<a href="{{URL::to('/view-product/'.$product->product_id)}}" >
						<div class="productImage">
							<img src="{{asset($product->product_picture)}}">
						</div>
						<div class="productInfo">
							<div class="productNameTag"><h6>{{$product->product_name}}</h6></div>
							<div class="productPriceTag"><h5><b>BDT. {{$product->product_price - $product->product_price * $product->offer*.01}}</b></h5></div>
							<div class="productPriceTag"><del>BDT. {{$product->product_price}}</del></div>
						</div>
					</a>
					<div class="productCart">
							<form action="{{URL::to('/add-to-cart/'.$product->product_id)}}">
									{{csrf_field()}}
									<input type="hidden" name="product_name" id="product_name" value="{{$product->product_name}}"/>
									<input type="hidden" name="product_id" id="product_id" value="{{$product->product_id}}"/>
									<input type="hidden" name="product_price" id="product_price" value="{{$product->product_price - $product->product_price * $product->offer*.01}}"/>
									<input type="hidden" name="product_picture" id="product_picture" value="{{$product->product_picture}}"/>
									<input type="hidden" name="quantity" id="quantity" value="1"autocomplete="1"/>

									<button type="submit" class="btn btn-warning"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
						</form>
					</div>
				</div>
			</div>
			@endforeach
		</div>
		
		<!--ADD SECTION 1-->
		<div class="row mt-4 mb-5 bg-addColor">
			<div class="col-12">
				<div class="median-add1">
					<img src="{{asset('public/frontend/add/a2.png')}}">
				</div>
			</div>
		</div>
		<!--END ADD SECTION 1-->
		
		
		<div class="row mb-4 pb-1 pt-5 bg-light-gray">
			<div class="col-12">
				<a href="{{url('show_products_of_stationery')}}"><h5>Stationery</h5></a>
			</div>
			<div class="underline-black"></div>
		</div>
		

		<div class="row mt-3 mb-3">
			@foreach($all_stationery_products as $product)
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
		
		<div class="row mb-4 pb-1 pt-4 bg-light-gray">
			<div class="col-12">
				<a href="{{url('show_products_of_cleaning')}}"><h5>Cleaning</h5></a>
			</div>
			<div class="underline-black"></div>
		</div>
		

		<div class="row mt-3 mb-3">
			@foreach($all_cleaning_products as $product)
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
		
		<div class="row mb-4 pb-1 pt-4 bg-light-gray">
			<div class="col-12">
				<a href="{{url('show_products_of_snacks')}}"><h5>Snacks</h5></a>
			</div>
			<div class="underline-black"></div>
		</div>
		

		<div class="row mt-3 mb-3">
			@foreach($all_snacks_products as $product)
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
		
		<div class="row mb-4 pb-1 pt-4 bg-light-gray">
			<div class="col-12">
				<a href="{{url('show_products_of_business_gifts')}}"><h5>Business Gifts</h5></a>
			</div>
			<div class="underline-black"></div>
		</div>
		

		<div class="row mt-3 mb-3">
			@foreach($all_business_gift_products as $product)
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
		
		<div class="row mb-4 pb-1 pt-4 bg-light-gray">
			<div class="col-12">
				<a href="{{url('show_products_of_printing_press')}}"><h5>Printing & Press</h5></a>
			</div>
			<div class="underline-black"></div>
		</div>
		

		<div class="row mt-3 mb-3">
			@foreach($all_printing_press_products as $product)
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
		
		<!--ADD SECTION 2-->
		<div class="row mt-4 mb-4 bg-addColor">
			<div class="col-12">
				<div class="median-add1">
					<img src="{{asset('public/frontend/add/add2.jpg')}}">
				</div>
			</div>
		</div>
		<!--END ADD SECTION 2-->
	
	
</div>

@endsection