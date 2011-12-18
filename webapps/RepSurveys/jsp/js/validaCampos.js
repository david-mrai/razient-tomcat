/**************************************************************
*  Powered by MCM Software Solution Inc. 
*  JEvolution(R)  v 1.4.0.0  
*  Copyright (c) 2002 MCM Software Solution Inc.
*  All Rights Reserved. 
***************************************************************/ 

	function validaCampo(input){
		if (input.value != null && input.value.length != 0) {
			if (!validaNumero(input)){
				input.focus();
				input.select();
				event.returnValue=false;
				return false;
			}
      		else {
	  			input.value = "" + eval(input.value);
	  			return true;
			}
    	}
   		else
   			{
       		alert("The mandatory fields must be filled");
			event.returnValue=false;
			return false;
    		}
  	}
  		
	function validaNumero(input){
  		var str = input.value;
  		for (var i = 0; i < str.length; i++) {
			var ch = str.substring(i, i + 1)
			if ( (ch < "0" || "9" < ch) && ch != "." && ch != "-" ) {
	  			var msg = input.name + " Invalid Number: " + input.value;
	  			alert(msg)
				return false;
			}
	  	}
  		if (input.value <= -999999999999999 && input.value >= 999999999999999){
    			alert("Value outside of the Range ");
				return false;
  		} 
  		else {
  			return true;
  		}
	}
		
	function validaEntrada(input){
  		if (input.value == null || input.value.length == 0 || input.value == " " ) {
			alert("The mandatory fields must be filled");
			event.returnValue=false;
			return false;
 		 }
  		else {
    			return true;
		}
	}


