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
      <title>Benvenuto in BYMP</title>
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
      
      
      <div class="container" style="margin-block-start:150px">
        
         <!-- Spazio per la ricerca avanzata -->
         <div class="side-bar col-md-3">
            <form method="get" action="${pageContext.request.contextPath}/RicercaProdotto">
               <input id="spazio-ricerca" type="hidden" name="tipo" value="avanzata">
               <div>
                  <h3>Codice</h3>
                  <div>
                     <input class="form-control" type="number" placeholder="Codice identificativo" name="idProdotto">
                  </div>
               </div>
               <div>
                  <h3>Nome commerciale</h3>
                  <div>
                     <input class="form-control" type="search" placeholder="Nome del prodotto" name="nomeCommerciale">
                  </div>
               </div>
               <div>
                  <h3>Categoria</h3>
                  <select class="form-control" name="categoria">
                     <option>Tutte le categorie</option>
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
                  <h3>Prezzo</h3>
                  <p>
                     <label for="prezzoMin">Da:</label>
                     <input class="form-control" type="number" name="prezzoMin" placeholder="Prezzo minimo" min="0">
                     <label for="prezzoMax">A:</label>
                     <input class="form-control" type="number" name="prezzoMax" placeholder="Prezzo massimo" min="0">
                  </p>
               </div>
               <br>
               <button id="btn-ricerca" class="btn btn-primary btn-block" type="submit"><i class="glyphicon glyphicon-search"></i> Ricerca avanzata</button>
            </form>
            <!-- //price range -->
         </div>
         
         <!-- Spazio contenente i possibili risultati di ricerca -->
         <div class="col-md-9">
            <c:if test="${inizio == null}">
               <h5>Inserisci i parametri di ricerca</h5>
            </c:if>
            <c:if test="${fn:length(prodotti) == 0 && inizio==false}">
               <h4>Nessun risultato trovato</h4>
            </c:if>
            <c:if test="${prodotti != null && inizio==false}">
               <small style="margin-inline-start:16px">Risultati in ${param.categoria}:</small>
               <small style="color:orange;">${param.nomeCommerciale}</small>
               <small> = ${fn:length(prodotti)} </small> <br>
               <c:forEach items="${prodotti}" var="prod">
                  
                  <!-- visualizzazione, come elemento di una griglia, di un risultato di ricerca  --> 
                  <div class="col-lg-3 col-md-4 col-sm-6 ">
                     <div class="thumbnail featured-product" style="position: relative; min-heighT:400px ">
                        <form id="dettagli-prodotto-form" action="${pageContext.request.contextPath}/visualizzaProdotto" method="post">
                           <a href='#'>
                           <input type="hidden" name="idProdotto" value="${prod.idProdotto}">
                           <input type="image" src="${pageContext.request.contextPath}/${prod.immagine}" 
                              style=" margin-right: auto; 
                              margin-left: auto; 
                              display: block; 
                              max-width: 100%; 
                              height: auto; 
                              vertical-align: middle;
                              border-style: none;
                              border: 0;"
                              >
                           </a>
                        </form>
                        <div class="caption" style="background-color: #ddddddb8;  border-radius: 5px;">
                           <form id="dettagli-prodotto-form" action="${pageContext.request.contextPath}/visualizzaProdotto" method="post">
                              <h3 style="min-height:63px;">
                                 <input type="hidden" name="idProdotto" value="${prod.idProdotto}">
                                 <button id="nomeProdottoLink" type="submit">${prod.nomeCommerciale}</button>
                              </h3>
                           </form>
                           <p class="price">
                              <fmt:formatNumber type="number" pattern="0.00" value="${prod.prezzo}" />
                              €
                           </p>
                           
                           <!--  Elementi per le opzioni sul prodotto -->
                           <form id="dettagli-prodotto-form" action="${pageContext.request.contextPath}/visualizzaProdotto" method="post">
                              <input type="hidden" name="idProdotto" value="${prod.idProdotto}">
                              <input id="dettagliProdottoBottone" class="btn btn-primary btn-block" type="submit" name="submit" value="Vedi prodotto">
                           </form>
                           <div>
                              <form action="${pageContext.request.contextPath}/aggiungiAlCarrello" method="post">
                                 <input type="hidden" name="idAccountProprietario" value="${idAccount}">
                                 <input type="hidden" name="idProd" value="${prod.idProdotto}">
                                 <input type="hidden" name="immagine" value="${prod.immagine}">
                                 <input type="hidden" name="nomeCommerciale" value="${prod.nomeCommerciale}">
                                 <input type="hidden" name="prezzo" value="${prod.prezzo}">
                                 <button id="aggiungiProdottoDaListaBottone" class="btn btn-primary btn-block" type="submit" onclick="test()">								
                                 <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 
                                 Aggiungi al carrello
                                 </button>
                              </form>
                           </div>                          
                           
                        </div>
                     </div>
                  </div>
                  
               </c:forEach>
            </c:if>
            
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
   </body>
</html>