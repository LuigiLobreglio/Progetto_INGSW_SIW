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

                    <title>Procedi all'acquisto!</title>

                    <script type="text/javascript" src='${pageContext.request.contextPath}/gestioneRicerca/gestione_Ricerca.js'>
                    </script>
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

  			<script>var myContextPath = "${pageContext.request.contextPath}"</script>
   <style>
        /* Media query for mobile viewport */
        @media screen and (max-width: 400px) {
            #paypal-button-container {
                width: 100%;
            }
        }
        
        /* Media query for desktop viewport */
        @media screen and (min-width: 400px) {
            #paypal-button-container {
                width: 250px;
            }
        }
    </style>
    
    <script>			                              function mostraPagamento(){
        $('div#scegliMetodoPagamentoPannello form').fadeIn();
        $('html, body').animate({
     		  scrollTop: $("div#scegliMetodoPagamentoPannello form").offset().top-200
        }, 2000);
	  
 }</script>

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
                                    <span class="glyphicon glyphicon-cutlery"></span> <a class="titolo-logo" href="#"> BYMP</a> <span class="glyphicon glyphicon-calendar"></span>
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
                            </div>
                            <!-- /.navbar-collapse -->

                        </div>
                        <!-- /.container -->
                    </nav>

                    <div class='container'>
                        <div class='row' style='padding-top:25px; padding-bottom:25px; margin-block-start:100px;'>
                            <div class='col-md-12'>
                                <div id='mainContentWrapper'>
                                    <div class="col-md-12">
                                        <h2 style="text-align: center;">
                        Rivedi il tuo ordine e procedi all'acquisto
                    </h2>
                                        <hr/>
                                        <a href="#" class="btn btn-info" style="width: 100%;">Torna al carrello</a>
                                        <hr/>
                                        <div class="shopping_cart">
                                            <div class="panel-group" id="accordion">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                 <h4 class="panel-title">
                                        	
                                            <a  id="rivediOrdineBottone"
                                            	style="text-align: center; width:100%;" 
                                            	class=" btn btn-primary btn-block" 
                                            	data-toggle="collapse" 
                                            	data-parent="#accordion" 
                                            	href="#collapseOne"><b>Rivedi l'ordine</b></a>
                                        </h4>
                                                    </div>
                                                    <div id="collapseOne" class="panel-collapse collapse in">
                                                        <div class="panel-body">
                                                            <div class="items">
                                                                <div class="col-md-9">
                                                                    <table class="table table-striped">
                                                                        <c:forEach items="${vociCarrello}" var="item">

                                                                            <tr>
                                                                                <td colspan="2">

                                                                                    <b>Nome prodotto: ${item.nomeCommerciale}</b></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <b>Quantità: ${item.quantita}</b>

                                                                                </td>
                                                                                <td>
                                                                                    <b>Prezzo: ${item.prezzo*item.quantita}</b>
                                                                                </td>
                                                                            </tr>

                                                                        </c:forEach>
                                                                    </table>
                                                                </div>
                                                       
                                                                 <div id="spesaSpedizioneDisplay"class="col-md-3">
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div style="text-align: center;">
                                                                        <h3> Subtotale </h3>
                                                                        <h3><span style="color:green;">${ordine.totaleOrdine} </span></h3>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <hr/>

                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                       <a id="inserisciIndirizzoBottone"
                                        												style="text-align: center; width:100%;"
                                                                                        data-toggle="collapse"
                                                                                        data-parent="#accordion"
                                                                                        href="#collapseTwo"
                                                                                        class="btn btn-primary btn-block"
                                                                                        >
                                                                                       <b> Scegli un indirizzo di spedizione </b></a>
                                    </h4>
                                                </div>

                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <h3 style="text-align: center;">I tuoi indirizzi:</h3>

                                                            <div id="griglia-indirizzi" class="col-md-12">

                                                                <c:if test="${fn:length(indirizzi) == 0}">
                                                                    <h4 style="text-align: center;">Non hai aggiunto indirizzi</h4>
                                                                </c:if>

                                                                <c:if test="${indirizzi != null}">
                                                                    <c:forEach items="${indirizzi}" var="ind">

                                                                        <div id="spazio-indirizzo" class="col-md-4 col-sm-6 ">
                                                                            <div class=" thumbnail" >
                                                                                <div class="displayAddressDiv" style="height: 155px; white-space:normal; overflow: hidden;
  text-overflow: ellipsis">
                                                                                    <ul style="list-style-type: none;     padding-inline-start: 10px;">
                                                                                        <li><b>${ind.nomeDestinatario} ${ind.cognomeDestinatario}</b></li>
                                                                                        <li> ${ind.stato},</li>
                                                                                        <li> ${ind.citta} ${ind.codicePostale},</li>
                                                                                        <li> ${ind.via} ${ind.numeroCivico},</li>
                                                                                        <li> Indicazioni: ${ind.dettagli}.</li>
                                                                                    </ul>
                                                                                </div>
																				
																			<form id="aggiornaIndirizzoAjaxForm"action="${pageContext.request.contextPath}/aggiornaOrdine" method="post">
																				<input type="hidden" name="idIndirizzo" value="${ind.idIndirizzo}">
																				<input type="hidden" name="stato" value="${ind.stato}">
																				<input type="hidden" name="tipo" value="spedizione">
								
																				<button id="consegnaQuestoIndirizzoBottone"class="btn btn-primary btn-block" type="submit">								
																					Consegna a questo indirizzo									
																				</button>
																			</form>
                                               
                                                                    		<form id="ajax-rimuoviIndirizzo" class="form-horizontal" action="${pageContext.request.contextPath}/aggiungiIndirizzo" >


																				<input type="hidden" name="idIndirizzo" value="${ind.idIndirizzo}">
																				<input type="hidden" name="tipo" value="rimozione">
                                                                            	<button id="rimuoviIndirizzoBottone" class="btn btn-primary btn-block" type="submit" style="margin-top: 5px;">
					                                                               	Cancella indirizzo
																				</button>
																				
																			</form>

                                                                            </div>

                                                                        </div>

                                                                    </c:forEach>
                                                                </c:if>
                                                                	
                                                            </div>

                                                       

                                                                                                                       


                                                       
                                                   
                                                     
                                                    </div>
                                                                                      
                                                    
                                                   <div id="panel-body-scelto" class="panel-body" style="display:block">
                                                        <h3 style="text-align: center;">Indirizzo scelto:</h3>

                                                            <div id="griglia-indirizzo-scelto" class="col-md-12">
                                                            	<c:if test="${indirizzoScelto == null}">
                                                            	
                                                       		       <h4 style="text-align: center;">Nessun indirizzo scelto indirizzi</h4>
                                                            	
                                                            	</c:if>
                                                            	<c:if test="${indirizzoScelto != null}">
                                                            	
                                                            	 <div id="spazio-indirizzo-scelto" class="col-md-4 col-sm-6 ">
                                                                            <div class=" thumbnail" >
                                                                                <div class="displayAddressDiv" style="height: 155px; white-space:normal; overflow: hidden; text-overflow: ellipsis">
                                                                                    <ul id="listaDatiIndirizzoScelto"style="list-style-type: none;     padding-inline-start: 10px;">
                                                                                        <li><b>${indirizzoScelto.nomeDestinatario} ${indirizzoScelto.cognomeDestinatario}</b></li>
                                                                                        <li>${indirizzoScelto.stato},</li>
                                                                                        <li>${indirizzoScelto.citta},</li>
                                                                                        <li>${indirizzoScelto.codicePostale},</li>
                                                                                        <li>${indirizzoScelto.via} ${indirizzoScelto.numeroCivico},</li>
                                                                                        <li>Indicazioni: ${indirizzoScelto.dettagli}.</li>
                                                                                    </ul>
                                                                                </div>
                                                                           </div>
                                                                           
                                                                           
                                                              	</div>
    
                                                             </c:if> 
                                                              	
                                                            </div>
                                                  </div>
                                                  
                                                     <div class="panel-heading">
                                            <h4 class="panel-title">
                     		                   <a id="aggiungiNuovoIndirizzoBottone" class="btn btn-primary btn-block" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-plus"></span> Aggiungi un nuovo indirizzo</a>
                            		        </h4>
                            		        <div id="collapseThree" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <br/>
                                                                    <br/>
                                                                    <form id="ajax-aggiungiIndirizzo" class="form-horizontal" action="${pageContext.request.contextPath}/aggiungiIndirizzo">
                                                                        <div class="form-group">
                                                                            <label class="control-label col-sm-2" for="nomeDestinatario">Nome del destinatario</label>
                                                                            <div class="col-sm-5">
                                                                                <input class="form-control" id="citta" name="nomeDestinatario" type="text" required />
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label class="control-label col-sm-2" for="cognomeDestinatario">Cognome del destinatario</label>
                                                                            <div class="col-sm-5">
                                                                                <input class="form-control" id="citta" name="cognomeDestinatario" type="text" required />
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label class="control-label col-sm-2" for="stato">Stato</label>
                                                                            <div class="col-sm-5">

																				 <select class="form-control" id="id_state" name="stato">
                                                                                    <option value="AF">Afghanistan</option>
                                                                                    <option value="AL">Albania</option>
                                                                                    <option value="DZ">Algeria</option>
                                                                                    <option value="AD">Andorra</option>
                                                                                    <option value="AO">Angola</option>
                                                                                    <option value="AI">Anguilla</option>
                                                                                    <option value="AQ">Antartide</option>
                                                                                    <option value="AG">Antigua-Barbuda</option>
                                                                                    <option value="AN">Antille Olandesi</option>
                                                                                    <option value="SA">Arabia Saudita</option>
                                                                                    <option value="AR">Argentina</option>
                                                                                    <option value="AM">Armenia</option>
                                                                                    <option value="AW">Aruba</option>
                                                                                    <option value="AU">Australia</option>
                                                                                    <option value="AT">Austria</option>
                                                                                    <option value="AZ">Azerbaijan</option>
                                                                                    <option value="BS">Bahamas</option>
                                                                                    <option value="BH">Bahrain</option>
                                                                                    <option value="BD">Bangladesh</option>
                                                                                    <option value="BB">Barbados</option>
                                                                                    <option value="BE">Belgio</option>
                                                                                    <option value="BZ">Belize</option>
                                                                                    <option value="BJ">Benin</option>
                                                                                    <option value="BM">Bermuda</option>
                                                                                    <option value="BT">Bhutan</option>
                                                                                    <option value="BY">Bielorussia</option>
                                                                                    <option value="BO">Bolivia</option>
                                                                                    <option value="BQ">Bonaire, Saint Eustatius e Saba</option>
                                                                                    <option value="BA">Bosnia-Erzegovina</option>
                                                                                    <option value="BW">Botswana</option>
                                                                                    <option value="BR">Brasile</option>
                                                                                    <option value="BN">Brunei Darussalam</option>
                                                                                    <option value="BG">Bulgaria</option>
                                                                                    <option value="BF">Burkina Faso</option>
                                                                                    <option value="BI">Burundi</option>
                                                                                    <option value="KH">Cambogia</option>
                                                                                    <option value="CM">Cameroon</option>
                                                                                    <option value="CA">Canada</option>
                                                                                    <option value="CV">Capo Verde</option>
                                                                                    <option value="TD">Ciad</option>
                                                                                    <option value="CL">Cile</option>
                                                                                    <option value="CN">Cina</option>
                                                                                    <option value="CY">Cipro</option>
                                                                                    <option value="CO">Colombia</option>
                                                                                    <option value="KM">Comoros</option>
                                                                                    <option value="CG">Congo</option>
                                                                                    <option value="CD">Congo, Repubblica Democratica del</option>
                                                                                    <option value="KR">Corea, Repubblica di</option>
                                                                                    <option value="CI">Costa d'Avorio</option>
                                                                                    <option value="CR">Costa Rica</option>
                                                                                    <option value="HR">Croazia</option>
                                                                                    <option value="CW">Curaçao</option>
                                                                                    <option value="DK">Danimarca</option>
                                                                                    <option value="DM">Dominica</option>
                                                                                    <option value="EC">Ecuador</option>
                                                                                    <option value="EG">Egitto</option>
                                                                                    <option value="SV">El Salvador</option>
                                                                                    <option value="AE">Emirati Arabi Uniti</option>
                                                                                    <option value="ER">Eritrea</option>
                                                                                    <option value="EE">Estonia</option>
                                                                                    <option value="ET">Etiopia</option>
                                                                                    <option value="RU">Federazione Russa</option>
                                                                                    <option value="FJ">Fiji</option>
                                                                                    <option value="PH">Filippine</option>
                                                                                    <option value="FI">Finlandia</option>
                                                                                    <option value="FR">Francia</option>
                                                                                    <option value="GA">Gabon</option>
                                                                                    <option value="GM">Gambia</option>
                                                                                    <option value="GE">Georgia</option>
                                                                                    <option value="GS">Georgia del Sud e Isole Sandwich Meridionali</option>
                                                                                    <option value="DE">Germania</option>
                                                                                    <option value="GH">Ghana</option>
                                                                                    <option value="JM">Giamaica</option>
                                                                                    <option value="JP">Giappone</option>
                                                                                    <option value="GI">Gibilterra</option>
                                                                                    <option value="DJ">Gibuti</option>
                                                                                    <option value="JO">Giordania</option>
                                                                                    <option value="GR">Grecia</option>
                                                                                    <option value="GD">Grenada</option>
                                                                                    <option value="GL">Groenlandia</option>
                                                                                    <option value="GP">Guadalupa</option>
                                                                                    <option value="GU">Guam</option>
                                                                                    <option value="GT">Guatemala</option>
                                                                                    <option value="GG">Guernsey</option>
                                                                                    <option value="GF">Guiana Francese</option>
                                                                                    <option value="GN">Guinea</option>
                                                                                    <option value="GQ">Guinea Equatoriale</option>
                                                                                    <option value="GW">Guinea-Bissau</option>
                                                                                    <option value="GY">Guyana</option>
                                                                                    <option value="HT">Haiti</option>
                                                                                    <option value="HN">Honduras</option>
                                                                                    <option value="HK">Hong Kong</option>
                                                                                    <option value="IN">India</option>
                                                                                    <option value="ID">Indonesia</option>
                                                                                    <option value="IQ">Iraq</option>
                                                                                    <option value="IE">Irlanda</option>
                                                                                    <option value="IS">Islanda</option>
                                                                                    <option value="BV">Isola Bouvet</option>
                                                                                    <option value="IM">Isola di Man</option>
                                                                                    <option value="CX">Isola di Natale</option>
                                                                                    <option value="HM">Isola Heard e Isole Mcdonald</option>
                                                                                    <option value="NF">Isola Norfolk</option>
                                                                                    <option value="AX">Isole Åland</option>
                                                                                    <option value="KY">Isole Cayman</option>
                                                                                    <option value="CC">Isole Cocos (Keeling)</option>
                                                                                    <option value="CK">Isole Cook</option>
                                                                                    <option value="FK">Isole Falkland (Malvine)</option>
                                                                                    <option value="FO">Isole Faroe</option>
                                                                                    <option value="MP">Isole Marianne Settentrionali</option>
                                                                                    <option value="MH">Isole Marshall</option>
                                                                                    <option value="UM">Isole Minori Esterne degli Stati Uniti</option>
                                                                                    <option value="SB">Isole Salomone</option>
                                                                                    <option value="TC">Isole Turks e Caicos</option>
                                                                                    <option value="VG">Isole Vergini, Britanniche</option>
                                                                                    <option value="VI">Isole Vergini, Statunitensi</option>
                                                                                    <option value="IL">Israele</option>
                                                                                    <option value="IT" selected="selected">Italia</option>
                                                                                    <option value="JE">Jersey</option>
                                                                                    <option value="KZ">Kazakistan</option>
                                                                                    <option value="KE">Kenya</option>
                                                                                    <option value="KG">Kirghizistan</option>
                                                                                    <option value="KI">Kiribati</option>
                                                                                    <option value="XK">Kosovo</option>
                                                                                    <option value="KW">Kuwait</option>
                                                                                    <option value="LS">Lesotho</option>
                                                                                    <option value="LV">Lettonia</option>
                                                                                    <option value="LB">Libano</option>
                                                                                    <option value="LR">Liberia</option>
                                                                                    <option value="LY">Libia</option>
                                                                                    <option value="LI">Liechtenstein</option>
                                                                                    <option value="LT">Lituania</option>
                                                                                    <option value="LU">Lussemburgo</option>
                                                                                    <option value="MO">Macao</option>
                                                                                    <option value="MK">Macedonia, ex Repubblica Jugoslava di</option>
                                                                                    <option value="MG">Madagascar</option>
                                                                                    <option value="MW">Malawi</option>
                                                                                    <option value="MV">Maldive</option>
                                                                                    <option value="MY">Malesia</option>
                                                                                    <option value="ML">Mali</option>
                                                                                    <option value="MT">Malta</option>
                                                                                    <option value="MA">Marocco</option>
                                                                                    <option value="MQ">Martinica</option>
                                                                                    <option value="MR">Mauritania</option>
                                                                                    <option value="MU">Mauritius</option>
                                                                                    <option value="YT">Mayotte</option>
                                                                                    <option value="MX">Messico</option>
                                                                                    <option value="FM">Micronesia, Stati Federati di</option>
                                                                                    <option value="MD">Moldavia, Repubblica di</option>
                                                                                    <option value="MC">Monaco</option>
                                                                                    <option value="MN">Mongolia</option>
                                                                                    <option value="ME">Montenegro</option>
                                                                                    <option value="MS">Montserrat</option>
                                                                                    <option value="MZ">Mozambico</option>
                                                                                    <option value="MM">Myanmar</option>
                                                                                    <option value="NA">Namibia</option>
                                                                                    <option value="NR">Nauru</option>
                                                                                    <option value="NP">Nepal</option>
                                                                                    <option value="NI">Nicaragua</option>
                                                                                    <option value="NE">Niger</option>
                                                                                    <option value="NG">Nigeria</option>
                                                                                    <option value="NU">Niue</option>
                                                                                    <option value="NO">Norvegia</option>
                                                                                    <option value="NC">Nuova Caledonia</option>
                                                                                    <option value="NZ">Nuova Zelanda</option>
                                                                                    <option value="OM">Oman</option>
                                                                                    <option value="NL">Paesi Bassi</option>
                                                                                    <option value="PK">Pakistan</option>
                                                                                    <option value="PW">Palau</option>
                                                                                    <option value="PA">Panama</option>
                                                                                    <option value="PG">Papua Nuova Guinea</option>
                                                                                    <option value="PY">Paraguay</option>
                                                                                    <option value="PE">Perù</option>
                                                                                    <option value="PN">Pitcairn</option>
                                                                                    <option value="PF">Polinesia Francese</option>
                                                                                    <option value="PL">Polonia</option>
                                                                                    <option value="PR">Porto Rico</option>
                                                                                    <option value="PT">Portogallo</option>
                                                                                    <option value="QA">Qatar</option>
                                                                                    <option value="GB">Regno Unito</option>
                                                                                    <option value="CZ">Repubblica Ceca</option>
                                                                                    <option value="CF">Repubblica Centrafricana</option>
                                                                                    <option value="LA">Repubblica Democratica Popolare del Laos</option>
                                                                                    <option value="DO">Repubblica Dominicana</option>
                                                                                    <option value="RE">Riunione</option>
                                                                                    <option value="RO">Romania</option>
                                                                                    <option value="RW">Ruanda</option>
                                                                                    <option value="EH">Sahara Occidentale</option>
                                                                                    <option value="BL">Saint Barthelemy</option>
                                                                                    <option value="KN">Saint Kitts e Nevis</option>
                                                                                    <option value="MF">Saint Martin</option>
                                                                                    <option value="PM">Saint Pierre e Miquelon</option>
                                                                                    <option value="VC">Saint Vincent e Grenadine</option>
                                                                                    <option value="WS">Samoa</option>
                                                                                    <option value="AS">Samoa Americane</option>
                                                                                    <option value="SM">San Marino</option>
                                                                                    <option value="SH">Sant'Elena, Ascensione e Tristan da Cunha</option>
                                                                                    <option value="LC">Santa Lucia</option>
                                                                                    <option value="VA">Santa Sede (Stato della Città del Vaticano)</option>
                                                                                    <option value="ST">São Tomé e Príncipe</option>
                                                                                    <option value="SN">Senegal</option>
                                                                                    <option value="RS">Serbia</option>
                                                                                    <option value="SC">Seychelles</option>
                                                                                    <option value="SL">Sierra Leone</option>
                                                                                    <option value="SG">Singapore</option>
                                                                                    <option value="SX">Sint Maarten</option>
                                                                                    <option value="SK">Slovacchia</option>
                                                                                    <option value="SI">Slovenia</option>
                                                                                    <option value="SO">Somalia</option>
                                                                                    <option value="ES">Spagna</option>
                                                                                    <option value="LK">Sri Lanka</option>
                                                                                    <option value="US">Stati Uniti</option>
                                                                                    <option value="ZA">Sudafrica</option>
                                                                                    <option value="SR">Suriname</option>
                                                                                    <option value="SJ">Svalbard e Jan Mayen</option>
                                                                                    <option value="SE">Svezia</option>
                                                                                    <option value="CH">Svizzera</option>
                                                                                    <option value="SZ">Swaziland</option>
                                                                                    <option value="TJ">Tagikistan</option>
                                                                                    <option value="TH">Tailandia</option>
                                                                                    <option value="TW">Taiwan</option>
                                                                                    <option value="TZ">Tanzania, Repubblica Unita di</option>
                                                                                    <option value="TF">Territori Francesi Meridionali</option>
                                                                                    <option value="IO">Territorio Britannico dell'Oceano Indiano</option>
                                                                                    <option value="TL">Timor Est</option>
                                                                                    <option value="TG">Togo</option>
                                                                                    <option value="TK">Tokelau</option>
                                                                                    <option value="TO">Tonga</option>
                                                                                    <option value="TT">Trinidad e Tobago</option>
                                                                                    <option value="TN">Tunisia</option>
                                                                                    <option value="TR">Turchia</option>
                                                                                    <option value="TM">Turkmenistan</option>
                                                                                    <option value="TV">Tuvalu</option>
                                                                                    <option value="UA">Ucraina</option>
                                                                                    <option value="UG">Uganda</option>
                                                                                    <option value="HU">Ungheria</option>
                                                                                    <option value="UY">Uruguay</option>
                                                                                    <option value="UZ">Uzbekistan</option>
                                                                                    <option value="VU">Vanuatu</option>
                                                                                    <option value="VE">Venezuela</option>
                                                                                    <option value="VN">Vietnam</option>
                                                                                    <option value="WF">Wallis e Futuna</option>
                                                                                    <option value="YE">Yemen</option>
                                                                                    <option value="ZM">Zambia</option>
                                                                                    <option value="ZW">Zimbabwe</option>
                                                                                </select>

                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label class="control-label col-sm-2" for="citta">Città</label>
                                                                            <div class="col-sm-5">
                                                                                <input class="form-control" id="citta" name="citta" type="text" required />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label col-sm-2" for="codicePostale">Codice
                                                                                <br>Postale</label>
                                                                            <div class="col-sm-5">
                                                                                <input class="form-control" id="codicePostale" name="codicePostale" type="text" required />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label col-sm-2" for="via">Via</label>
                                                                            <div class="col-sm-5">
                                                                                <input class="form-control" id="via" name="via" type="text" required />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label col-sm-2" for="numeroCivico">Numero civico</label>
                                                                            <div class="col-sm-5">
                                                                                <input class="form-control" id="numeroCivico" name="numeroCivico" type="text" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="control-label col-sm-2" for="dettagli">Dettagli</label>
                                                                            <div class="col-sm-5">
                                                                                <input class="form-control" id="dettagli" name="dettagli" type="text" maxlength="80" />
                                                                            </div>
                                                                        </div>
																		
																		<input type="hidden" name="tipo" value="aggiunta">
                                                                        <input class="btn btn-success" type="submit" value="Aggiungi" />
                                                                        <input class="btn btn-warning" type="reset" value="Cancella tutto" style="white-space:normal;" />
                                                                    </form>

                                                                </div>
                                                            </div>
                                       </div>
                                                </div>

                                            </div>
									
												<hr>

                                            <div id="scegliMetodoPagamentoPannello" class="panel panel-default">
                                                <div class="panel-heading">
                                                	<form id="datiPagamentoForm"action="" method="post" style="display: none">
                                                
                                                    <h4  class="panel-title">
															<input type="hidden" name="idIndirizzo" value="${indirizzoScelto.idIndirizzo}">
															<input type="hidden" name="totaleOrdine" value="${ordine.totaleOrdine}">
								
															<button id="scegliMetodoPagamentoBottone"
                                        					                style="text-align: center; width:100%; "
                                        									data-toggle="collapse"
                                                                            data-parent="#accordion"
                                                                            data-target="#collapseFour"
                                                                            class=" btn btn-primary btn-block"
                                                                            onclick="                                                                    
                                                                           	document.getElementById('collapseFour').scrollIntoView()"> 
                 											 				<b>Scegli un metodo di pagamento</b>			
															</button>
														
                 											  
                          				          </h4>
                          				          																			</form>
                          				          
                                               </div>

                                       
                                                    <div id="collapseFour" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <div id="paypal-button-container" style="
    display: table;
    margin: 0 auto;
