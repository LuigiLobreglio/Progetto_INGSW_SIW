<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" 
   prefix="c" %>
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
      <title>Benvenuto in BYMP</title>
      <script type="text/javascript" src='${pageContext.request.contextPath}/js/carousel.js'></script>
      <script type="text/javascript" src='${pageContext.request.contextPath}/gestioneRicerca/gestione_Ricerca.js'></script>
      <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
      <!-- Bootstrap Core CSS -->
      <script src="${pageContext.request.contextPath}/css/js_style/bootstrap.min.js"></script>
      <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
      <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles -->
      <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <style>
         @media only screen and (max-width: 768px) {   
         /**TIP: Easy escape for touch screens,
         give gallery's parent container a cursor: pointer.**/
         div.featured-products {cursor: pointer}
         }                
      </style>
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
               <div class="navbar-brand">
                  <span class="glyphicon glyphicon-cutlery"></span> <a class="titolo-logo" href="../index.jsp"> BYMP</a> <span class="glyphicon glyphicon-calendar"></span>
               </div>
            </div>
            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbar">
               <form class="navbar-form navbar-left" method="get" action="${pageContext.request.contextPath}/RicercaProdotto">
                  <div class="input-group">
                     <input id="spazio-ricerca" type="text" class="form-control" name="nomeCommerciale" placeholder="Cerca un prodotto!" onkeyup="ricercaLive()" required>
                     <input id="spazio-ricerca" type="hidden" name="tipo" value="byNome">
                     <div class="input-group-btn">
                        <button id="btn-ricerca" class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-search"></i>
                        </button>
                     </div>
                  </div>
                  <div id="proviamo" class="sfondo_suggerimenti">
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
                     <a href="${pageContext.request.contextPath}/gestioneCarrello/vistaCarrello.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Carrello</a>
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
            </div>
            <!-- /.navbar-collapse -->
         </div>
         <!-- /.container -->
      </nav>
     
      <!-- Contenitore del prodotto visto in dettaglio -->
      <div class="container">
         <h1 style="text-align:center; margin-block-start:150px">Dettagli prodotto</h1>
         <hr style="    border-top: 1px solid  #dd845a;">
         <br>
         
         <!-- Immagine del prodotto -->
         <div class="col-md-4  featured-product">
            <img style="width: 100%; 
               height: auto; 
               max-width: 450px; 
               display: table; 
               margin: 0 auto;" 
               class="thumbnail zoom" 
               src="../${prodotto.immagine}"
               >
         </div>
         
         <!-- Informazioni generali sul prodotto -->
         <div class="col-md-8 single-right-left simpleCart_shelfItem">
            <p>
               <i class="fa fa-hand-o-right" aria-hidden="true"></i>In categoria: 
               <label>${prodotto.categoria} </label> .
            </p>
            <h3 style="white-space:normal; height:115px; overflow: hidden; text-overflow: ellipsis">${prodotto.nomeCommerciale}</h3>
            <p style="color:black">
               Prezzo: 
               <fmt:formatNumber type="number" pattern="0.00" value="${prodotto.prezzo}" />
               €
            </p>
                                 
            <!--  Elementi per le opzioni sul prodotto -->
            <input id="dettagliProdottoBottone" class="btn btn-primary btn-block" type="button"  value="Dettagli">
            <div>
               <form action="${pageContext.request.contextPath}/aggiungiAlCarrello" method="post">
                  <input type="hidden" name="idAccountProprietario" value="${idAccount}">
                  <input type="hidden" name="idProd" value="${prodotto.idProdotto}">
                  <input type="hidden" name="immagine" value="${prodotto.immagine}">
                  <input type="hidden" name="nomeCommerciale" value="${prodotto.nomeCommerciale}">
                  <input type="hidden" name="prezzo" value="${prodotto.prezzo}">
                  <button id="aggiungiProdottoDaListaBottone" class="btn btn-primary btn-block" type="submit" onclick="test()">								
                  <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 
                  Aggiungi al carrello
                  </button>
               </form>
            </div>
            
         </div>
         
         <div style="height:400px"></div>
         
         <!--  Informazioni dettagliate sul prodotto -->         
         <div class="col-xs-12"id="dettagliProdottoBottone">
            <h4> Dettagli:</h4>
            <dl class="row">
               <dt class="col-md-3">Codice EAN/UPC</dt>
               <dd class="col-md-9">
                  <p>${prodotto.idProdotto}</p>
               </dd>
               <dt class="col-md-3">Nome</dt>
               <dd class="col-md-9">
                  <p>${prodotto.nomeCommerciale}</p>
               </dd>
               <dt class="col-md-3">Categoria</dt>
               <dd class="col-md-9">
                  <p>${prodotto.categoria}</p>
               </dd>
               <dt class="col-md-3">Descrizione</dt>
               <dd class="col-md-9">
                  <p>${prodotto.descrizione}</p>
               </dd>
               <dt class="col-md-3">Prezzo</dt>
               <dd class="col-md-9">
                  <p>
                     <fmt:formatNumber type="number" pattern="0.00" value="${prodotto.prezzo}" />
                     €
                  </p>
               </dd>
            </dl>
         </div>
         
      </div>
      
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
      
      <!-- Javascript per animazione -->
      <script>
         $('#dettagliProdottoBottone').on('click',function(event) {
             // Stop the browser from submitting the form.
         
                $('html, body').animate({
             		  scrollTop: $("div#dettagliProdottoBottone").offset().top-200
                }, 2000);
         
         
         
         });
      </script>
      
   </body>
</html>