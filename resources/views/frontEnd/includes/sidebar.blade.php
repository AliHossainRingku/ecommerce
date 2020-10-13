<div class="left-sidebar">
    <h2>Category</h2>
    <div class="panel-group category-products" id="accordian"><!--category-productsr-->

        <?php $all_published_category_info = DB::table('tbl_category')
            ->where('publication_status',1)
            ->get();
        ?>

        @foreach($all_published_category_info as $category)
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                            <a href="{{ url('/product_by_category/'.$category->category_id) }}">{{ $category->category_name }}</a>
                        </a>
                    </h4>
                </div>

                <div class="panel-collapse collapse"><!-- previous div id="sportswear" -->
                    <div class="panel-body">
                        <ul>
                            <li><a href="#">Nike </a></li>
                            <li><a href="#">Under Armour </a></li>
                            <li><a href="#">Adidas </a></li>
                            <li><a href="#">Puma</a></li>
                            <li><a href="#">ASICS </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        @endforeach
    </div><!--/category-products-->

    <div class="brands_products"><!--brands_products-->
        <h2>Brands</h2>
        <div class="brands-name">
            <ul class="nav nav-pills nav-stacked">

                <?php $all_published_brand_info = DB::table('tbl_brand')
                    ->where('publication_status',1)
                    ->get();

                ?>
                @foreach($all_published_brand_info as $brand)
                    <li><a href="{{ url('/product_by_brand/'.$brand->brand_id) }}"> <span class="pull-right">({{$brand->brand_id}})</span>{{ $brand->brand_name }}</a></li>
                @endforeach

            </ul>
        </div>
    </div><!--/brands_products-->

    <div class="price-range"><!--price-range-->
        <h2>Price Range</h2>
        <div class="well text-center">
            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
            <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
        </div>
    </div><!--/price-range-->

    <div class="shipping text-center"><!--shipping-->
    <!--img src="{{asset('frontend/images/home/shipping.jpg')}}" alt="" -->
    </div><!--/shipping-->

</div>