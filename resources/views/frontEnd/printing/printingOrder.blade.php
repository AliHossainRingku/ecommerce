@extends('layout')

@section('content')
    
<div class="wraper5">
      <div class="quotationSide">
        <h1 class="mainShironam">Get a Price for Custom Printing</h1>
        <div class="callCenterInfo">
          <p>Call our expert at <b> 01822-272575</b>, 7am-7pm OR Email us at<b> customprint@jahazee.com</b> OR use the FORM below to <b>Send</b> your Quote</p>
        </div>

        <div class="quotationInfo">
          <form action="{{URL::to('/printing-order')}}" method="post" enctype="multipart/form-data"><p style="color: green">{{ Session::get('msg') }}</p>
           {{@csrf_field()}}
            <div class="row">
              <div class="projectInfo">
                <div class="row">
                  <div class="col-12">
                    <h4>Project Details</h4>
                  </div>
                  <div class="col-6">
                    Project Name <br> <input type="text" name="project_name" value="">
                  </div>
                  <div class="col-6">
                    Quantity <br> <input type="text" name="quantity" value="">
                  </div>
                  <div class="col-12">
                    Project Description
                    <br> <textarea name="project_description"></textarea>
                  </div>
                </div>
              </div>
              <div class="contactInfo1">
                <div class="row">
                  <div class="col-12">
                    <h4>Contact Information</h4>
                  </div>
                  <div class="col-12">
                    <input type="text" name="company_name" value=""><label for="">Company </label>
                  </div>
                  <div class="col-12">
                    <input type="text" name="contact_person_name" value=""><label for="">Contact Person </label>
                  </div>

                  <div class="col-12">
                    <input type="text" name="company_mobile" value=""><label for="">Mobile </label>
                  </div>
                  <div class="col-12">
                    <input type="text" name="company_email" value=""><label for="">Email </label>
                  </div>
                  <div class="col-12 col-sm-12 col-md-6">
                    <input type="text" name="district" value=""><label for="">District</label>
                  </div>
                  <div class="col-12 col-sm-12 col-md-6">
                    <input type="text" name="postal_code" value=""><label for="">Postal Code</label>
                  </div>
                  <div class="col-12">
                    <input type="checkbox" name="" value="" onclick="show()"> <span id="fileUploadTxt">I have files to attach that I want to include.</span>
                  </div>
                  <div class="col-12">
                    <input type="file" name="file_attach" value="" id="fileAttach">
                  </div>
                  <div class="col-12">
                    <button type="submit" name="button">Get Pricing</button>
                  </div>
                </div>
              </div>
            </div>
            </form>
        </div>
      </div>
    </div>

	<script type="text/javascript">
      function show(){
        var x = document.getElementById("fileAttach").style.display;
        if (x == "block") {
          document.getElementById("fileAttach").style.display= "none";
        }
        else {
          document.getElementById("fileAttach").style.display= "block";
        }

      }
    </script>

@endsection