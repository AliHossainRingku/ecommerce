@extends('layout')

@section('content')
    
<div class="wraper">

            <form class="corporate-order" action="{{URL::to('/corporate-order')}}" method="post" enctype="multipart/form-data"><p style="color: green">{{ Session::get('msg') }}</p>

                {{@csrf_field()}}
                <h2>Please submit your requirement for quotation</h2>
                <div class="main-quotation" id="main-quotation">
                    <div class="Quotation-shironam">
                        <div class="h-1">
                            <h6>Sl.</h6>
                        </div>
                        <div class="h-2">
                            <h6>Product Name</h6>
                        </div>
                        <div class="h-3">
                            <h6>Specification</h6>
                        </div>
                        <div class="h-4">
                            <h6>Quantity</h6>
                        </div>
                    </div>
                    <div class="c-1" id="m1">
                        <input type="text" name="sl[]" class="inp-1" id="" value="1" readonly="readonly">
                        <input type="text" name="productName[]" class="inp-2" id="" autofocus="autofocus" placeholder="Air Freshener">
                        <input type="text" name="productSpecification[]" class="inp-3" id="" placeholder="ACI, 300ml">
                        <input type="number" name="productQuantity[]" class="inp-4" id="" min="1" value="1">
                        <input type="button" name="" class="inp-5" id="1" value="X" hidden="hidden">
                    </div>
                </div>
                <div class="btn-add">
                    <input type="button" name="" value="Add Product" onclick="add()" id="btn1">
                </div>

                <div class="or" id="or">
                    <h3>OR</h3>
                </div>
                <div class="uploadFile">
                    <h4>Please upload file or picture</h4>
                    <input type="file" name="uploadFile1" id="uploadFile1">
                    <br>
                    <span>Max file size: 10MB. Allowed file types: jpg, jpeg, gif, png, zip, doc, docx, pdf, txt, csv,xlsx, xls
                    </span>
                </div>
              
                <div class="Organization-info">
                    <div class="organizationName">
                        Organization Name <br> <input type="text" name="company_name">
                    </div>
                    <div class="contactInfo">
                        <div class="mobileNumber">
                            Mobile Number <br> <input type="text" name="company_mobile">
                        </div>
                        <div class="emailId">
                            Email <br> <input type="email" name="company_email">
                        </div>
                    </div>
                </div>

                <div class="submit-btn">
                    <input type="submit" name="insert" value="Submit Request">
                </div>

            </form>
        </div>
        <br><br>
        <script language="Javascript">

            var n = 2;

            function increment(){

                n++;
                return n;
            }

            function add() {
                var divElement = document.createElement("div");
                var inp1 = document.createElement("input");
                var inp2 = document.createElement("input");
                var inp3 = document.createElement("input");
                var inp4 = document.createElement("input");
                var inp5 = document.createElement("input");

                divElement.className = "c-11";
                inp1.className = "inp-11";
                inp2.className = "inp-22";
                inp3.className = "inp-33";
                inp4.className = "inp-44";
                inp5.className = "inp-55";


                inp1.name = "sl[]";
                inp2.name = "productName[]";
                inp3.name = "productSpecification[]";
                inp4.name = "productQuantity[]";

                inp1.readonly = "readonly";
                var i = document.getElementsByClassName("inp-11").length;

                if (i>0) {
                    var kt = document.getElementById("1");
                    kt.style.visibility = "visible";
                }

                inp1.value =i+2;
                inp4.type = "number";
                inp4.value = "1";
                inp4.min ="1";
                inp5.type = "button";
                inp5.value = "X";

                inp5.id =n;
                var x =n;
                divElement.id ="m"+x;
                n++;


                divElement.appendChild(inp1);
                divElement.appendChild(inp2);
                divElement.appendChild(inp3);
                divElement.appendChild(inp4);
                divElement.appendChild(inp5);

                document.getElementById("main-quotation").appendChild(divElement);



                var k="m"+x;
                document.getElementById(x).onclick = function() {removeElement(k)};

            }

            function removeElement(k) {
                // Removes an element from the document
                var element = document.getElementById(k);
                element.parentNode.removeChild(element);

                var i = document.getElementsByClassName("inp-11").length;

                if (i==0) {
                    var kt = document.getElementById("1");
                    kt.style.visibility = "hidden";
                }

                serialNumber ()

            }
            function serialNumber (){
                var j = document.getElementsByClassName("inp-11").length;
                for (var i = 0; i < j; i++) {
                    document.getElementsByClassName("inp-11")[i].value = i+2;
                    /*
                    document.getElementsByClassName("inp-55")[i].id = i+2;
                    var temp =i+2;
                    document.getElementsByClassName("c-11")[i].id ="m"+temp;

                    */

                }

            }
            function serialNumber1 (){
                var j = document.getElementsByClassName("inp-11").length;
                document.getElementById("test").innerHTML = "Test Value is ="+j;
            /*  var arr;
                for (var i = 0; i < j; i++) {
                    arr[i] = document.getElementsByClassName("inp-11")[i].value;
                }
                //arr.sort();
*/
                var m = document.getElementsByClassName("inp-11")[j-1].value;
                document.getElementById("test1").innerHTML = "Test Value is ="+m;
            }


        </script>
@endsection