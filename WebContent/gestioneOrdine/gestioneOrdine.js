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
                                      return actions.order.create({
                                      	  "intent": "CAPTURE",
                                      	  "application_context": {
                                      	    "return_url": "https://example.com",
                                      	    "cancel_url": "https://example.com",
                                      	    "brand_name": "BYMP",
                                      	    
                                      	    "landing_page": "BILLING",
                                      	    "shipping_preference": "SET_PROVIDED_ADDRESS",
                                      	    "user_action": "CONTINUE"
                                      	  },
                                      	  "purchase_units": [
                                      	    {
                            
                                      	      "amount": {
                                      	        "currency_code": "USD",
                                      	        "value": "230.00",
                                      	        "breakdown": {
                                      	          "item_total": {
                                      	            "currency_code": "USD",
                                      	            "value": "180.00"
                                      	          },
                                      	          "shipping": {
                                      	            "currency_code": "USD",
                                      	            "value": "30.00"
                                      	          },
                                      	          "handling": {
                                      	            "currency_code": "USD",
                                      	            "value": "10.00"
                                      	          },
                                      	          "tax_total": {
                                      	            "currency_code": "USD",
                                      	            "value": "20.00"
                                      	          },
                                      	          "shipping_discount": {
                                      	            "currency_code": "USD",
                                      	            "value": "10"
                                      	          }
                                      	        }
                                      	      },
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
                                      	      ],
                                      	      "shipping": {
                                      	        "method": "United States Postal Service",
                                      	        "address": {
                                      	          "name": {
                                      	            "give_name":"John",
                                      	            "surname":"Doe"
                                      	          },
                                      	          "address_line_1": "123 Townsend St",
                                      	          "address_line_2": "Floor 6",
                                      	          "admin_area_2": "San Francisco",
                                      	          "admin_area_1": "CA",
                                      	          "postal_code": "94107",
                                      	          "country_code": "US"
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
                 	
                                     