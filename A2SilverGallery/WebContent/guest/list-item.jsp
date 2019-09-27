<!DOCTYPE html><%@page import="model.AdminProduct"%>
<%@page import="java.util.List"%>
<%@page import="service.AdminServiceImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="service.IAdminService"%>
<html class=''>
<head>

  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">   
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<link rel="stylesheet" href="../css/list-item.css">

<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>




  <meta charset="utf-8">
  <title>My Shopping Cart</title>
</head>

<body id="page-top">

  <jsp:include page="guestHeader.jsp"></jsp:include>
	
	<div id = "wrapper">
	<jsp:include page="guestSidebar.jsp"></jsp:include>

    <div id="content-wrapper">

      <div class="container-fluid">


  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">
          My Shopping Cart
        </a>
      </div>
    </div>
  </nav>
   <%
	IAdminService iadmin= new AdminServiceImpl();
    List<AdminProduct> list = iadmin.readData();
 
	Iterator<AdminProduct> iter = list.iterator();

					
%>
  
  
  <div class="container">
    <div class="row">
      <div class="list-class">
        <h1>Products</h1> 
        <%
        while(iter.hasNext()){
				AdminProduct ap = new AdminProduct();
				ap = iter.next();
				%>
        <div class="row">
          <div class="col col-xs-12 col-md-6 col-lg-4 item">
            <div class='img-container'>
              <img src="data:image/png;base64,<%=ap.getImageData()%>" width="240" height="240" >
            </div>
            <h2><%= ap.getProductName() %></h2>
            <p><%= ap.getQuantity() %> available</p>
            <p><%= ap.getPrice() %></p>
          </div>         
        </div>
        <% 
        
			}

			%>
      </div>
      
      <div class="col col-sm-3 col-xs-6">
      <div id = 'cart-container' data-spy="affix" data-offset-top="10">
        <h1>Shopping Cart <span class="badge" id='cartItems'></span></h1>
        <div class="cart" id = 'cart'>
        So lonely here, add something
        </div>
	        <div id = 'prices'></div>
	  </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">Complete order</h4>
      </div>
      <div class="modal-body">
        <div class = 'row'>
        	<div class = 'col-xs-12' id = 'cartContentsModal'> </div>
        </div>
        <div class = 'row'>
        	<div class = 'col-xs-12' id = 'cartForm'> 
        	<!-- FORM -->
        		<form  method = "POST" action= "../AddSalesServlet" class = "form-group" >
        			<div class="form-group">
        				<label for="formName">Name</label>
    					<input type="text" class="form-control" id="formName" name="formName" placeholder="Your name" required>
        			</div>
        			
        			<div class="form-group">
        				<label for="Date">Date</label>
    					<input type="text" class="form-control" id="Date" name="Date" placeholder="yyyy-mm-dd" required>	
    				</div>

        			<div class="form-group">
        				<label for="staffID">StaffID</label>
    					<input type="text" class="form-control" id="staffID" name="staffID" placeholder="Staff ID" required>	
    				</div>
    				
    				<div class="form-group">
        				<label for="formName">subTotal</label>
    					<input type="text" class="form-control" id="subTotal" name="subTotal" placeholder="Sub Total" required>
    				</div>
    				
        			<div class="form-group">
        				<label for="formName">Discount</label>
    					<input type="text" class="form-control" id="discount" name="discount" placeholder="Discount" required>
        			</div>
        			
        			<div class="form-group">
        				<label for="formName">totalPrice</label>
    					<input type="text" class="form-control" id="totalPrice" name="totalPrice" placeholder="Total Price" required>
        			</div>
        			
    					
    					
    					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      					<button type="submit" class="btn btn-primary" id='submit'>Complete order</button>
      					
        			</div>
        			
        		</form>

        	</div>
        </div>
      </div>
    
    </div>
  </div>
</div>
</div>
</div>
</div>

          <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
 
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
  
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">  
 
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script type="text/javascript" >var itemsInCart = 0;
var subTotal = 0;
const discount = 0.1;	// 10%
var totalPrice = 0;


