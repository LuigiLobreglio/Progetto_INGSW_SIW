<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix="c" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


    <%
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    %>
    
<!DOCTYPE html>
<html lang="it">
<head>
 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Il tuo carrello!</title>
        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>   
    
    <script type="text/javascript" src='${pageContext.request.contextPath}/gestioneCarrello/gestioneCarrello.js'> </script>



    <!-- Bootstrap Core CSS -->
    
    
     <script src="${pageContext.request.contextPath}/css/js_style/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    
       
    
    <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles --> 
    <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <link type="text/css" href="${pageContext.request.contextPath}/css/stileCarrello.css" rel="stylesheet">
    
     
        
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



<script type="text/javascript">

$(document).ready(function(){
	
	recalculateCart();
});</script>
</head>

<body>

  <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
           
            <!-- Logo and responsive toggle -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-brand" >
                	<span class="glyphicon glyphicon-cutlery" ></span> <a class="titolo-logo" href="#"> BYMP</a>  <span class="glyphicon glyphicon-calendar"></span> 	
                </div>
            </div>
            
            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbar">
            <form class="navbar-form navbar-left" method="get" action="${pageContext.request.contextPath}/RicercaProdotto">
  				<div class="input-group">
    				<input id="spazio-ricerca" type="text" class="form-control" name="nomeCommerciale" placeholder="Cerca un prodotto!"  onkeyup="ricercaLive()" required>
    				<input id="spazio-ricerca" type="hidden" name="tipo"  value="byNome" >
    				<div class="input-group-btn">
      					<button id="btn-ricerca" class="btn btn-default" type="submit">
        					<i class="glyphicon glyphicon-search"></i>
      					</button>
    				</div>
  				</div>
  					
			<div id="proviamo" class="sfondo_suggerimenti"  >
					<div class="container_suggerimenti" style="display:none">
						<ul id="lista-suggerimenti">

						</ul>
					</div>
			</div>
			</form>
		
            
                <ul class="nav navbar-nav navbar-center">
                    <li class="active">
                        <a href="#">Pagina iniziale</a>
                    </li>
                    <li>
                        <a href="#">Prodotti</a>
                    </li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Servizi <span class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="about-us">
							<li><a href="#">Cerca prodotti</a></li>
							<li><a href="#">Pianifica la tua dieta!</a></li>
						</ul>
					</li>
					<li>
                        <a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Carrello</a>
                        
                    </li>
                </ul>
                
                 <ul class="nav navbar-nav navbar-right">   
                 	<c:if test="${nome == null}">
						<li><a href="gestioneAccount/iscrivimi.jsp"><span class="glyphicon glyphicon-pencil"></span> Iscriviti </a></li>
						<li><a href="gestioneAccount/faiAccesso.jsp"><span class="glyphicon glyphicon-log-in"></span> Accedi </a></li>
					</c:if>						
                 	<c:if test="${nome != null}">
      					<li><a href="#"><span class="glyphicon glyphicon-user"></span> Ciao, ${nome} !</a></li>
						<li><a href="${pageContext.request.contextPath}/controllaPermessi?logout=true"><span class="glyphicon glyphicon-log-out"></span> Esci </a></li>
					</c:if>	
    			</ul>	
            </div><!-- /.navbar-collapse -->
            
        </div><!-- /.container -->
    </nav>
    
    
<!-- vistaCarrello -->
<div class="shopping-cart">

<h1>Carrello della spesa</h1>


  <div class="column-labels">
    <label class="product-image">Image</label>
    <label class="product-details">Product</label>
    <label class="product-price">Price</label>
    <label class="product-quantity">Quantity</label>
    <label class="product-removal">Remove</label>
    <label class="product-line-price">Total</label>
  </div>


<c:if test="${fn:length(vociCarrello)==0}">
		    	
		   <h4>Nessun articolo nel carrello </h4>
</c:if>
				