"></div>

    <!-- Include the PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=AZTN0LvIsUc_0ySlt6qv5_8Lpx7k1_svmMkOolWy6MjhG18SVZRHA2abulStkqUpcBFrNcxVt3TfJKEV&currency=EUR"></script>

    <script>
        // Render the PayPal button into #paypal-button-container
       
    </script>
    <br>
    	<p style="text-align: center;"><span>oppure</span></p>
    <br>
                                                        					<form id="pagamentoContrassegnoForm"action="" method="post">
																				<input type="hidden" name="idIndirizzo" value="${ind.idIndirizzo}">
																				<input type="hidden" name="stato" value="${ind.stato}">
																				<input type="hidden" name="tipo" value="spedizione">
								
																				<button id="pagamentoContrassegnoBottone"class="btn btn-primary btn-block" type="submit">								
																					Pagamento in contrassegno								
																				</button>
																			</form>
                                                            <br/>
                                                            <div style="text-align: left;">
                                                                <br/> By submiting this order you are agreeing to our <a href="/legal/billing/">universal
                                                billing agreement</a>, and <a href="/legal/terms/">terms of service</a>. If you have any questions about our products or services please contact us before placing this order.
                                                            </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        
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
                        
			<script>
			/**
			 * 
			 */		
			 
			 
			          

			                       
			                            // TODO: The rest of the code will go here...

			                            $('div#collapseThree').on('submit','div.panel-body form#ajax-aggiungiIndirizzo',function(event) {
			                                // Stop the browser from submitting the form.
			                                // Stop the browser from submitting the form.
			                                event.preventDefault();
			                                deleteAddress(this);
			                            });
			                            
			                        

			                        
			                        $('#griglia-indirizzi').on('submit','div#spazio-indirizzo form#ajax-rimuoviIndirizzo',function(event) {
			                            // Stop the browser from submitting the form.
			                            event.preventDefault();
			                            deleteAddress(this);
			                        });
			                        
			                        function deleteAddress(formSubmitted) {
			                            // Get the form.

			                                var formData = $(formSubmitted).serialize();

			                                $.ajax({
			                                    type: 'GET',
			                                    url: $(formSubmitted).attr('action'),
			                                    data: formData,
			                                    success: function(response) {

			                                        var ind = JSON.parse(response);


			                                        $('#griglia-indirizzi').empty();

			                                        for (var i = 0; i < ind.length; i++) {

			                                            $('#griglia-indirizzi').append(' <div id=\"spazio-indirizzo\" class=\"col-md-4 col-sm-6 \"> <div class=\" thumbnail\" > <div class=\"displayAddressDiv\" style=\"height: 155px; white-space:normal; overflow: hidden; text-overflow: ellipsis\"> <ul style=\"list-style-type: none; padding-inline-start: 10px;\"> <li><b>'+ind[i].nomeDestinatario+' '+ind[i].cognomeDestinatario+'</b></li> <li> '+ind[i].stato+',</li> <li> '+ind[i].citta+' '+ind[i].codicePostale+',</li> <li> '+ind[i].via+' '+ind[i].numeroCivico+',</li> <li> Indicazioni: '+ind[i].dettagli+'.</li> </ul> </div> <form id=\"aggiornaIndirizzoAjaxForm\" action=\"'+myContextPath+'/aggiornaOrdine\" method=\"post\"> <input type=\"hidden\" name=\"idIndirizzo\" value=\"'+ind[i].idIndirizzo+'\"> <input type=\"hidden\" name=\"stato\" value=\"'+ind[i].stato+'\"> <input type=\"hidden\" name=\"tipo\" value=\"spedizione\"> <button id=\"consegnaQuestoIndirizzoBottone\" class=\"btn btn-primary btn-block\" type=\"submit\"> Consegna a questo indirizzo </button> </form> <form id=\"ajax-rimuoviIndirizzo\" class=\"form-horizontal\" action=\"'+myContextPath+'/aggiungiIndirizzo\" > <input type=\"hidden\" name=\"idIndirizzo\" value=\"'+ind[i].idIndirizzo+'\"> <input type=\"hidden\" name=\"tipo\" value=\"rimozione\"> <button id=\"rimuoviIndirizzoBottone\" class=\"btn btn-primary btn-block\" type=\"submit\" style=\"margin-top: 5px;\"> Cancella indirizzo </button> </form>  </div>\r\n\r\n </div>');
			                                        }
			                                      /*  var script = document.createElement("script");
			                                        script.type = "text/javascript";
			                                        script.src =myContextPath+'/gestioneOrdine/gestioneOrdine.js' ;
			                                        document.getElementsByTagName("head")[0].removeChild(script);
			                                        document.getElementsByTagName("head")[0].appendChild(script);*/
			                                    },
			                                    error:function(){
			                                  	  
			                                  	  $(formSubmitted).append("<span style=\"color:red;\" class=\"glyphicon glyphicon-alert\">Indirizzo scelto per la consegna. <br> Per rimuoverlo, prima scegli un'altro indirizzo per la consegna.</span> ");
			                                    }

			                                })

			                            };
			                       
			                       
			                              
			                            $('#griglia-indirizzi').on('submit','div#spazio-indirizzo form#aggiornaIndirizzoAjaxForm',function(event) {
			                                  // Stop the browser from submitting the form.
			                                  event.preventDefault();
			                                  updateAddress(this);

		                                         $('div#scegliMetodoPagamentoPannello form').fadeIn();
				                                 $('html, body').animate({
				                              		  scrollTop: $("div#scegliMetodoPagamentoPannello form").offset().top-200
				                                 }, 2000);



			                              });
			                              
			                              
			                              function updateAddress(formSubmitted){
			                              	 var formData = $(formSubmitted).serialize();
			                              	   $.ajax({
			                                         type: 'POST',
			                                         url: $(formSubmitted).attr('action'),
			                                         data: formData,
			                                         success: function(response)  {
															
			                                             var indScelto = JSON.parse(response);

			                                             $('#panel-body-scelto').css("display","block");
			                                             $('#griglia-indirizzo-scelto').empty();
			                                             
			                                             $('div#spesaSpedizioneDisplay').empty();

			                                                 $('#griglia-indirizzo-scelto').append(' <div id=\"spazio-indirizzo\" class=\"col-md-4 col-sm-6 \"> <div class=\" thumbnail\" > <div class=\"displayAddressDiv\" style=\"height: 155px; white-space:normal; overflow: hidden; text-overflow: ellipsis\"> <ul id=\"listaDatiIndirizzoScelto\" style=\"list-style-type: none; padding-inline-start: 10px;\"> <li><b>'+indScelto.nomeDestinatario+' '+indScelto.cognomeDestinatario+'</b></li> <li>'+indScelto.stato+',</li> <li>'+indScelto.citta+',</li> <li>'+indScelto.codicePostale+',</li> <li>'+indScelto.via+' '+indScelto.numeroCivico+',</li> <li>Indicazioni: '+indScelto.dettagli+'.</li> </ul> </div>  </div>\r\n\r\n </div>');
															 $('div#spesaSpedizioneDisplay').append(' <h3> Spese di spedizione </h3> <h3 id=\"spesaSpedizioneTesto\"><span style="color:green;">'+indScelto.spesaSpedizione+'</span></h3> </div>');
			                                         }

													
			                                     })
			                              }
			                              
			                              
			                             
			                              $('div#scegliMetodoPagamentoPannello').on('submit','form#datiPagamentoForm',function(event) {
			                                  // Stop the browser from submitting the form.
			                                  event.preventDefault();
			                            
			                                  var o = {};
			                                  var a = $(this).serializeArray();
			                                  $.each(a, function () {
			                                      if (o[this.name]) {
			                                          if (!o[this.name].push) {
			                                              o[this.name] = [o[this.name]];
			                                          }
			                                          o[this.name].push(this.value || '');
			                                      } else {
			                                          o[this.name] = this.value || '';
			                                      }
			                                  });
			                                  
			                                  alert(o['totaleOrdine']);
			                                  var titolo='BympDinamico';
			                                  paypal.Buttons({
			                                      style: {
			                                          layout: 'vertical',
			                                          color:  'gold',
			                                           shape:  'pill',
			                                          label:  'pay',
			                                          height: 40
			                                          
			                                      },
			                                      
			                                      // Set up the transaction
			                                      createOrder: function(data, actions) {

														var data=$('ul#listaDatiIndirizzoScelto li').map(function(){
		        											return $(this).text();
		    												}).get();
					                                  
														data[1]=data[1].substring(0, data[1].length - 1);
														data[2]=data[2].substring(0, data[2].length - 1);
														data[3]=data[3].substring(0, data[3].length - 1);
														data[4]=data[4].substring(0, data[4].length - 1);
					                                  var spesaSpedizione=parseFloat($('h3#spesaSpedizioneTesto').text());
														var totaleOrdine=parseFloat(o['totaleOrdine'])+spesaSpedizione;
														alert(spesaSpedizione);
			                                          return actions.order.create({
			                                          	  "intent": "CAPTURE",
			                                          	  "application_context": {
			                                          	    "return_url": "https://example.com",
			                                          	    "cancel_url": "https://example.com",
			                                          	    "brand_name": "Bymp",
			                                          	    
			                                          	    "landing_page": "BILLING",
			                                          	    "shipping_preference": "SET_PROVIDED_ADDRESS",
			                                          	    "user_action": "CONTINUE"
			                                          	  },
			                                          	  "purchase_units": [
			                                          	    {
			                                
			                                          	      "amount": {
			                                          	        "currency_code": "EUR",
			                                          	        "value": totaleOrdine,
			                                          	       	 "breakdown": {
			                                          	         "item_total": {
			                                          	            "currency_code": "EUR",
			                                          	            "value": parseFloat(o['totaleOrdine'])
			                                          	          },
			                                          	          "shipping": {
			                                          	            "currency_code": "EUR",
			                                          	            "value": spesaSpedizione
			                                          	          }/*,
			                                          	          "handling": {
			                                          	            "currency_code": "USD",
			                                          	            "value": "10.00"
			                                          	          },
			                                          	          "tax_total": {
			                                          	            "currency_code": "USD",
			                                          	            "value": "20.00"
			                                          	          },
			                                          	          "shipping_discount": {
			                                          	            "currency_code": "EUR",
			                                          	            "value": "10"
			                                          	          }*/
			                                          	        } 
			                                          	      }
			                                          	    /* ,
			                                          	      "items": [
			                                          	        {
			                                          	          "name": "T-Shirt",
			                                          	          "description": "Green XL",
			                                          	          "sku": "sku01",
			                                          	          "unit_amount": {
			                                          	            "currency_code": "USD",
			                                          	            "value": "90.00"
			                                          	          },
			                                          	          "tax": {
			                                          	            "currency_code": "USD",
			                                          	            "value": "10.00"
			                                          	          },
			                                          	          "quantity": "1",
			                                          	          "category": "PHYSICAL_GOODS"
			                                          	        },
			                                          	        {
			                                          	          "name": "Shoes",
			                                          	          "description": "Running, Size 10.5",
			                                          	          "sku": "sku02",
			                                          	          "unit_amount": {
			                                          	            "currency_code": "USD",
			                                          	            "value": "45.00"
			                                          	          },
			                                          	          "tax": {
			                                          	            "currency_code": "USD",
			                                          	            "value": "5.00"
			                                          	          },
			                                          	          "quantity": "2",
			                                          	          "category": "PHYSICAL_GOODS"
			                                          	        }
			                                          	      ] */,
			                                          	      "shipping": {
			                                          	        "address": {
			                                          	          "name": {
			                                          	            "give_name":"John",
			                                          	            "surname":"Doe"
			                                          	          },
			                                          	          "address_line_1": data[4],
			                                          	          "admin_area_2": data[2],
			                                          	          "postal_code": data[3],
			                                          	          "country_code": "IT"
			                                          	        }
			                                          	      }
			                                          	    }
			                                          	  ]
			                                          	});
			                                      },

			                                      // Finalize the transaction
			                                      onApprove: function(data, actions) {
			                                          return actions.order.capture().then(function(details) {
			                                              // Show a success message to the buyer
			                                              alert('Transaction completed by ' + details.payer.name.given_name + '!');
			                                          });
			                                      }
			                                      
			                                
			                                  }).render('#paypal-button-container');


			                              });
			                              
			                              
			                              function mostraScelta(){
			                              	
			                          		$('#panel-body-scelto').css("display","block");

			                              }
			                              
			                 	
			                                     
			                              
			                 	
			                                     </script>

                </body>

                </html>