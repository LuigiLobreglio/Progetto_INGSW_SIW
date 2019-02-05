<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix="c" %>

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

    <title>Nel dettaglio</title>
    
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

	<style>
	.mySlides {display:none;}
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
    <div class="banner-bootom-w3-agileits">
		<div class="container">
			<!-- tittle heading -->
			<h3 class="tittle-w3l">Dettagli prodotto
				<span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
			</h3>
			<!-- //tittle heading -->
			<div class="col-md-5 single-right-left ">
				<div class="grid images_3_of_2">
					<div class="flexslider">
						
						<div class="clearfix"></div>
						<div class="flex-viewport" style="overflow: hidden; position: relative;">
						<ul class="slides" style="width: 1000%; transition-duration: 2s; transform: translate3d(-354px, 0px, 0px);">
						

							<li data-thumb="${pageContext.request.contextPath}/${prodotto.immagine}"  style="width: 354px; float: left; display: block;" class="flex-active-slide">
								<div class="thumb-image">
									<img src="../${prodotto.immagine}" data-imagezoom="true" class="img-responsive" alt="" draggable="false"> </div>
							</li>
				
							<li data-thumb="${prodotto.immagine}" class="" style="width: 354px; float: left; display: block;">
								<div class="thumb-image">
									<img src="../${prodotto.immagine}" data-imagezoom="true" class="img-responsive" alt="" draggable="false"> </div>
							</li>
			
						</ul>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-7 single-right-left simpleCart_shelfItem">
				<h3>${prodotto.nomeCommerciale}</h3>
		
				<p>
					<span class="item_price">€ ${prodotto.prezzo}</span>
				</p>
				
				<div class="product-single-w3l">
					<p>
						<i class="fa fa-hand-o-right" aria-hidden="true"></i>Categoria: 
						<label>${prodotto.categoria} </label> .</p>
					<ul>
						<li>
							${prodotto.descrizione}				
						</li>
					</ul>

				</div>
				<div class="occasion-cart">
					<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
						<form action="${pageContext.request.contextPath}/aggiungiAlCarrello" method="post">
							<fieldset>${idAccount}         ${prodotto.idProdotto}
								<input type="hidden" name="idAccountProprietario" value="${idAccount}">
								<input type="hidden" name="idProd" value="${prodotto.idProdotto}">
								<input type="hidden" name="immagine" value="${prodotto.immagine}">
								<input type="hidden" name="nomeCommerciale" value="${prodotto.nomeCommerciale}">
								<input type="hidden" name="prezzo" value="${prodotto.prezzo}">
								<input type="submit" name="submit" value="Aggiungi al carrello" class="button">
								
							</fieldset>
						</form>
					</div>

				</div>

			</div>
			<div class="clearfix"> </div>
		</div>
	</div>

</body>
</html>