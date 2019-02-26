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

                    <script>
                        $(function() {
                            // Get the form.
                            var form = $('#ajax-aggiungiIndirizzo');

                            // Get the messages div.
                            var formMessages = $('#form-messages');

                            // TODO: The rest of the code will go here...

                            $(form).submit(function(event) {
                                // Stop the browser from submitting the form.
                                event.preventDefault();

                                // TODO
                                var formData = $(form).serialize();

                                $.ajax({
                                    type: 'POST',
                                    url: $(form).attr('action'),
                                    data: formData,
                                    success: function(response) {

                                        var ind = JSON.parse(response);

                                        alert("Indirizzo aggiunto tramite ajax call");

                                        $('#griglia-indirizzi').empty();

                                        for (var i = 0; i < ind.length; i++) {

                                            $('#griglia-indirizzi').append('<div id="spazio-indirizzo" class="col-sm-6">' +
                                                '<div class="js-same-height addr-display a-nostyle a-spacing-base" data-testid="" style="height: 155px;">' +
                                                '<div class="displayAddressDiv">' +
                                                '<ul style="list-style-type: none;"class="displayAddressUL">' +
                                                '<li><b>' + ind[i].nomeDestinatario + ' ' + ind[i].cognomeDestinatario + '</b></li>' +
                                                '<li>' + ind[i].stato + ',</li>' +
                                                '<li>' + ind[i].citta + ' ' + ind[i].codicePostale + ',</li>' +
                                                '<li>' + ind[i].via + ' ' + ind[i].numeroCivico + ',</li>' +
                                                '<li> Indicazioni: ' + ind[i].dettagli + '.</li>' +
                                                '</ul>' +
                                                '</div>' +
                                                '</div>' +

                                                '<div class="btn btn-primary btn-block">' +
                                                'Consegna a questo indirizzo<span class="screenreader-context-span screenreader-address-span"> </span>' +
                                                '</div>' +

                                                '<div class="btn btn-primary btn-block">' +
                                                'Modifica indirizzo<span class="screenreader-context-span screenreader-address-span"> </span>' +
                                                '</div>' +

                                                '<div id="rimuoviIndirizzoBottone"class="btn btn-primary btn-block">' +
                                                'Cancella indirizzo<span class="screenreader-context-span screenreader-address-span"> </span>' +
                                                '</div>' +

                                                '</div>'
                                            );
                                        }

                                    }

                                })

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
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Rivedi l'ordine</a>
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
                                                                <div class="col-md-3">
                                                                    <div style="text-align: center;">
                                                                        <h3> Subtotale </h3>
                                                                        <h3><span style="color:green;">${ordine.totaleOrdine}</span></h3>
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
                                        <div style="text-align: center; width:100%;"><a id="inserisciIndirizzoBottone"
                                        												style="width:100%;"
                                                                                        data-toggle="collapse"
                                                                                        data-parent="#accordion"
                                                                                        href="#collapseTwo"
                                                                                        class="btn btn-primary btn-block"
                                                                                        onclick= "$('#payInfo').fadeIn();">
                                                                                        Inserisci un indirizzo di spedizione</a></div>
                                    </h4>
                                                </div>

                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="panel-body">

                                                        <h3>I tuoi indirizzi:</h3>

                                                        <div>
                                                            <div id="griglia-indirizzi" class="col-md-12">

                                                                <c:if test="${fn:length(indirizzi) == 0}">
                                                                    <h4>Non hai aggiunto indirizzi</h4>
                                                                </c:if>

                                                                <c:if test="${indirizzi != null}">
                                                                    <c:forEach items="${indirizzi}" var="ind">

                                                                        <div id="spazio-indirizzo" class="col-sm-6">
                                                                            <div class="js-same-height addr-display a-nostyle a-spacing-base" data-testid="" style="height: 155px;">
                                                                                <div class="displayAddressDiv">
                                                                                    <ul style="list-style-type: none;" class="displayAddressUL">
                                                                                        <li><b>${ind.nomeDestinatario} ${ind.cognomeDestinatario}</b></li>
                                                                                        <li> ${ind.stato},</li>
                                                                                        <li> ${ind.citta} ${ind.codicePostale},</li>
                                                                                        <li> ${ind.via} ${ind.numeroCivico},</li>
                                                                                        <li> Indicazioni: ${ind.dettagli}.</li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>

                                                                            <div class="btn btn-primary btn-block">

                                                                                Consegna a questo indirizzo<span class="screenreader-context-span screenreader-address-span"> </span>

                                                                            </div>

                                                                            <div class="btn btn-primary btn-block">

                                                                                Modifica indirizzo<span class="screenreader-context-span screenreader-address-span"> </span>

                                                                            </div>

                                                                            <div id="rimuoviIndirizzoBottone" class="btn btn-primary btn-block">

                                                                                Cancella indirizzo<span class="screenreader-context-span screenreader-address-span"> </span>

                                                                            </div>

                                                                        </div>

                                                                    </c:forEach>
                                                                </c:if>
                                                            </div>
                                                        </div>

                                                        <div class="panel panel-default">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Aggiungi un nuovo indirizzo</a>
                                    </h4>
                                                            </div>

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

                                                                                <select name="enterAddressCountryCode" class="enterAddressFormField" id="enterAddressCountryCode">
                                                                                    <option value="">--</option>
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
                                                                                    <option value="IT">Italia</option>
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

                                                                        <input class="btn btn-success" type="submit" value="Aggiungi" />
                                                                        <input class="btn btn-warning" type="reset" value="Cancella tutto" style="white-space:normal;" />
                                                                    </form>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                        <div style="text-align: center;"><a 
                                        									data-toggle="collapse"
                                                                            data-parent="#accordion"
                                                                            href="#collapseThree"
                                                                            class=" btn   btn-success" id="payInfo"
                                                                            style="width:100%;display: none;" 

                                                                            onclick="$(this).fadeOut(); 
                   document.getElementById('collapseThree').scrollIntoView()">Enter Payment Information »
                   </a>
                                        </div>
                                    </h4>
                                                </div>

                                            </div>
                                            <form class="form-horizontal" role="form" action="" method="post" id="payment-form">

                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                            <b>Payment Information</b>
                                        </a>
                                    </h4>
                                                    </div>
                                                    <div id="collapseThree" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <span class='payment-errors'></span>
                                                            <fieldset>
                                                                <legend>What method would you like to pay with today?</legend>
                                                                <div class="form-group">
                                                                    <label class="col-sm-3 control-label" for="card-holder-name">Name on Card
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <input type="text" class="form-control" stripe-data="name" id="name-on-card" placeholder="Card Holder's Name">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-3 control-label" for="card-number">Card Number
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <input type="text" class="form-control" stripe-data="number" id="card-number" placeholder="Debit/Credit Card Number">
                                                                        <br/>
                                                                        <div><img class="pull-right" src="https://s3.amazonaws.com/hiresnetwork/imgs/cc.png" style="max-width: 250px; padding-bottom: 20px;">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-3 control-label" for="expiry-month">Expiration Date
                                                                        </label>
                                                                        <div class="col-sm-9">
                                                                            <div class="row">
                                                                                <div class="col-xs-3">
                                                                                    <select class="form-control col-sm-2" data-stripe="exp-month" id="card-exp-month" style="margin-left:5px;">
                                                                                        <option>Month</option>
                                                                                        <option value="01">Jan (01)</option>
                                                                                        <option value="02">Feb (02)</option>
                                                                                        <option value="03">Mar (03)</option>
                                                                                        <option value="04">Apr (04)</option>
                                                                                        <option value="05">May (05)</option>
                                                                                        <option value="06">June (06)</option>
                                                                                        <option value="07">July (07)</option>
                                                                                        <option value="08">Aug (08)</option>
                                                                                        <option value="09">Sep (09)</option>
                                                                                        <option value="10">Oct (10)</option>
                                                                                        <option value="11">Nov (11)</option>
                                                                                        <option value="12">Dec (12)</option>
                                                                                    </select>
                                                                                </div>
                                                                                <div class="col-xs-3">
                                                                                    <select class="form-control" data-stripe="exp-year" id="card-exp-year">
                                                                                        <option value="2016">2016</option>
                                                                                        <option value="2017">2017</option>
                                                                                        <option value="2018">2018</option>
                                                                                        <option value="2019">2019</option>
                                                                                        <option value="2020">2020</option>
                                                                                        <option value="2021">2021</option>
                                                                                        <option value="2022">2022</option>
                                                                                        <option value="2023">2023</option>
                                                                                        <option value="2024">2024</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-3 control-label" for="cvv">Card CVC</label>
                                                                        <div class="col-sm-3">
                                                                            <input type="text" class="form-control" stripe-data="cvc" id="card-cvc" placeholder="Security Code">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <div class="col-sm-offset-3 col-sm-9">
                                                                        </div>
                                                                    </div>
                                                            </fieldset>
                                                            <button type="submit" class="btn btn-success btn-lg" style="width:100%;">Pay Now
                                                            </button>
                                                            <br/>
                                                            <div style="text-align: left;">
                                                                <br/> By submiting this order you are agreeing to our <a href="/legal/billing/">universal
                                                billing agreement</a>, and <a href="/legal/terms/">terms of service</a>. If you have any questions about our products or services please contact us before placing this order.
                                                            </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                </body>

                </html>