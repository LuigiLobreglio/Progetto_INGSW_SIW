/**
 * 
 */

function ricercaLive() {
	var stringaRicerca = $('#spazio-ricerca').val();
	$("div.container_suggerimenti").css("display", "none");
	$("#lista-suggerimenti").empty();

if(stringaRicerca.length>=2){
var context;

	if(location.pathname!="/E-commerce/index.jsp")
		
		context='../RicercaProdotto';
	else
		
		context="RicercaProdotto";
	

	$.ajax({ type: "POST",
		
       		 url: context,
       		 data: {liveKey : stringaRicerca, tipo : "live"},
       		 datatype:"json",
       		 success: function(data){ 
       			 
       			 		var results=JSON.parse(data);
       			 		
       			 		if(results.length==0)
       			 			$("div.container_suggerimenti").css("display", "none");
       			 		else
       			 		$("div.container_suggerimenti").css("display", "block");


       			        var list = "";
       			        for(i=0; i<results.length; i++){
       			        list +="<li id=\"eddai\"> <a id=\"suggerimento\" onclick=myFunction() >"+results[i]+" </a> </li>";
       			        }

           			    $("#lista-suggerimenti").append(list);
       		 		},
			
       		 error: function(){
       			 	alert("Non ci siamo");
       		 		} 
	
		});
	}

}



function myFunction() {
		   var t=$("#suggerimento").text();

		    $("#spazio-ricerca").val( t );


}
