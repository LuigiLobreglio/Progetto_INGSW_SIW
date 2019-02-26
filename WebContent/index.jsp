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

    <title>Benvenuto in BYMP</title>
    
    <script type="text/javascript" src='${pageContext.request.contextPath}/js/carousel.js'> </script>
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
            </div><!-- /.navbar-collapse -->
            
        </div><!-- /.container -->
    </nav>

	<!-- Feature -->
	<div class="jumbotron feature">
		<div class="container">
	       	<h1><span class="glyphicon glyphicon-cutlery"> </span> BUY YOUR MEAL PLAN</h1>
			<p>Devi uscire per fare la spesa, e vorresti farne a meno? <br></p>
			<p>Finisci sempre per mangiare gli stessi cibi, senza conoscere le loro proprietà ?</p>
			<p>Vorresti pianificare la tua dieta, avere un carrello pronto con solo il necessario, <br>
			e ricevere tutto comodamente dove vuoi? Allora sei nel posto giusto!
			</p>
		</div>
	</div>


    <!-- Heading -->
    <div class="container-fluid">
   		<div class="w3-content" >
  			

  			<img class="mySlides w3-animate-right" src="images/home_slide_makemenu.jpeg" style="  display: block; margin-left: auto; margin-right: auto; height:100%;">
  			<img class="mySlides w3-animate-right" src="images/home_slide_getInCart.jpeg" style="display: block; margin-left: auto; margin-right: auto;height:100%;">
   			<img class="mySlides w3-animate-right" src="images/home_slide_takeAway.jpeg" style="display: block; margin-left: auto; margin-right: auto; height:100%;">
  			<p class="centered w3-animate-bottom">Pianifica il tuo menù!</p>
            <p class="centered w3-animate-bottom">Metti tutto nel carrello!</p>
            <p class="centered w3-animate-bottom">Ricevi la spesa dove vuoi!</p>
  			
  		
		</div>
    
        <script type="text/javascript" src='js/carousel.js'> </script>
      
   		<script>
    		sliding();
    	</script>
    </div>
      
      
<div
  class="fb-like"
  data-share="true"
  data-width="450"
  data-show-faces="true">
</div>

    <!-- Promos -->
	<div class="container-fluid">
        
        <div class="row promo">
        	<a href="#"> 
        		<div class="col-md-6 promo-item item-1"> 
					<h3>
						Pianifica la tua dieta!
					</h3>
				</div>
            </a>
            
            <a href="${pageContext.request.contextPath}/RicercaProdotto">
           		 <div class="col-md-6 promo-item item-2" >
					<h3>
						Cerca prodotti!
					</h3>
				</div>	
            </a>
		
        </div>
    
    </div><!-- /.container-fluid -->


	
		
	<!-- Footer -->
	<footer>
	
		<h1 class="text-center">La nostra sede</h1>
		<!-- Map -->
		<div class="footer-map"></div>	
			
			<div class="container">
				<div class="row">
					<div class="col-sm-12 footer-info-item text-center">
						<p class="lead">
							Ponte Pietro Bucci, 87036 Quattromiglia CS						</p>
						<h2>Contattaci</h2>
						<p class="lead"><span class="glyphicon glyphicon-phone-alt"></span> +39 333 33333333<br>
						lbrlgu95r09g786e@studenti.unical.it</p>
						
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
									
                 	<c:if test="${nome != null}">
					<div class="col-sm-4 footer-info-item">
						<h3 ><a style="color:black" href="#">Il Mio Account</a></h3>
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
