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
                                             


                                                 $('#griglia-indirizzo-scelto').append(' <div id=\"spazio-indirizzo\" class=\"col-md-4 col-sm-6 \"> <div class=\" thumbnail\" > <div class=\"displayAddressDiv\" style=\"height: 155px; white-space:normal; overflow: hidden; text-overflow: ellipsis\"> <ul style=\"list-style-type: none; padding-inline-start: 10px;\"> <li><b>'+indScelto.nomeDestinatario+' '+indScelto.cognomeDestinatario+'</b></li> <li> '+indScelto.stato+',</li> <li> '+indScelto.citta+' '+indScelto.codicePostale+',</li> <li> '+indScelto.via+' '+indScelto.numeroCivico+',</li> <li> Indicazioni: '+indScelto.dettagli+'.</li> </ul> </div>  </div>\r\n\r\n </div>');

                                         }

                                         

                                     })
                              }
                              
                              
                              function mostraScelta(){
                              	
                          		$('#panel-body-scelto').css("display","block");

                              }
                              
                              
                 	
                                     