<c:if test="${fn:length(vociCarrello)!=0}">
				
				<c:forEach items="${vociCarrello}" var="item">
				
					 <div class="product">
    					<div class="product-image">
      						<img src="${pageContext.request.contextPath}/${item.immagine}">
    					</div>
    <div class="product-details">
      <div class="product-title">${item.nomeCommerciale }</div>
    </div>
     <div class="product-id" style="display:none;" >${item.idProd}</div>
    
    <div class="product-price">${item.prezzo}</div>
    <div class="product-quantity">
      <input type="number" value="${item.quantita }" min="1" >
    </div>
    <div class="product-removal">
      <button class="remove-product">
           <div class="product-id" style="display:none;" >${item.idProd}</div>
      
        Rimuovi
      </button>
    </div>
    <div class="product-line-price" style="display: block;">${item.prezzo*item.quantita }</div>
				
			
  </div>
				
				
				
				</c:forEach>
</c:if>
				<!--  
 
  <div class="product">
    <div class="product-image">
      <img src="https://s.cdpn.io/3/large-NutroNaturalChoiceAdultLambMealandRiceDryDogFood.png">
    </div>
    <div class="product-details">
      <div class="product-title">Nutro™ Adult Lamb and R</div>
      <p class="product-description">Who doesn't like lamb and rice? We've all hit the halal cart at 3am while quasi-blackout after a night of binge drinking in Manhattan. Now it's your dog's turn!</p>
    </div>
    <div class="product-price">45.99</div>
    <div class="product-quantity">
      <input type="number" value="1" min="1">
    </div>
    <div class="product-removal">
      <button class="remove-product">
        Remove
      </button>
    </div>
    <div class="product-line-price">45.99</div>
  </div>
-->

  <div class="totals">
    <div class="totals-item">
      <label>Subtotale</label>
      <div class="totals-value" id="cart-subtotal" style="display: block;">51.96</div>
    </div>
    <div class="totals-item">
      <label>Tax (5%)</label>
      <div class="totals-value" id="cart-tax" style="display: block;">0.0</div>
    </div>
    <div class="totals-item">
      <label>Shipping</label>
      <div class="totals-value" id="cart-shipping" style="display: block;">0.00</div>
    </div>
    <div class="totals-item totals-item-total">
      <label>Totale</label>
      <div class="totals-value" id="cart-total" style="display: block;">69.56</div>
    </div>
  </div>
  
     <form method="post" action="../preparaOrdine">
		<div id="totale"></div>
		<input class="checkout" type="submit" value="Procedi all'ordine" class="button">   					 
	</form>

</div>
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script><script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>/* Set rates + misc */
var taxRate = 0.05;
var shippingRate = 15.00;
var fadeTime = 300;


/* Assign actions */


$('.product-quantity input').change(function () {
  updateQuantity(this);
});

$('.product-removal button').click(function () {
  removeItem(this);
});


/* Recalculate cart */
function recalculateCart()
{
  var subtotal = 0;

  /* Sum up row totals */
  $('.product').each(function () {
    subtotal += parseFloat($(this).children('.product-line-price').text());
  });

  /* Calculate totals */
  var tax = subtotal * taxRate;
  var shipping = subtotal > 0 ? shippingRate : 0;
  var total = subtotal + tax + shipping;
  $('#totale').html('<input type=\"hidden\" id=\"totale\" name=\"totaleOrdine\" value='+total+' >');
  /* Update totals display */
  $('.totals-value').fadeOut(fadeTime, function () {
    $('#cart-subtotal').html(subtotal.toFixed(2));
    $('#cart-tax').html(tax.toFixed(2));
    $('#cart-shipping').html(shipping.toFixed(2));
    $('#cart-total').html(total.toFixed(2));

    if (total == 0) {
      $('.checkout').fadeOut(fadeTime);
    } else {
      $('.checkout').fadeIn(fadeTime);
    }
    $('.totals-value').fadeIn(fadeTime);
  });
}


