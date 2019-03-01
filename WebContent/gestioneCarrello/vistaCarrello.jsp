<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" 
   prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
      <script type="text/javascript" src='${pageContext.request.contextPath}/gestioneRicerca/gestione_Ricerca.js'></script>
      
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
         });
      </script>
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
                  <span class="glyphicon glyphicon-cutlery" ></span> <a class="titolo-logo" href="../index.jsp"> BYMP</a>  <span class="glyphicon glyphicon-calendar"></span> 	
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
                     <a href="../index.jsp">Pagina iniziale</a>
                  </li>
                  <li>
                     <a href="#">Prodotti</a>
                  </li>
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Servizi <span class="caret"></span></a>
                     <ul class="dropdown-menu" aria-labelledby="about-us">
                        <li><a href="${pageContext.request.contextPath}/RicercaProdotto">Cerca prodotti</a></li>
                        <li><a href="#">Pianifica la tua dieta!</a></li>
                     </ul>
                  </li>
                  <li>
                     <a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Carrello</a>
                  </li>
               </ul>
               <ul class="nav navbar-nav navbar-right">
                  <c:if test="${nome == null}">
                     <li><a href="${pageContext.request.contextPath}/gestioneAccount/iscrivimi.jsp"><span class="glyphicon glyphicon-pencil"></span> Iscriviti </a></li>
                     <li><a href="${pageContext.request.contextPath}/gestioneAccount/faiAccesso.jsp"><span class="glyphicon glyphicon-log-in"></span> Accedi </a></li>
                  </c:if>
                  <c:if test="${nome != null}">
                     <li><a href="#"><span class="glyphicon glyphicon-user"></span> Ciao, ${nome} !</a></li>
                     <li><a href="${pageContext.request.contextPath}/controllaPermessi?logout=true"><span class="glyphicon glyphicon-log-out"></span> Esci </a></li>
                  </c:if>
               </ul>
            </div>
            <!-- /.navbar-collapse -->
         </div>
         <!-- /.container -->
      </nav>
      <!-- vistaCarrello -->
      <div style="margin-block-start:150px;"class="shopping-cart">
         <h1 style="text-align:center;">Il tuo carrello della spesa</h1>
         <hr style="    border-top: 3px solid  #dd845a;">
         <div class="column-labels">
            <label class="col-xs-3 product-image">Image</label>
            <label class="col-xs-3 product-details">Product</label>
            <label class="col-xs-1 product-price">Prezzo</label>
            <label class="col-xs-2 product-quantity">Quantita</label>
            <label class="col-xs-2 product-line-price">Totale</label>
            <label class="col-xs-1 product-removal">Remove</label>
         </div>
         <c:if test="${fn:length(vociCarrello)==0}">
            <h4>Nessun articolo nel carrello </h4>
         </c:if>
         <c:if test="${fn:length(vociCarrello)!=0}">
            <c:forEach items="${vociCarrello}" var="item">
               <div class="product">
                  <div class="col-sm-3 col-xs-12 product-image">
                     <img src="${pageContext.request.contextPath}/${item.immagine}">
                  </div>
                  <div class="col-sm-3 col-xs-12 product-details">
                     <div class="product-title">${item.nomeCommerciale }</div>
                  </div>
                  <div class="product-id" style="display:none;" >${item.idProd}</div>
                  <div class="col-sm-1 col-xs-4 product-price">
                  € <fmt:formatNumber type="number" pattern="0.00" value="${item.prezzo}"/>
                  </div>
                  <div class="col-sm-2 col-xs-3 product-quantity">
                     <input type="number" value="${item.quantita }" min="1" >
                  </div>

                  <div class="col-sm-2 col-xs-5 product-line-price" style="display: block;">
                  € <fmt:formatNumber type="number" pattern="0.00" value="${item.prezzo*item.quantita}"/>
                  </div>
                  <div class="col-sm-1 col-xs-12 product-removal">
                     <button class="remove-product">
                        <div class="product-id" style="display:none;" >${item.idProd}</div>
                        Rimuovi
                     </button>
                  </div>
               </div>
            </c:forEach>
         </c:if>
         <div class="totals">
            <div class="totals-item">
               <label>Subtotale</label>
               <div class="totals-value" id="cart-subtotal" style="display: block;"></div>
            </div>
            <div class="totals-item">
               <label>Imposte (5%)</label>
               <div class="totals-value" id="cart-tax" style="display: block;"></div>
            </div>
            <div class="totals-item totals-item-total">
               <label>Totale</label>
               <div class="totals-value" id="cart-total" style="display: block;"></div>
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
        	 
             subtotal += parseFloat($(this).children('.product-line-price').text().replace(/€\s+|\s|\r?\n|\r/g, ""));
            
           });
         
           /* Calculate totals */
           var tax = subtotal * taxRate;
           var total = subtotal + tax;
           $('#totale').html('<input type=\"hidden\" id=\"totale\" name=\"totaleOrdine\" value='+total+' >');
           /* Update totals display */
           $('.totals-value').fadeOut(fadeTime, function () {
        	 
             $('#cart-subtotal').text('€ '+subtotal.toFixed(2));
             $('#cart-tax').html('€ '+tax.toFixed(2));
             $('#cart-total').html('€ '+total.toFixed(2));
         
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
           var price = parseFloat(productRow.children('.product-price').text().replace(/€\s+|\s|\r?\n|\r/g, ""));
           var quantity = $(quantityInput).val();
           var linePrice = price * quantity;
           var idProd=productRow.children('.product-id').text();
           var tipo="update";
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
               $(this).text('€ '+linePrice.toFixed(2));
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
      
      <br><br><br>
      <!-- Footer -->
      <footer>
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
                  <c:if test="${nome != null}">
                     <div class="col-sm-4 footer-info-item">
                        <h3><a style="color:black" href="#">Il Mio Account</a></h3>
                        <ul class="list-unstyled">
                           <li><a href="#">La mia pianificazione alimentare</a></li>
                           <li><a href="${pageContext.request.contextPath}/gestioneCarrello/vistaCarrello.jsp">Il mio carrello</a></li>
                           <li><a href="#">I miei ordini</a></li>
                        </ul>
                     </div>
                  </c:if>
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
               </div>
               <!-- /.row -->
            </div>
            <!-- /.container -->
         </div>
         <!-- Copyright etc -->
         <div class="small-print">
            <div class="container">
               <p><a href="#">Termini &amp; Condizioni</a> | <a href="#">Informativa Privacy</a></p>
               <p>Copyright &copy; bymp.it 2019 </p>
            </div>
         </div>
      </footer>
   </body>
</html>