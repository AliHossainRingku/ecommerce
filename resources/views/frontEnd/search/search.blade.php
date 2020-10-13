@extends('layout')

@section('content')
<!DOCTYPE html>
    <html>
    <head>
    <meta name="_token" content="{{ csrf_token() }}">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    </head>
    <body>
	    <div class="container">
		    <div class="row ml-5">
			
				<div class="modal">
					
				
			    <div class="header-search">
					<input type="text" class="form-control search-input" id="search" name="search" placeholder="Search by Product Name"/>
				    <table class="table table-bordered table-hover">
					    <thead>
					    </thead>
					    <tbody>
					    </tbody>
			    	</table>
			    </div>
			    </div>

		    </div>
	    </div>
    <script type="text/javascript">
	    $('#search').on('keyup',function(){
	    	$value=$(this).val();
	   		$.ajax({
	    		type : 'get',
	    		url : '{{URL::to('searchPost')}}',
	   			data:{'search':$value},
	   			success:function(data){
	   				 $('tbody').html(data);
	    		}
	    	});
	    })

	    $.ajaxSetup({ headers: { 'csrftoken' : '{{ csrf_token() }}' } });
	    
    </script>
    </body>
</html>

@endsection