/* Update quantity */
function updateQuantity(quantityInput)
{
  /* Calculate line price */
  var productRow = $(quantityInput).parent().parent();
  var price = parseFloat(productRow.children('.product-price').text());
  var quantity = $(quantityInput).val();
  var linePrice = price * quantity;
  var idProd=productRow.children('.product-id').text();
  var tipo="update";
  alert(tipo);
  $.ajax({ type: "POST",
		 url: "../aggiornaCarrello",
		 data: {quantita : quantity, idProdotto : idProd, tipoAggiornamento: tipo},
		 success: function(data){ 
			  var d=JSON.parse(data);

			 		if(d.stato==true){
						alert("Carrello aggiornato");
			 			return true;
			 		}		 		
			 	},
	
	});
  /* Update line price display and recalc cart totals */
  productRow.children('.product-line-price').each(function () {
    $(this).fadeOut(fadeTime, function () {
      $(this).text(linePrice.toFixed(2));
      recalculateCart();
      $(this).fadeIn(fadeTime);
    });
  });
}


/* Remove item from cart */
function removeItem(removeButton)
{

	  var idProd=$(removeButton).children('.product-id').text();

	  var tipo="delete";
	  alert(idProd);
	  $.ajax({ type: "POST",
			 url: "../aggiornaCarrello",
			 data: {idProdotto : idProd, tipoAggiornamento: tipo},
			 success: function(data){ 
				  var d=JSON.parse(data);

				 		if(d.stato==true){
							alert("Carrello aggiornato");
				 			return true;
				 		}		 		
				 	},
		
		});
  /* Remove row from DOM and recalc cart total */
  var productRow = $(removeButton).parent().parent();
  productRow.slideUp(fadeTime, function () {
    productRow.remove();
    recalculateCart();
  });
}
//# sourceURL=pen.js
</script>



<!-- Footer -->
	<footer>
	
		<h1 class="text-center">Find Us</h1>
		<!-- Map -->
		<div class="footer-map"></div>	
			
			<div class="container">
				<div class="row">
					<div class="col-sm-12 footer-info-item text-center">
						<p class="lead">
							31 Spooner Street, Quahog, Rhode Island
						</p>
						<h2>Contattaci</h2>
						<p class="lead"><span class="glyphicon glyphicon-phone-alt"></span> +39 333 33333333<br>
						luigi.lobreglio@gmail.com <br> dux920@gmail.com </p>
						
					</div>
				</div>
			</div>

		<!-- Footer Links -->
		<div class="footer-info">
			<div class="container">
				<div class="row">
					<div class="col-sm-4 footer-info-item">
						<h3>Informazioni</h3>
						<ul class="list-unstyled">
							<li><a href="#">Chi siamo</a></li>
							<li><a href="#">Servizio clienti</a></li>
							<li><a href="#">Informativa Privacy</a></li>
						</ul>
					</div>
					<div class="col-sm-4 footer-info-item">
						<h3>Il Mio Account</h3>
						<ul class="list-unstyled">
							<li><a href="#">Accedi</a></li>
							<li><a href="#">La mia pianificazione alimentare</a></li>
							<li><a href="#">Il mio carrello</a></li>
							<li><a href="#">I miei ordini</a></li>
						</ul>	
					</div>
					<div class="col-sm-4 footer-info-item">
						<h3><span class="glyphicon glyphicon-list-alt"></span> Newsletter</h3>
						<p>Iscriviti per ricevere offerte esclusive</p>
						<div class="input-group">
							<input type="email" class="form-control" placeholder="Inserisci il tuo indirizzo email">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="button">
									Sottoscrivi!
								</button>
							</span>
						</div>
					</div>
				</div><!-- /.row -->
			</div><!-- /.container -->
        </div>
        
        <!-- Copyright etc -->
        <div class="small-print">
        	<div class="container">
        		<p><a href="#">Termini &amp; Condizioni</a> | <a href="#">Informativa Privacy</a> | <a href="#">Contatti</a></p>
        		<p>Copyright &copy; bymp.it 2019 </p>
        	</div>
        </div>
        
	</footer>
	
	
</body>
</html>