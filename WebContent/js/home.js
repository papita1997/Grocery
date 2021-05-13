/**
 * Home page javascript
 */

function homeload(){
	
}

function shop(value){
	var data = {data:value.getAttribute("data-value")};
	
	$.post("ShopControllerServlet",data,function(response){
		window.location.href = response;
	});
}

function addCart(value){
	var qty = $("#qty").children("option:selected").val();
	
	var unit = $("#unit").children("option:selected").val();
	
	if(qty===undefined && unit===undefined){
		qty = 1;
		unit = 1;
	} 
	
	var data={data:value.getAttribute("data-value")};
	
	$.post("AddCartServlet",data,function(response){
		response = response.trim();
		
		if(response==="false"){
				
			swal("Item Already Added!",{
		button:false,
		timer:1000
		});
	
		}else {
			response = response.split(":");
			if(response[1]==="true"){
			swal("Item Added!",{
			button:false,
			timer:1000
			});
			$("#basketcounts").append(response);
			} else {
				alert("Login First..!!!");
			}
			
		}		
	});
	
}

$("#qty").on('change',function(){
    var qty=$(this).children("option:selected").val();
    $("#weight").html("");
    $("#weight").html(qty);
    $("#price").html("");
    var price = document.getElementById("price").getAttribute("data-value");
    $("#price").append("Rs "+qty*price);
    $("#qty1").prop("disabled",true);
});

$("#unit").on('change',function(){
    var unit=$(this).children("option:selected").val();
    $("#unit-text").html("");
    $("#unit-text").html(unit);
    $("#unit1").attr("disabled","disabled");
});


function deleteCartProduct(value){
	var data={data:value.getAttribute("data-value")};
	$.post("DeleteCartServlet",data,function(response){
		response = response.trim();
			swal(response,{
		button:false,
		timer:1000
		});
		window.location.reload(true);
	});
}



function suggestion(){
	var s = document.getElementById("search").value;
          var key = event.keyCode || event.keyCode;
			 //alert(key);
   		  if(key===8||key===46){
			if(s.length===0){
            var div = document.getElementById("myDropdown");
               while(div.hasChildNodes()){
                   div.removeChild(div.firstChild);
			    }	
			}
		 else{
				filterFunction();
			}
				
       }
         else{
		if(s.length===1){
		$.post("SearchBarServlet",{data:s},function(response){
		response = response.trim();
		response = response.split(":");					
		var pid = response[0].split(",");	
		var pname = response[1].split(",");
		for(let i=0;i<pid.length-1;i++){					
			var anchar = document.createElement("a");
			anchar.setAttribute("href","javascript:void(0)");
			anchar.setAttribute("data-value",pid[i]);
			anchar.setAttribute("onclick","shop(this)");
			 anchar.innerHTML=pname[i];
			document.getElementById("myDropdown").append(anchar);
		}
		
		});
		
		}else{
			filterFunction();
		}
             
      }
	
 }

function filterFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("search");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDropdown");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {		
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}
