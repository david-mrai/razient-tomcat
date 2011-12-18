/**************************************************************
*  Powered by MCM Software Solution Inc. 
*  JEvolution(R)  v 2.0.0.0  
*  Copyright (c) 2007 MCM Software Solution Inc.
*  All Rights Reserved. 
***************************************************************/ 



/*********************************************************************************/
/**Metodo que realiza los pasos de contraccion y extension del frame para los QV.*/
/*********************************************************************************/
function extend_Contract(aField){
			var browser=navigator.appName;

			if (parent.indi_frame_qv == 1)
	  		{
	    			parent.indi_frame_qv = 0;
					window.parent.document.getElementById("frameqv").rows  = (aField+",*");
	 		 }
	  		else
	  		{
	   			parent.indi_frame_qv = 1;
				if ( browser=="Microsoft Internet Explorer" ) 
					window.parent.document.getElementById("frameqv").rows  = ("30,*");
				else
					window.parent.document.getElementById("frameqv").rows  = ("21,*");
			}
}

/*********************************************************************************/
