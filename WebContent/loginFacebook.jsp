<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix="c" %>

   <%
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    %>


<!DOCTYPE html>

<html>
<head>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>
<body>

<div id="paypal-button-container" style="
    display: table;
    margin: 0 auto;
"></div>

    <!-- Include the PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=AZTN0LvIsUc_0ySlt6qv5_8Lpx7k1_svmMkOolWy6MjhG18SVZRHA2abulStkqUpcBFrNcxVt3TfJKEV&currency=USD"></script>

 <script type="text/javascript">
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
                             </script>
<div id="buttons">
	
	<h2>Buttons</h2>
	
	<div>
		<button type="button" id="share-button">Share</button>

	</div>

</div>


<div id="status"></div>

<div id="login-buttons">
	
	<h3>Custom Login Button</h3>
	
<div class="fb-login-button" scope="email"  data-size="large" data-button-type="continue_with" data-auto-logout-link="false" data-use-continue-as="false"></div>

</div>


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
		    	FB.api('/me',{fields: 'email'}, function(response) {
		    	      console.log(response);
		    	      document.getElementById('status').innerHTML =
		    	        'Thanks for logging in, ' + response.email + ' !';
		    	      
		    	    });
		    	    
		 
      		}
		    else {
      		// The person is not logged into your app or we are unable to tell.
      			document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';

    		}
  
		}
	
	  window.fbAsyncInit = function() {
			
		    FB.init({
		        appId      : '246262486285203',
		        cookie     : true,  // enable cookies to allow the server to access 
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
		      statusChangeCallback(response);
		    });
		  
		  
		    }
	  
	document.getElementById('share-button').addEventListener('click', function (){
		
		FB.ui({
			  method: 'share',
			  href: 'www.google.it',
			}, function(response){
				
				console.log(response);
			});
		
	});
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
  
</body>
</html>