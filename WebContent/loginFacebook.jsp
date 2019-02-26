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