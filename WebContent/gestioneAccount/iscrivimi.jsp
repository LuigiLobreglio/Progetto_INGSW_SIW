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

    <title>Iscriviti</title>
    
    <script src="../js/jquery-3.2.1.min.js"></script>   

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../css/js_style/bootstrap.min.js"></script>
    
    <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles --> 
    <link href="../css/custom.css" rel="stylesheet">
    
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

<script src="gestione_Account.js"></script>
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
                	<span class="glyphicon glyphicon-cutlery" ></span> <a class="titolo-logo" href="#"> BYMP</a>  <span class="glyphicon glyphicon-calendar"></span> 	
                </div>
            </div>
            
            <!-- Navbar links  -->
            <div class="collapse navbar-collapse" id="navbar">
            <form class="navbar-form navbar-left" action=null>
  				<div class="input-group">
    				<input id="spazio-ricerca" type="text" class="form-control" placeholder="Cerca un prodotto!" >
    				<div class="input-group-btn">
      					<button id="btn-ricerca" class="btn btn-default" type="submit">
        					<i class="glyphicon glyphicon-search"></i>
      					</button>
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
						<li><a href="iscriviCliente"><span class="glyphicon glyphicon-pencil"></span> Iscriviti </a></li>
						<li><a href="doLogin"><span class="glyphicon glyphicon-log-in"></span> Accedi </a></li>
					</c:if>						
                 	<c:if test="${nome != null}">
      					<li><a href="#"><span class="glyphicon glyphicon-user"></span> Ciao, {$nome} !</a></li>
						<li><a href="doLogin?logout=true"><span class="glyphicon glyphicon-log-out"></span> Esci </a></li>
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
    <form id="moduloRegistrazione" class="form-horizontal" method="post" action="../iscriviCliente">
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
    


</body>