window.onload = function() {
  $('img').addClass('img-responsive');
  
	$('.img-container').append('<button class="btn btn-success btn-add-cart"><span class="glyphicon glyphicon-shopping-cart"></span> to cart</button>');

$('.btn-add-cart').click( (e) => { 
		//animation
		$(e.target).animateCss('pulse');
		// find out which item is clicked
		// if 'span' with cart symbol is clicked, then navigate one level up to the button
		let eventTarget;
		if ($(e.target).is('span')) eventTarget = $(e.target).parent();
			else eventTarget = $(e.target);
		let itemName = eventTarget.parent().parent().find('h2')[0].textContent ;
		let itemPrice = eventTarget.parent().parent().find('p')[1].textContent ;
		addToCart(itemName, itemPrice);
	});

	$('#submit').click( () => {
		formSubmitted();
	});

	setRandomPrices();//new
	
}
//new
function setRandomPrices() {
	// just for fun
	let items = document.querySelectorAll('.item');
	for (let item of items) {if (window.CP.shouldStopExecution(1)){break;}
		$(item).find('p')[1].textContent = 'R ' + (Math.floor(Math.random() * (8000 - 0)) + 0) + '.' + (Math.floor(Math.random() * (99 - 10)) + 10);
	}
window.CP.exitedLoop(1);

}


function addToCart(name, price) {
	let priceNumber = parseFloat(price.slice(1));
	if (itemsInCart === 0) $('#cart').text(" ");
	let newDiv = $('<div class="cart-item"></div>');
	newDiv.text(name + ' ... ' + price + ' ');
	newDiv.append('<button class="btn btn-danger btn-xs" onclick="deleteItem(this)">X</button>');
	newDiv.append('<hr>');
	newDiv.attr('name', name);
	newDiv.attr('price', priceNumber);
	$('#cart').append(newDiv);
	newDiv.animateCss('bounceInRight');
	itemsInCart++;
	$('#cartItems').text(itemsInCart);
	subTotal += priceNumber;
	updatePrice();
}

function deleteItem(e) {
	let price = $(e.parentElement).attr('price');
	subTotal -= price;
	$(e.parentElement).animateCss('bounceOutRight');
	$(e.parentElement).remove();
	itemsInCart--;
	$('#cartItems').text(itemsInCart);
	updatePrice();
	cartLonelyText();
}

function cartLonelyText() {
	if (itemsInCart === 0) 
		$('#cart').append('So lonely here, add something');
}

function updatePrice() {
	$('#prices').empty();
	if (itemsInCart === 0) return;
	let newDiv = $('<div></div>');
	newDiv.append('<strong>Subtotal: Rs.' + subTotal.toFixed(2) + '<br>');
	newDiv.append('<strong>Discount: ' + discount * 100 + '%<br>');
	newDiv.append('<strong>Total Price: Rs.' + (subTotal - (subTotal * discount)).toFixed(2) + '</strong>');

	newDiv.append('<button class="btn btn-info btn-block" onclick="openModal()">Continue</button>');

	$('#prices').append(newDiv);
	newDiv.animateCss('bounceInRight');
}


function cartToString() {
	let itemsString = "<small><p><strong>Your order:</strong><br>";
	let cartItems = document.querySelectorAll('.cart-item');
	for (let item of cartItems) {if (window.CP.shouldStopExecution(2)){break;}
		itemsString = itemsString + item.getAttribute('name') + " .. Rs." + item.getAttribute('price') + "<br>";
		}
window.CP.exitedLoop(2);
;
	itemsString += '</p><p>Subtotal: Rs.' + subTotal.toFixed(2) + '<br>';
	itemsString += 'Discount: ' + discount * 100 + '%<br>'
	itemsString += 'Total price with discount: <mark><strong>Rs.' + (subTotal - (subTotal * discount)).toFixed(2) + '</strong></mark></p></small>';
	return itemsString;
}

function openModal() {
	$('#cartContentsModal').html(cartToString());
	$('#myModal').modal('show');
}


function formSubmitted() {
	if (!checkEmptyFields()) {		// if the fields arent empty
		sweetAlert("Confirmed!", "Order details are added to the Sales Report", "success");
	} else { return; }
	// clear cart and do other cleaning if order is OK
	$('#myModal').modal('hide');
	totalPrice = 0; subTotal = 0; itemsInCart = 0;
	$('#cart').empty();
	$('#prices').empty();
	$('#cartItems').text(itemsInCart);
	cartLonelyText();
	
	
	
}

function checkEmptyFields() {
	let somethingEmpty = false;
  
	if ( !$.trim( $('#formName').val() ).length) { 
		$('#formName').animateCss('animated jello');
		somethingEmpty = true;
	}

	if ( !$.trim( $('#staffID').val() ).length) { 
		$('#staffID').animateCss('animated jello');
		somethingEmpty = true;
	}

	return somethingEmpty;
}

$.fn.extend({
//		https://github.com/daneden/animate.css
    animateCss: function (animationName) {
        var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        this.addClass('animated ' + animationName).one(animationEnd, function() {
            $(this).removeClass('animated ' + animationName);
        });
        return this;
    }
});
//# sourceURL=pen.js
</script>
</body>
</html>