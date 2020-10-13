//For Add Student 
$(function(){

  $('#form-data').submit(function(e){
    //alert("Submitted");
    var route = $('#form-data').data('route');
    var form_data = $(this);

    $('.alert').remove();

    $.ajax({
      type: "POST",
      url: route,
      data: form_data.serialize(),
      success: function(Response){
        console.log(Response);
          if (Response.firstname) {
            $('#messages').append('<p class="alert">'+Response.firstname+'</p>')
          }

          if (Response.lastname) {
            $('#messages').append('<p class="alert">'+Response.lastname+'</p>')
          }

          if (Response.email) {
            $('#messages').append('<p class="alert">'+Response.email+'</p>')
          }

          if (Response.password) {
            $('#success').append('<p class="alert">'+Response.success+'</p>')
          }
        
      }

    });
    
    //alert("Sunbmitted");
    e.preventDefault();

  });
  
});



//For Add Product and Save Product
$(function(){
  alert("Submitted");
  $('#form-data').submit(function(e){
    //alert("Submitted");
    var route = $('#form-data').data('route');
    var form_data = $(this);

    $('.alert').remove();

    $.ajax({
      type: "POST",
      url: route,
      data: form_data.serialize(),
      success: function(Response){
        console.log(Response);
          if (Response.firstname) {
            $('#messages').append('<p class="alert">'+Response.firstname+'</p>')
          }

          if (Response.lastname) {
            $('#messages').append('<p class="alert">'+Response.lastname+'</p>')
          }

          if (Response.email) {
            $('#messages').append('<p class="alert">'+Response.email+'</p>')
          }

          if (Response.password) {
            $('#success').append('<p class="alert">'+Response.success+'</p>')
          }
        
      }

    });
    
    //alert("Sunbmitted");
    e.preventDefault();

  });
  
});


/*
$('#getRequest').click(function(){
    alert($.(this).text());
    $.get("demo_test_post.asp",
    {
      name: "Donald Duck",
      city: "Duckburg"
    },
    function(data,status){
      alert("Data: " + data + "\nStatus: " + status);
    });
  });

  */