function dimension(form){
	document.getElementById("frm:dimensionwidth").value= screen.width;
	document.getElementById("frm:dimensionheight").value= screen.height;
}

function submitOnEnter(evt){ 
	
	if(!evt) evt = event; 
	
	if( evt.keyCode==13 ){ 
		var eventSrc = null; 
		if(!evt.target) eventSrc = evt.srcElement; 
		else eventSrc = evt.target; 
			
		var formElements = eventSrc.form.elements; 
		
		for( var i=0;i<=formElements.length;i+=1){ 
			
			var formElement = formElements[i]; 
			
			if(formElement.type != null && formElement.type.toLowerCase() == 'submit'){ 
				formElement.click(); 
				break; 
			} 
		} 
	} 
} 