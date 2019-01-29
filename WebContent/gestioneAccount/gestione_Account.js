/**
 * 
 */

function chiediDisponibilitaEmail() {
	var stringa_email = $('#emailID').val();
	$.ajax({ type: "POST",
       		 url: "../controlloStatoEmail",
       		 data: {id_email : stringa_email},
       		 datatype:"json",
       		 success: function(data){ 
       			       var d=JSON.parse(data);

       			 		if(d.disponibile==true){
       			 			$("#stato_email").html("<span style=\"color:green;\" class=\"glyphicon glyphicon-ok\">Disponibile</span> ");
       			 			return true;
       			 		}
       			 		else if (d.disponibile==false){ 
       			 			$("#stato_email").html("<span style=\"color:red;\" class=\"glyphicon glyphicon-alert\">Non disponibile</span> ");
       			 			$("#emailID").val("");
       			 			return false;
       			 		}
       		 		},
			
       		 error: function(){
       			 	alert(stringa_email+"Chiamata fallita!!!");
       		 		} 
	
		});
	}


function confrontaPasswords(){
	
	var right=$("#pass1").val();
	var left=$("#pass2").val();
	
	
	if(left=="")
	
		$("#confronto_passwords").html("");
	
	else{
		

		if(right==left){
			$("#confronto_passwords").html("<span style=\"color:green;\" class=\"glyphicon glyphicon-ok\"></span>");
			return true;
		}
		
		else{
				$("#confronto_passwords").html("<span style=\"color:red;\" class=\"glyphicon glyphicon-alert\"></span> Le password non combaciano");
				return false;
		}
	}
}



function preparaDati(event){
	
	// conversione dei dati immessi nel form, in una variabile var o, in formato JSON
	var o = {};
    var a = $('form#moduloRegistrazione').serializeArray();
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
    
    $.ajax({
		type: "POST",
		url: "../iscriviCliente",
		data: JSON.stringify(o),
		datatype:"json",
		async:false,
		success: function (data){
	    
			var d=JSON.parse(data); 

	    	if(d.controllo==true){
	    		alert("ok");
	    		//console.log(data);
	    	}
		},
		error: function (){
			
			alert("Ci sono errori nell'iscrizione");
		},
		complete: function(){
			
    		window.open("http://localhost:8080/E-commerce/gestioneAccount/iscrizioneEffettuata.jsp");

		}
	});
 
    	return false;
}
    
	
    
    /* Object
        email: "value"
        name: "value"
        password: "value"
     */
    
    
    function preparaLogin(){

    	
    	// conversione dei dati immessi nel form, in una variabile var o, in formato JSON
    	var o = {};
        var a = $('form#moduloAccesso').serializeArray();
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
        
        $.ajax({
    		type: "POST",  
    		url: "../inviaCredenziali",
    		async:false,
    		data: JSON.stringify(o),
    		datatype:"json",
    	    success: function(data) {
    	    	
    	    	var d=JSON.parse(data); 
    	    	
    	    	if(d.descrizione == "loginOk"){
    	    		
    	    		alert("Accesso effettuato")
    	    	}
    	    		
    	    	
    	    	else if( d.descrizione == "password_errata" ){
    	    			alert("Password errata");

    	    		}
    	    },
    	    
    	    error: function(){
    	    	
    	    	alert("OK");
    	    }

    	});
     
    	
    	
    
   
    }