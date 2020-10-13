@extends('layout')

@section('content')


      <h5 class="modal-title">Search Product</h5><br>

      <div>
        
        <ul>
          <?php $i=1; ?>
          @foreach($products as $product)
            <li><a href="{{URL::to('/view-product/'.$product->product_id)}}"> {{$product->product_name}}</a></li>
          @endforeach
        </ul>
        
      </div>


       <!-- <ul id="myUL">
          <?php $i=1; ?>
          @foreach($products as $product)
            <li><a href="{{URL::to('/view-product/'.$product->product_id)}}">{{$i++}} | {{$product->product_id}} | {{$product->product_name}}</a></li>
          @endforeach
        </ul>
        -->


@endsection
	  