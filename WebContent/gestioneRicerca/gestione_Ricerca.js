/**
 * 
 */

function ricercaLive() {
	var stringaRicerca = $('#spazio-ricerca').val();
	$("div.container_suggerimenti").css("display", "none");
	$("#lista-suggerimenti").empty();
	


if(stringaRicerca.length>=2){

	$.ajax({ type: "POST",
		
       		 url: "/E-commerce/RicercaProdotto",
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
       			        list +="<li > <a id=\"suggerimento\" onclick=myFunction($(this).text()) >"+results[i]+" </a> </li>";
       			        }

           			    $("#lista-suggerimenti").append(list);
       		 		},
			
       		 error: function(){
       			 	alert("Non ci siamo");
       		 		} 
	
		});
	}

}



function myFunction(t) {

		    $("#spazio-ricerca").val(t);


}
