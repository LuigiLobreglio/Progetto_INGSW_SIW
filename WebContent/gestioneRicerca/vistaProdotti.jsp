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

    <title>Scegli i tuoi prodotti!</title>
    
    <script type="text/javascript" src='${pageContext.request.contextPath}/gestioneRicerca/gestione_Ricerca.js'> </script>
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
    				<input id="spazio-ricerca" type="text" class="form-control" name="nomeCommerciale" placeholder="Cerca un prodotto!"  onkeyup="ricercaLive()" required >
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
        
      <div class="container">
        
		<div class="side-bar col-md-3" style="margin-block-start: 100px;position: relative;">

			<form method="get" action="${pageContext.request.contextPath}/RicercaProdotto">
			    				<input id="spazio-ricerca" type="hidden" name="tipo"  value="avanzata" >
			
   				<div class="input-group-btn">
      					<button id="btn-ricerca" class="btn btn-default" type="submit">Ricerca avanzata
        					<i class="glyphicon glyphicon-search"></i>
      					</button>
    			</div>
    					
				<div class="search-hotel">
					<h3 class="agileits-sear-head">Codice</h3>
						<div>
							<input class="form-control" type="search" placeholder="Codice identificativo..." name="idProdotto" >
						</div>				
				</div>
				
				<div class="search-hotel">
					<h3 class="agileits-sear-head">Nome commerciale</h3>
						<div>
							<input  class="form-control"  type="search" placeholder="Nome del prodotto" name="nomeCommerciale" >
						</div>
				</div>
				
				<div class="left-side">
					<h3 class="agileits-sear-head">Categoria</h3>
				
					<select class="form-control" name="categoria">
						<option>---</option>
						<option value="Cereali_e_Derivati">Cereali e derivati</option>
						<option value="Carne">Carne</option>
						<option value="Pesce">Pesce</option>
						<option value="LattieroCaserai">Latte e latticini</option>
						<option value="Uova">Uova</option>
						<option value="Ortaggi">Ortaggi</option>
						<option value="Legumi">Legumi</option>
						<option value="Frutta">Frutta</option>
						<option value=OliiGrassiCondimento>Olii e grassi da condimento</option>
						<option value="Bevande">Bevande</option>
						<option value="Altro">Altro</option>
					</select>
				</div>
				
		

				<!-- price range -->
				<div class="range">
					<h3 class="agileits-sear-head">Prezzo</h3>
					<p>
						<label for="prezzoMin">Da:</label>
						<input class="form-control" type="text" name="prezzoMin" >
						<label for="prezzoMax">A:</label>
						<input  class="form-control" type="text" name="prezzoMax" >
					</p>
				</div>
				
			</form>
				<!-- //price range -->
			
				</div>

	<div class="agileinfo-ads-display col-md-9 w3l-rightpro">
				<div class="wrapper">
				<div class="product-sec1">
		
		    	<c:if test="${inizio == null}">
		    	
		    		<h4></h4>
		    		
		    	</c:if>		    	
		    	
		    	<c:if test="${fn:length(prodotti) == 0 && inizio==false}">
		    	
		    		<h4>Nessun risultato trovato</h4>
		    		
		    	</c:if>
				
			   	<c:if test="${prodotti != null && inizio==false}">
				
				<c:forEach items="${prodotti}" var="prod">
				
				
				
				
					<div class="col-sm-4">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img src="${pageContext.request.contextPath}/${prod.immagine}" alt="">

								</div>
								<div class="item-info-product ">
									<h4>
										<a href="single.html">${prod.nomeCommerciale}</a>
									</h4>
									<div class="info-product-price">
										<span class="item_price">${prod.prezzo} €</span>
									</div>
									<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
										<form action="${pageContext.request.contextPath}/visualizzaProdotto" method="post">
											<fieldset>
												<input type="hidden" name="idProdotto" value="${prod.idProdotto}">
												<input type="submit" name="submit" value="Dettagli" class="button">
											</fieldset>
										</form>
									</div>

								</div>
							</div>
						</div>
	</c:forEach>
			    	</c:if>
	
			
					</div>
					

				</div>
			</div>
	
		</div>        
	
	
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