<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix="c" %>

   <%
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    String nome = (String) session.getAttribute("nome");

    if (null != nome) {
        RequestDispatcher rd = request.getRequestDispatcher("/gestioneAccount/accessoConsentito.jsp");
        rd.forward(request, response);
     }
    %>
    
<!DOCTYPE html>
<html lang="it">
<head>
 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Iscriviti</title>
    
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/gestioneRicerca/gestione_Ricerca.js'> </script>
       

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/css/js_style/bootstrap.min.js"></script>
    
    <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles --> 
    <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
         
        
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<script src="${pageContext.request.contextPath}/gestioneAccount/gestione_Account.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#emailID").change(function(){
		chiediDisponibilitaEmail();
	}); 
});

$(document).ready(function() {
	$("#pass1, #pass2").keyup(function(){
		confrontaPasswords();
	});
});

$(document).ready(function() {
	$("#pass1, #pass2").change(function(){

		
		if(confrontaPasswords()==false){
			
			$("#pass2").val("");
		}	
		
	});
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
            
            <!-- Navbar links  -->
            <div class="collapse navbar-collapse" id="navbar">
            <form class="navbar-form navbar-left" method="get" action="${pageContext.request.contextPath}/RicercaProdotto?tipo=byNome">
  				<div class="input-group">
    				<input id="spazio-ricerca" type="text" class="form-control" name="nomeCommerciale" placeholder="Cerca un prodotto!"  onkeyup="ricercaLive()" >
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
						<li><a href="${pageContext.request.contextPath}/gestioneAccount/iscrivimi.jsp"><span class="glyphicon glyphicon-pencil"></span> Iscriviti </a></li>
						<li><a href="${pageContext.request.contextPath}/gestioneAccount/faiAccesso.jsp"><span class="glyphicon glyphicon-log-in"></span> Accedi </a></li>
					</c:if>						
                 	<c:if test="${nome != null}">
      					<li><a href="#"><span class="glyphicon glyphicon-user"></span> Ciao, ${nome} !</a></li>
						<li><a href="controllaPermessi?logout=true"><span class="glyphicon glyphicon-log-out"></span> Esci </a></li>
					</c:if>	
    			</ul>	
            </div><!-- /.navbar-collapse -->
            
        </div><!-- /.container -->
    </nav>
    
    <div style="margin-top: 100px; margin-left: 100px">
	<h2>Ciao, benvenuto nella pagina di iscrizione</h2>
	<p>Compila il modulo sottostante, e avrai accesso ai nostri servizi!</p>    
	</div>
    
    
    <div class=container>
    <form id="moduloRegistrazione" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/iscriviCliente">
	<div class="form-group">
		<label class="control-label col-sm-2" for="nome">Nome</label>
			<div class="col-sm-5">
				<input class="form-control" name="nome" type="text" required />
			</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="nome">Cognome</label>
			<div class="col-sm-5">
				<input class="form-control" name="cognome" type="text" required />
			</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="nome">Sesso</label>
			  	<input type="radio" name="sesso" value="m" checked> Maschio
		  		<input type="radio" name="sesso" value="f"> Femmina	
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="dataNascita">Data di nascita</label>
			<div class="col-sm-5">
				<input class="form-control" name="dataNascita" type="date"   min="1900-01-01" max="2200-12-31">
				
			</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="nome">Indirizzo Email</label>
			<div class="col-sm-5">
				<input id="emailID" class="form-control" name="email" type="email" required />
					<span id="stato_email"></span>
			</div>
	</div>	
	<div class="form-group">
		<label class="control-label col-sm-2" for="password">Password</label>
			<div class="col-sm-5">
				<input id="pass1" class="form-control" name="password" type="password" required 
					   pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!_*()@%&]).{8,}$" 
					   title="Almeno 8 caratteri, tra cui almeno: una lettera minuscola(a-z), una lettera maiuscola(A-Z), un numero(0-9), un carrattere speciale(tra #$^+=!_*()@%&)"> 
					         <small id="passwordHelpBlock" class="form-text text-muted">
				        		 Almeno 8 caratteri, tra cui almeno:<br>
				        		 -una lettera minuscola(a-z),<br>
				        		 -una lettera maiuscola(A-Z),<br>
				        		 -un numero(0-9),<br>
				        		 -un carattere speciale( #$^+=!_*()@%& )
				        	</small>				   
			</div>
	</div>	
	<div class="form-group">
		<label class="control-label col-sm-2" for="password2">Conferma Password</label>
			<div class="col-sm-5">
				<input id="pass2" class="form-control" name="password2" type="password" required/>
				<span id="confronto_passwords"></span>
			</div>
	</div>
	
		<input class="btn btn-success" type="submit" />
		<input class="btn btn-warning" type="reset" />
	</form>
    
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