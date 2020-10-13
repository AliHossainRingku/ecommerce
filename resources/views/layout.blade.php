<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Jahazee.com is a B2B e-commerce website that provides affordable, quality office supplies and delivery services to customers in Chittagong, Bangladesh. The goal of us is offering our customers a large selection, low prices, and top level customer service. We try every day to make sure we consistently hit these goals for our customers.">
    <meta name="author" content="Jahazee.com">
    <title>Jahazee | Office Supplies Company in Bangladesh</title>
	
	
		<link rel="shortcut icon" type="image/x-icon" href="{{asset('public/icon.png')}}" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

		<link href="{{asset('public/frontend/css/style.css')}}" rel="stylesheet">
		<link href="{{asset('public/frontend/css/bootstrap.min.css')}}" rel="stylesheet">
		<link href="{{asset('public/frontend/css/font-awesome.min.css')}}" rel="stylesheet">
       
   </head><!--/head-->

<body>

	<div class="content">
	<!-- My DETAIL PAGE WITHOUT SIDEBAR AND HEADER-->
		
		<!--Header @ include('frontEnd.includes.header')-->
			@include('frontEnd.includes.header')

		<!--Slider @ include('frontEnd.includes.slider') -->
		<!--Slider @ include('frontEnd.includes.slider') -->

		<section>
			



					<!--This content is used for dynamic contents of products for homepage-->
						@yield('content')
						

				
		</section>
		
		<!-- Footer @ include('frontEnd.includes.footer') -->
			@include('frontEnd.includes.footer')
	
	</div>
		<script src="{{asset('public/frontend/js/popper.min.js')}}"></script>
		<script src="{{asset('public/frontend/js/jquery-slim.min.js')}}"></script>
		<script src="{{asset('public/frontend/js/bootstrap.min.js')}}"></script>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		
</body>
</html>