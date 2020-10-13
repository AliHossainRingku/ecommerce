@extends('layout')

@section('content')
<br><br><br>
	<title>Search Autocomplete</title>

	<div class="container box">
		<h3 align="center">Please search Autocomplete Ajax JQuery</h3>
		<div class="form-group">
			<input type="" name="country_name" id="country_name" class="form-control input-lg" placeholder="Please Enter Name Here">
			<div id="country_list">
				
			</div>
		</div>
		{{ csrf_field() }}
	</div>


	<script>
		$(document).ready(function(){
			$('#country_name').keyup(function(){
				var query = $(this).val();

				if(query != ''){
					var _token = $('input[name="_token"]').val();
					$.ajax({
						url:"{{route('autocomplete.fetch') }}",
						method:"POST",
						data:{query:query, _token:_token},
						success:function(data){
							$('#country_list').fadeIn();
							$('#country_list').html(data);
						}

					})
				}
			});
		});
	</script>
@endsection




