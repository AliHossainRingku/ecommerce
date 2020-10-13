
	<div id="header">
		<div class="header-toggle">
			<div class="toggle-btn" onclick="toggleSidebar()">
				<button class="btn btn-warning">
					<span></span>
					<span></span>
					<span></span>
				</button>
			</div>
		</div>

		<div class="header-logo">
			<a href="{{url('/')}}"><img src="{{asset('public/frontend/banner/logo.png')}}"></a>
		</div>
		<div class="header-search">
			<form class="corporate-order" action="{{URL::to('/search')}}" method="post" enctype="multipart/form-data">
				{{@csrf_field()}}
				<input name="search" type="text" placeholder="Search by product name or brand name">
				<button class="btn btn-default" type="submit"><span class="fa fa-search"></span> Search </button>
			</form>


		</div>

		<!-- TESSTTTT-->
 		<div class="header-nav">
			<ul>
				<li>
					<a href="{{URL::to('/customer-profile')}}"><button class="btn btn-lg btn-warning"><i class="fa fa-user"></i> Account </button></a>
				</li>

				<li>
					<a href="{{URL::to('/show-cart')}}"><button class="btn btn-lg btn-success"><i class="fa fa-shopping-cart" ></i> Cart <span class="badge bg-red">{{ Session::get('totalQty') }}</span> </button>
					</a>
				</li>

				<li>
					<?php if(Session::get('customer_email')){ ?>
						<a href="{{URL::to('/customer-logout')}}"><button class="btn btn-lg btn-info"><i class="fa fa-angle-double-right" ></i> Logout </button></a>

						<a href="{{URL::to('/customer-profile')}}"><button class="btn btn-lg btn-warning"><i class="fa fa-user"></i> Account </button></a>
					<?php }else{ ?>
						<a href="{{URL::to('/login-check')}}"><button class="btn btn-lg btn-info "><i class="fa fa-lock" ></i> Login </button></a>
					<?php } ?>
				</li>			
			</ul>
		</div>

	</div>



<div id="sidebar"> 
		
		<div id="small-side-nav"><!--Generally Hidden but active in smalldevice -->
  			<ul>
  				<li>
  					<a href="{{URL::to('/customer-profile')}}"><i class="fa fa-user"></i> Account</a>
  				</li>
  				<li>
  					<a href="{{URL::to('/show-cart')}}"><i class="fa fa-shopping-cart" ></i> Cart <span class="badge bg-red">{{ Session::get('totalQty') }}</span> </a>
  				</li>
  				<li>
	  				<?php if(Session::get('customer_email')){ ?>
					<a href="{{URL::to('/customer-logout')}}"><i class="fa fa-angle-double-right" ></i> Logout </a>
					<?php }else{ ?>
						<a href="{{URL::to('/login-check')}}"><i class="fa fa-lock" ></i> Login </a>
					<?php } ?>
				</li>
  			</ul>
		</div>
	  	<div class="list">
	  		<?php $total_offer = DB::table('tbl_product')
	            ->where('publication_status',1)
	            ->where('offer','>','0.00')
	            ->get();
	        ?>
		<div class="item"><li><a href="{{url('show_offer_products')}}">Offers <span class="badge badge-secondary"> <?php echo count($total_offer); ?> </span></a></li></div>
		<div class="item"><li><a href="{{url('/corporate-order')}}">Corporate Order</a></li></div>


		
		<hr>
		 <div > 		
		  	<ul>
			<?php $all_published_super_category_info = DB::table('tbl_super_category')
	            ->where('publication_status',1)
	            ->where('super_category_id',1)
	            ->get();    
	        ?>
			@foreach($all_published_super_category_info as $super_category) 
			<div class="item"><li><a href="#menuCategory{{$super_category->super_category_id}}" data-toggle="collapse" aria-expanded="false">{{$super_category->super_category_name}}  </a></li></div>
					<?php $all_published_category_info = DB::table('tbl_category')
		            ->where('publication_status',1)
		            ->where('super_category_id',$super_category->super_category_id)
		            ->get();    
			        ?>
			        <ul class="collapse list-unstyled" id="menuCategory{{$super_category->super_category_id}}">
						@foreach($all_published_category_info as $category) 
						<div class="item-l1"><li><a href="#menuSubCategory{{$category->category_id}}"data-toggle="collapse" aria-expanded="false">{{$category->category_name}}  </a></li>

								<?php $all_published_sub_category_info = DB::table('tbl_sub_category')
						            ->where('publication_status',1)
						            ->where('category_id',$category->category_id)
						            ->get();    
						        ?>
						        <ul class="collapse list-unstyled" id="menuSubCategory{{$category->category_id}}">
									@foreach($all_published_sub_category_info as $sub_category) 
									<div class="item-l2" ><li><a href="{{ url('/product_by_sub_category/'.$sub_category->sub_category_id) }}">{{$sub_category->sub_category_name}}  </a></li></div>
									@endforeach
								</ul>
						</div>
						@endforeach
					</ul>
				
			@endforeach

			<!-- FOR OTHERS SECTION EXCEPT STATIONERY -->
			<?php $all_published_super_category_info = DB::table('tbl_super_category')
	            ->where('publication_status',1)
	            ->where('super_category_id','=','2')
	            ->orWhere('super_category_id','=','3')
	            ->orWhere('super_category_id','=','4')
	            ->get();    
	        ?>
			@foreach($all_published_super_category_info as $super_category) 
			<div class="item"><li><a href="#menuCategory{{$super_category->super_category_id}}" data-toggle="collapse" aria-expanded="false">{{$super_category->super_category_name}}  </a></li></div>
					<?php $all_published_sub_category_info = DB::table('tbl_category')
					->join('tbl_sub_category','tbl_category.category_id','=','tbl_sub_category.category_id')
		            ->where('tbl_category.publication_status',1)
		            ->where('tbl_sub_category.publication_status',1)
		            ->where('super_category_id',$super_category->super_category_id)
		            ->get();    
			        ?>
			        <ul class="collapse list-unstyled" id="menuCategory{{$super_category->super_category_id}}">
						@foreach($all_published_sub_category_info as $sub_category) 
						<div class="item-l1"><li><a href="{{ url('/product_by_sub_category/'.$sub_category->sub_category_id) }}" >{{$sub_category->sub_category_name}}  </a></li>

						</div>
						@endforeach
					</ul>
				
			@endforeach

			<!-- FOR PRINTING QUOTES -->
			<?php $all_published_super_category_info = DB::table('tbl_super_category')
	            ->where('publication_status',1)
	            ->where('super_category_id','=','5')
	            ->get();    
	        ?>
			@foreach($all_published_super_category_info as $super_category) 
			<div class="item"><li><a href="{{url('printing-order')}}">{{$super_category->super_category_name}}  </a></li></div>
					
				
			@endforeach

			</ul>
			<br><br>
		</div>
	</div>
	</div>
	<script>
		function toggleSidebar(ref){
		  document.body.classList.toggle('sidebar-active');
		}
	</script>