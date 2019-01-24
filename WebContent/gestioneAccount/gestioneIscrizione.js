/**
 * 
 */

function chiediDisponibilitaEmail() {
	var stringa_email = $('#email').val();
	$.ajax({ type: "POST",
       		 url: "../controlloStatoEmail",
       		 data: {id_email : stringa_email},
       		 success: function(data){ 
       			 		var d=data;
       			       alert(d);


       			 		if($d.val()==true)
       			 			$("#stato_email").html("<span style=\"color:green;\" class=\"glyphicon glyphicon-ok\"></span> Disponibile");
       			 		
       			 		else if ($d.val()==false){ 
       			 			$("#stato_email").html("<span style=\"color:red;\" class=\"glyphicon glyphicon-alert\"></span> Non disponibile");
       			 			$("#email").val("");
       			 		}
       		 		},
			
       		 error: function(){
       			 	alert(stringa_email+"Chiamata fallita!!!");
       		 		} 
	
		});
	}
