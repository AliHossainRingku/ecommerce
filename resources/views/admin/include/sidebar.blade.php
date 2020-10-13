<div class="sidebar-nav navbar-collapse">
    <ul class="nav" id="side-menu">
        <li class="sidebar-search">
            <div class="input-group custom-search-form">
                <input type="text" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
            </div>
            <!-- /input-group -->
        </li>
        <li>
            <a href="{{ URL::to('/dashboard') }}"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
        </li>
        <li>
            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Corporates <span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <li>
                    <a href="{{URL::to('/corporate-order-request')}}">Corporate Order Request</a>
                </li>
                <li>
                    <a href="{{URL::to('/manage-corporate-order')}}">Manage Corporate Orders</a>
                </li>
            </ul>
            <!-- /.nav-second-level -->
        </li>

        <li>
            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Categories <span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <li>
                    <a href="{{URL::to('/add-category')}}">Add Category</a>
                </li>
                <li>
                    <a href="{{URL::to('/manage-category')}}">Manage Categories</a>
                </li>
            </ul>
            <!-- /.nav-second-level -->
        </li>
        <li>
            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Sub Categories <span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <li>
                    <a href="{{URL::to('/add-sub-category')}}">Add Sub Category</a>
                </li>
                <li>
                    <a href="{{URL::to('/manage-sub-category')}}">Manage Sub Categories</a>
                </li>
            </ul>
            <!-- /.nav-second-level -->
        </li>
        <li>
            <a href="#"><i class="fa fa-braille fa-fw"></i> Brands <span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <li>
                    <a href="{{URL::to('/add-brand')}}">Add Brand</a>
                </li>
                <li>
                    <a href="{{URL::to('/manage-brand')}}">Manage Brand</a>
                </li>
            </ul>
            <!-- /.nav-second-level -->
        </li>
        <li>
            <a href="#"><i class="fa fa-product-hunt fa-fw"></i> Products <span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <li>
                    <a href="{{URL::to('/add-product')}}">Add Product</a>
                </li>
                <li>
                    <a href="{{URL::to('/manage-product')}}">Manage Product</a>
                </li>
            </ul>
            <!-- /.nav-second-level -->
        </li>
        <li>
            <a href="#"><i class="fa fa-sliders fa-fw"></i> Slider <span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <li>
                    <a href="{{URL::to('/add-slider')}}">Add Slider</a>
                </li>
                <li>
                    <a href="{{URL::to('/manage-slider')}}">Manage Slider</a>
                </li>
            </ul>
            <!-- /.nav-second-level -->
        </li>

        <li>
            <a href="{{URL::to('/request-order')}}"><i class="fa fa-users fa-fw"></i> Order Request</a>
        </li>
        <li>
            <a href="{{URL::to('/shipping-order')}}"><i class="fa fa-ship"></i> Order Shipping</a>
        </li>
        <li>
            <a href="{{URL::to('/payment-order')}}"><i class="fa fa-ship"></i> Order Payment</a>
        </li>
        <li>
            <a href="{{URL::to('/manage-order')}}"><i class="fa fa-pencil-square"></i> Manage Serverd Order</a>
        </li>
        <li>
            <a href="forms.html"><i class="fa fa-users fa-fw"></i> Delivery Men</a>
        </li>
        <li>
            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <li>
                    <a href="panels-wells.html">Panels and Wells</a>
                </li>
                <li>
                    <a href="buttons.html">Buttons</a>
                </li>
                <li>
                    <a href="notifications.html">Notifications</a>
                </li>
                <li>
                    <a href="typography.html">Typography</a>
                </li>
                <li>
                    <a href="icons.html"> Icons</a>
                </li>
                <li>
                    <a href="grid.html">Grid</a>
                </li>
            </ul>
            <!-- /.nav-second-level -->
        </li>
        <li>
            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <li>
                    <a href="#">Second Level Item</a>
                </li>
                <li>
                    <a href="#">Second Level Item</a>
                </li>
                <li>
                    <a href="#">Third Level <span class="fa arrow"></span></a>
                    <ul class="nav nav-third-level">
                        <li>
                            <a href="#">Third Level Item</a>
                        </li>
                        <li>
                            <a href="#">Third Level Item</a>
                        </li>
                        <li>
                            <a href="#">Third Level Item</a>
                        </li>
                        <li>
                            <a href="#">Third Level Item</a>
                        </li>
                    </ul>
                    <!-- /.nav-third-level -->
                </li>
            </ul>
            <!-- /.nav-second-level -->
        </li>
        <li>
            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <li>
                    <a href="blank.html">Blank Page</a>
                </li>
                <li>
                    <a href="login.html">Login Page</a>
                </li>
            </ul>
            <!-- /.nav-second-level -->
        </li>
    </ul>
</div>
<!-- /.sidebar-collapse -->