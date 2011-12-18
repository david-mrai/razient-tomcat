/************************************************
*  Powered by MCM Software Solution Inc.
*  JEvolution(R)  v 1.4.0.0  
*  Copyright (c) 2002 MCM Software Solution Inc.
*  All Rights Reserved. 
*************************************************/ 

   function validaForma(forma) {
     for(i=0; i<document.forma.length; i++){
       if (document.forma[i].onblur != null){
		   var varForm = "h" + document.forma[i].name.substring(1);
		   var flag = true;
		   for(j=0; j<document.forma.length && flag; j++){
			   if (document.forma[j].name == varForm){
		           var type = document.forma[j].value;
		           flag = false;
		       }
		   }
		   if (type == "Entrada"){
				validaEntrada(document.forma[i]);
			} 
		   if (type == "Campo"){
			   validaCampo(document.forma[i]);
		    }
       return;
       }   
     }
   }