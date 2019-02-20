<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Accesso Consentito!</title>
    
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>   
    <script type="text/javascript" src='${pageContext.request.contextPath}/gestioneRicerca/gestione_Ricerca.js'> </script>
    

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
    
    <script src="${pageContext.request.contextPath}/gestioneAccount/gestione_Account.js"></script>
   


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
						<li><a href="gestioneAccount/iscrivimi.jsp"><span class="glyphicon glyphicon-pencil"></span> Iscriviti </a></li>
						<li><a href="gestioneAccount/faiAccesso.jsp"><span class="glyphicon glyphicon-log-in"></span> Accedi </a></li>
					</c:if>						
                 	<c:if test="${nome != null}">
      					<li><a href="#"><span class="glyphicon glyphicon-user"></span> Ciao, ${nome} !</a></li>
						<li><a href="controllaPermessi?logout=true"><span class="glyphicon glyphicon-log-out"></span> Esci </a></li>
					</c:if>	
    			</ul>	
            </div><!-- /.navbar-collapse -->
            
        </div><!-- /.container -->
    </nav>
    
    <div style="margin-top: 100px; text-align: center">
	<h2>Effettua l'accesso!</h2>
	<br>
	
<div class="fb-login-button" data-scope="email" data-onlogin="checkLoginState();" data-size="large" data-button-type="continue_with" data-auto-logout-link="false" data-use-continue-as="false"></div>

<br>

	<script>
	
	  function statusChangeCallback(response) {
		    console.log('statusChangeCallback');
		    console.log(response);
		    // The response object is returned with a status field that lets the
		    // app know the current login status of the person.
		    // Full docs on the response object can be found in the documentation
		    // for FB.getLoginStatus().
		    if (response.status === 'connected') {
      		// Logged into your app and Facebook.
      			 console.log( 'Connesso a Facebook e all\'app');
			var resp;
		    
			FB.api('/me', {fields: 'id, first_name, last_name, email'}, function(responses) {
		    	      console.log( responses);
		    	      resp=responses;
		    	  	$.ajax({ type: "POST",
		          		 url: "${pageContext.request.contextPath}/iscriviCliente",
		          		 data: { "idFacebook": resp.id, "nome": resp.first_name, "cognome":resp.last_name, "indirizzo_Email": resp.email},
		          		 success: function(idAccount){ 
									
		          			window.location.replace("${pageContext.request.contextPath}/gestioneAccount/accessoConsentito.jsp");

		          		 		},
		   			
		          		 error: function(){
		          			 	alert(stringa_email+"Chiamata fallita!!!");
		          		 		} 
		   	
		   		});/*
		    	      $.post("${pageContext.request.contextPath}/iscriviCliente", { "idFacebook": resp.id, "nome": resp.first_name, "cognome":resp.last_name, "indirizzo_Email": resp.email}, function() {
		    	          alert(data);
		    	      });
*/
		    	    });
    

		 
      		}
		    else if (response.status === 'not_authorized'){
     			 console.log( 'Connesso a Facebook, ma non all\'app');

		    	
		    }
		    else {
      		// The person is not logged into your app or we are unable to tell.
    			 console.log( 'Non connesso a Facebook e all\'app, oppure non è possibile saperlo');

    		}
  
		}
	
	  window.fbAsyncInit = function() {
			
		    FB.init({
		        appId      : '246262486285203',
		        cookie     : false,  // enable cookies to allow the server to access 
		                            // the session
		        xfbml      : true,  // parse social plugins on this page
		        version    : 'v3.2' // The Graph API version to use for the call
		      });
		    
		    // Now that we've initialized the JavaScript SDK, we call 
		    // FB.getLoginStatus().  This function gets the state of the
		    // person visiting this page and can return one of three states to
		    // the callback you provide.  They can be:
		    //
		    // 1. Logged into your app ('connected')
		    // 2. Logged into Facebook, but not your app ('not_authorized')
		    // 3. Not logged into Facebook and can't tell if they are logged into
		    //    your app or not.
		    //
		    // These three cases are handled in the callback function.

		    FB.getLoginStatus(function(response) {
			    console.log(response);
		    });
		  
		  
		    };
		    
		    
		    function checkLoginState() {
			    console.log('checkLoginState');

		        FB.getLoginStatus(function(response) {
		          statusChangeCallback(response);
		        });
		      }

	/*
	document.getElementById('custom-login-button').addEventListener('click', function (){
		
			FB.login(function(response) { 
		    	console.log(response);

			}, {
				scope: 'email',
				return_scopes:true
				});
			
			
		
	});
	
	*/


// Load the SDK asynchronously

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/it_IT/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  
 	 </script>
 	 
	<p><span>oppure</span></p>
	<p>Inserisci le tue credenziali</p>    
	</div>
    
    
    <div class=container>
    
    
<c:if test="${errore == 'password_errata' }">
	<span style="color:red;" class="glyphicon glyphicon-alert"> Accesso negato, Password errata!</span>
</c:if>	
					
<c:if test="${errore == 'email_errata' }">
	<span style="color:red;" class="glyphicon glyphicon-alert"> Accesso negato, nessun cliente associato all'indirizzo email precedentemente inserito!</span>
</c:if>	
  


  <form id="moduloAccesso" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/inviaCredenziali">
	<div class="form-group">
		<label class="control-label col-sm-2" for="indEmail">Indirizzo Email</label>
			<div class="col-sm-5">
				<input id=emailID class="form-control" name="indEmail" type="text" required />
						<span id="stato_email"></span>	
			</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2" for="password">Password</label>
			<div class="col-sm-5">
				<input id="pass" class="form-control" name="password" type="password" required >
			</div>
	</div>	
	
	
		<input class="btn btn-success" type="submit" value="Accedi"/>
		<input class="btn btn-warning" type="reset" value="Cancella tutto" />
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
</html>