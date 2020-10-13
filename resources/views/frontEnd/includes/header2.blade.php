<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="#"><i class="fa fa-phone"></i> +88 015 21 22 62 60</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> info@jahazee.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="{{URL::to('/corporate-order')}}"><i class="fa"></i>Corporate</a></li>

                        <?php if(Session::get('customer_email')){ ?>
                            <li><a href="{{URL::to('/customer-logout')}}"><i class="fa"></i> Logout</a></li>
                            <?php }else{ ?>
                            <li><a href="{{URL::to('/login-check')}}"><i class="fa"></i> Login/Sign Up</a></li>
                            <?php } ?>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div class="logo pull-left">
                        <a href="{{url('/')}}"><img src="{{asset('frontend/images/home/logo.png')}}" alt="" /></a>
                    </div>
                    
                </div>
                <div class="col-sm-4" style="margin-top: 15px;">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="{{URL::to('/customer-profile')}}"><i class="fa fa-user"></i> Account</a></li>

                            <?php if(Session::get('customer_email')){ ?>
                                <li><a href="{{URL::to('/checkout')}}"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                            <?php }else{ ?>
                                <li><a href="{{URL::to('/checkout')}}"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                            <?php } ?>

                            <li><a href="{{url('/show-cart')}}"><i class="fa fa-shopping-cart"></i> Cart <span class="badge">{{ Session::get('totalQty') }}</span></a></li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->


    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="{{URL::to('/')}}" class="active">Home</a></li>
                            <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="shop.html">Products</a></li>
                                    <li><a href="product-details.html">Product Details</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="cart.html">Cart</a></li>
                                    <li><a href="login.html">Login</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">Category<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <h2>Category</h2>
                                    <?php $all_published_category_info = DB::table('tbl_category')
                                            ->where('publication_status',1)
                                            ->get();
                                    ?>
                                    @foreach($all_published_category_info as $category)
                                        <li>
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            <a href="{{ url('/product_by_category/'.$category->category_id) }}">{{ $category->category_name }}</a>
                                        </li>
                                    @endforeach
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">Brand<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <h2>Brand</h2>
                                    <?php $all_published_brand_info = DB::table('tbl_brand')
                                        ->where('publication_status',1)
                                        ->get();

                                    ?>
                                    @foreach($all_published_brand_info as $brand)
                                        <li>
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            <a href="{{ url('/product_by_brand/'.$brand->brand_id) }}"> {{ $brand->brand_name }}</a></li>
                                    @endforeach
                                </ul>
                            </li>
                            <li><a href="contact-us.html">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="search_box pull-right">
                        <input type="text" placeholder="Search"/>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header><!--/header-->

