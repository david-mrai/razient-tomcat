<html>
<%@ page language="java" import="com.mcmsoftware.project.beanLogins"%>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   
      <LINK rel="stylesheet" type="text/css" href="../CSSFiles/forms.css">
      <p align="Center"><b><font face="Arial" size="3" color="#000000">Add New Incident</font></b></p> 
      <SCRIPT LANGUAGE="JavaScript1.2" SRC="js/RegExpValidate.js" TYPE="text/javascript"> </SCRIPT><SCRIPT LANGUAGE="JavaScript1.2" SRC="js/fxValidate.js" TYPE="text/javascript"> </SCRIPT><SCRIPT LANGUAGE="JavaScript1.2" SRC="js/fxMaster.js" TYPE="text/javascript"> </SCRIPT><SCRIPT LANGUAGE='JavaScript1.2' SRC='js/110IN6dateNews.js' TYPE='text/javascript'> </SCRIPT><SCRIPT LANGUAGE='JavaScript1.2' SRC='js/110IN6datePosted.js' TYPE='text/javascript'> </SCRIPT><SCRIPT LANGUAGE="JavaScript1.2" SRC="js/jsrsClient.js" TYPE="text/javascript"> </SCRIPT><SCRIPT LANGUAGE="JavaScript1.2" SRC="js/fillDropBox.js" TYPE="text/javascript"> </SCRIPT>
      <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
      <script type="text/javascript" src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAAWZmPNs_5CjLun81gk1gCwRShUIEAFxXIMkid3zdqB3vfouK-ERT1v3CYZbxi_gTyPwSLJhqsy3EXfQ"></script>

        <script type="text/javascript">
            var mapa=null;
            var contador=1;
            var posicion=0;
            var geocoder;
            
            function inicializar() {
				// create map and add controls
				var map = new GMap2(document.getElementById("mapa"));
				map.addControl(new GLargeMapControl());        
				map.addControl(new GMapTypeControl());
				
				// set centre point of map
				var centrePoint = new GLatLng('0', '0');
				map.setCenter(centrePoint, 14);	
				
				// add a draggable marker
				var marker = new GMarker(centrePoint, {draggable: true});
				map.addOverlay(marker);
	
				// add a drag listener to the map
				GEvent.addListener(marker, "dragend", function() {
					var point = marker.getPoint();
					map.panTo(point);
					document.getElementById("latbox").value = point.lat();
					document.getElementById("lngbox").value = point.lng();
				});

            }
            
            function codeAddress(){ 
				var map = new GMap2(document.getElementById("mapa"));
				map.addControl(new GLargeMapControl());        
				map.addControl(new GMapTypeControl());
				
				var address = "";
				
            	var citytext = document.getElementById("inputTextCity").value;
				var countrytext = document.getElementById("inputTextCountry").value;
				var statetext = document.getElementById("inputTextState").value;
				var addresstext = document.getElementById("inputTextAddress").value;

				address = addresstext ;
				
				if(citytext!=null && citytext!="")
					address = address + ", "+ citytext;
					
				if(statetext!=null && statetext!="")
					address = address + ", "+ statetext;
					
				if(countrytext!=null && countrytext!="")
					address = address  + ", "+ countrytext;
				

				geocoder = new GClientGeocoder();
				
				geocoder.getLatLng(address, function(point) { 
					
					if (!point) {
						alert(address + " not found");
					} 
					else { 
						// set centre of map and add marker to centre of map and make it draggable
						map.setCenter(point, 14);
						var marker = new GMarker(point, {draggable: true});
						map.addOverlay(marker);

						document.getElementById("latbox").value = point.lat();
						document.getElementById("lngbox").value = point.lng();
						
						
						// add listener to marker
						GEvent.addListener(marker, "dragend", function() {
						var point = marker.getPoint();
						map.panTo(point);
						document.getElementById("latbox").value = point.lat();
						document.getElementById("lngbox").value = point.lng();
						
					});
					}
				});

            }

        </script>
      <script language="LiveScript">
         function uploadDropBoxes(){		
	     
             i = getFieldPosition(document.forma,'newssource');
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 4, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='1101109brf'; 
             params[1][0]='Function';
             params[1][1]='XBRFResolver';
             params[2][0]='NameXSL';	
             params[2][1]='null';		
             params[3][0]='DropBoxOption';
             params[3][1]='Yes';
             fillDropBox('',document.forma[i],'<%=request.getContextPath()%>/LogicServerAppServlet',params);
             i = getFieldPosition(document.forma,'country');
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 4, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='1101104brf'; 
             params[1][0]='Function';
             params[1][1]='XBRFResolver';
             params[2][0]='NameXSL';	
             params[2][1]='null';		
             params[3][0]='DropBoxOption';
             params[3][1]='Yes';
             fillDropBox('',document.forma[i],'<%=request.getContextPath()%>/LogicServerAppServlet',params);
             i = getFieldPosition(document.forma,'type');
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 4, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='1101101brf'; 
             params[1][0]='Function';
             params[1][1]='XBRFResolver';
             params[2][0]='NameXSL';	
             params[2][1]='null';		
             params[3][0]='DropBoxOption';
             params[3][1]='Yes';
             fillDropBox('',document.forma[i],'<%=request.getContextPath()%>/LogicServerAppServlet',params);
         }
      </script>
      
      <script language="LiveScript">
         function fillstate(){			
		
		 i = getFieldPosition(document.forma,'state');
		 document.forma[i].selectedIndex = 0
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 5, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='1101108brf';
             params[1][0]='Function';
             params[1][1]='XBRFResolver';
             params[2][0]='NameXSL';
             params[2][1]='null';
		 
		 j = getFieldPosition(document.forma,'country');
		 params[3][0]='@country';
	       params[3][1]=document.forma[j].value;
		 
             params[4][0]='DropBoxOption';
             params[4][1]='Yes';
		 i = getFieldPosition(document.forma,'state');
             fillDropBox('',document.forma[i],'<%=request.getContextPath()%>/LogicServerAppServlet',params);
         }
	</script>
      <script language="JavaScript1.2">
          function GoBack(){
              history.back();
          }
          
          function fxCheckForm(form) {
             var toReturn = true;
             var temp = false;
             
             if(toReturn == true){
               temp = fxMaster(form.userPosted,'TX',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.newssource,'IS',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.title,'TX',true,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.url,'TX',true,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.description,'TX',true,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.country,'IS',true,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.state,'IS',true,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.city,'TX',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.address,'TX',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.type,'IS',true,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.riskLevel,'IS',true,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.numberkilled,'TI',false,true,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.dateNews,'TX',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.datePosted,'TX',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.timePosted,'TX',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             

             if(toReturn == true){
			temp = fxMaster(form.submit,'fxIN');
                  toReturn = temp;
             }

             return toReturn;
          }
      </script>
      </head>
   <body bgcolor="#FFFFFF" background="" onload="uploadDropBoxes();forma.reset();inicializar();">
	<%beanLogins beanSesion = (beanLogins)session.getAttribute("User");%>
	
      <center>
         <form action="<%=request.getContextPath()%>/LogicServerAppServlet" name="forma" method="POST" onSubmit="return fxCheckForm(forma)">
            <input type="hidden" name="requiredServlet" value="servlet110IN6">
			
             <div id="mapa" style="width: 670px; height: 250px;"></div>
			 
			 <br/>
            <table cellspacing="0" cellpadding="0" class="frmtable">
			
               <tr>
                  <td></td>
                  <td><font>User Posted</font></td>
                  <td align="" class="frmtdvalue">
				<%	String cx1__razient__reportnewsusers__user = beanSesion.getVariablesSesion("cx1__razient__reportnewsusers__user"); 
					if (cx1__razient__reportnewsusers__user==null)
						cx1__razient__reportnewsusers__user = (String)session.getAttribute("cx1__razient__reportnewsusers__user");
				%>
				<input name="userPosted" type="text" size="100" maxlength="" readonly="" value="<%= cx1__razient__reportnewsusers__user %>" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');"></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td></td>
                  <td><font>Source</font></td>
                  <td align="" class="frmtdvalue"><select name="newssource" size="1" onChange="fxMaster(this,'IS',false,false,'0','0','0','0',false,'');">
                        <option value=""></option></select></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                  <td><font>Title</font></td>
                  <td align="" class="frmtdvalue"><textarea name="title" cols="63" rows="2" onChange="fxMaster(this,'TX',true,false,'0','0','0','0',false,'');"> </textarea></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                  <td><font>URL</font></td>
                  <td align="" class="frmtdvalue"><textarea name="url" cols="63" rows="2" onChange="fxMaster(this,'TX',true,false,'0','0','0','0',false,'');"> </textarea></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                  <td><font>Description</font></td>
                  <td align="" class="frmtdvalue"><textarea name="description" cols="63" rows="4" onChange="fxMaster(this,'TX',true,false,'0','0','0','0',false,'');"> </textarea></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                  <td><font>Country</font></td>
                  <td align="" class="frmtdvalue"><select name="country" id="inputTextCountry" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');fillstate();">
                        <option value=""></option></select></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                  <td><font>State</font></td>
                  <td align="" class="frmtdvalue"><select name="state" id="inputTextState" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');">
                        <option value=""></option></select></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td></td>
                  <td><font>City</font></td>
                  <td align="" class="frmtdvalue"><input name="city" type="text" id="inputTextCity" size="100" maxlength="" value="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');"></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td></td>
                  <td><font>Address</font></td>
                  <td align="" class="frmtdvalue"><input name="address" id="inputTextAddress"  type="text" size="100" maxlength="" value="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');"></td>
                  <td></td>
                  <td> <input type="button" onclick="javascript:codeAddress();" id="inputButtonGeocode" style="width:100px" title="Click to Geocode" value="Geocode" /></td>
               </tr>
			   <tr>
				 <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2"> </font></td>
				 <td><font>Latitude</font></td>
				 <td align="" class="frmtdvalue"><input id="latbox" name="lat" type="text" size="14" maxlength="" value="0" ></td>
				 <td></td>
				 <td></td>
			  </tr>
			  <tr>
				 <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2"> </font></td>
				 <td><font>Longitude</font></td>
				 <td align="" class="frmtdvalue"><input id="lngbox" name="lng" type="text" size="14" maxlength="" value="0"  ></td>
				 <td></td>
				 <td></td>
			  </tr>
               <tr>
                  <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                  <td><font>Incident Type</font></td>
                  <td align="" class="frmtdvalue"><select name="type" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');">
                        <option value=""></option></select></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                  <td><font>Risk Level</font></td>
                  <td align="" class="frmtdvalue"><select name="riskLevel" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');">
                        <option selected="yes" value="">------------------------- </option>
                        <option value="Critical">Critical </option>
                        <option value="High">High </option>
                        <option value="Medium">Medium </option>
                        <option value="Low">Low </option></select></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td></td>
                  <td><font>Number Killed</font></td>
                  <td align="" class="frmtdvalue"><input name="numberkilled" type="text" size="10" maxlength="" value="" onChange="fxMaster(this,'TI',false,true,'0','0','0','0',false,'');"></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td></td>
                  <td><font>News Date</font></td>
                  <td align="" class="frmtdvalue"><input name="dateNews" type="text" size="10" maxlength="" readonly="" value="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');"></td>
                  <td></td>
                  <td><input type="button" value=".." onClick="newWindowdateNews();"></td>
               </tr>
               <tr>
                  <td></td>
                  <td><font>Date Posted</font></td>
                  <td align="" class="frmtdvalue"><input name="datePosted" type="text" size="10" maxlength="" readonly="" value="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');"></td>
                  <td></td>
                  <td><input type="button" value=".." onClick="newWindowdatePosted();"></td>
               </tr>
               <tr>
                  <td></td>
                  <td><font>Time Posted</font></td>
                  <td align="" class="frmtdvalue"><input name="timePosted" type="text" size="100" maxlength="" value="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');"></td>
                  <td></td>
                  <td></td>
               </tr>
            </table><br><table>
               <tr>
                  <td><input type="SUBMIT" value="Submit"></td>
                  <td></td>
                  <td></td>
                  			
                  <td><input type="RESET" value="Reset"></td>
               </tr>
            </table>
				 
           
           
            
			
         </form><br></center>
   </body>
</html>