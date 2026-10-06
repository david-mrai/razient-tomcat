<html><%@ page language="java" 
   	import="java.text.SimpleDateFormat,java.sql.*,java.math.*,
   	com.mcmsoftware.jevolution.logicserver.process.*,com.mcmsoftware.jevolution.logicserver.basics.*,
   	com.mcmsoftware.jevolution.logicserver.jpool.*,com.mcmsoftware.jevolution.logicserver.transform.*,
   com.mcmsoftware.project.beanLogins,
   com.mcmsoftware.project.bean110UD11" %><%@ taglib uri="http://jakarta.apache.org/taglibs/datetime-1.0" prefix="dt"%><%
   	String strRVar;		
   	
   	  String userPosted = "";
     String newssource = "";
     String title = "";
     String url = "";
     String description = "";
     String address = "";
     String country = "";
     String state = "";
     String city = "";
     Double latitude = null;
     Double longitude = null;
     String type = "";
     String riskLevel = "";
     long numberkilled = 0;
     Date dateNews = null;
     Date datePosted = null;
     String timePosted = "";
     long wh_idrazienGlobalIncident = 0;
   
   			strRVar = request.getParameter("@incidentid");
   		
   			if(strRVar != null){
   	wh_idrazienGlobalIncident=Long.parseLong(strRVar); 
   		
   			}
   
   	Connection con;
   	String strUser = null;
   	String strPassword = null;
   	String strTypeLogin = null;
   			
   				beanLogins beanSesion = null;
   			
   	String strApplicationName = request.getContextPath().substring(1);	
   	PoolManager poolMan = LogicServerServlet.getPoolManagerInstance(request,strApplicationName);
   
   	HttpSession sesion = request.getSession();
   				strTypeLogin = (String)sesion.getAttribute("typeLogin");
   				
   				if(strTypeLogin != null){
   						
   							beanSesion 	= (beanLogins)sesion.getAttribute("User");
   							strUser 	= (String)beanSesion.getUser();
   							strPassword = (String)beanSesion.getPassword();
   						
   				}
   				else
   					strTypeLogin = "SinLogin";
   	
   	if (strTypeLogin.equals("DB"))
   					con = poolMan.getConnection(strUser,strPassword,"cx1");
   				else
   					con = poolMan.getConnection("cx1");
   	
   	SimpleDateFormat simpleFormat;	
   	bean110UD11	bean;
   	if(con!=null){
   		bean= new bean110UD11();
   			
   			bean.setwh_idrazienGlobalIncident(wh_idrazienGlobalIncident);
   		
   		bean.serviceSelect(con);
   		userPosted=bean.getuserPosted();
   		newssource=bean.getnewssource();
   		title=bean.gettitle();
   		description=bean.getdescription();
   		url=bean.geturl();
   		address=bean.getaddress();
   		country=bean.getcountry();
   		city=bean.getcity();
   		state=bean.getstate();
   		latitude=bean.getlatitude();
   		longitude=bean.getlongitude();
   		dateNews=bean.getdateNews();
   		datePosted=bean.getdatePosted();
   		numberkilled=bean.getnumberkilled();
   		riskLevel=bean.getriskLevel();
   		timePosted=bean.gettimePosted();
   		type=bean.gettype();
   		
   	}
   	if (strTypeLogin.equals("DB"))
   		poolMan.freeConnection("cx1",con,strUser);
   	else
   		poolMan.freeConnection("cx1",con);
   	
   	poolMan=null;
   	con=null;
   	bean=null;
   %>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   
      <LINK rel="stylesheet" type="text/css" href="../CSSFiles/forms.css"><script src="js/RegExpValidate.js" type="text/javascript"> </script><script src="js/fxValidate.js" type="text/javascript"> </script><script src="js/fxMaster.js" type="text/javascript"> </script><script src='js/110UD11dateNews.js' type='text/javascript'></script><script src='js/110UD11datePosted.js' type='text/javascript'></script><script src="js/jsrsClient.js" type="text/javascript"> </script><script src="js/fillDropBox.js" type="text/javascript"> </script><script type="text/javascript">
			function uploadDropBoxes(){		
			
				i = getFieldPosition(document.forma,'country');
				document.forma[i].options[0].text="loading..."
				dimension ('params', 4, 2);
				params[0][0]='sourceXBRF';
				params[0][1]='1101104brf'; 
				params[1][0]='Function';
				params[1][1]='XBRFResolver';
				params[2][0]='NameXSL';	
				params[2][1]='null';		
				params[3][0]='DropBoxOption';
				params[3][1]='Yes';	   	   
				fillDropBox( document.forma.Hcountry.value,document.forma.country,'<%=request.getContextPath()%>/LogicServerAppServlet',params);
		 			fillstate()
					 
				i = getFieldPosition(document.forma,'type');
				document.forma[i].options[0].text="loading..."
				dimension ('params', 4, 2);
				params[0][0]='sourceXBRF';
				params[0][1]='1101101brf'; 
				params[1][0]='Function';
				params[1][1]='XBRFResolver';
				params[2][0]='NameXSL';	
				params[2][1]='null';		
				params[3][0]='DropBoxOption';
				params[3][1]='Yes';	   	   
				fillDropBox( document.forma.Htype.value,document.forma.type,'<%=request.getContextPath()%>/LogicServerAppServlet',params);
			}
		</script><script src="js/jsrsClient.js" type="text/javascript"> </script><script src="js/fillDropBox.js" type="text/javascript"> </script>
      <script language="LiveScript">
         function fillstate(){		
		
		 i = getFieldPosition(document.forma,'state');
		 document.forma[i].options[document.forma[i].selectedIndex].text="loading..."

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
             fillDropBox(document.forma.Hstate.value,document.forma[i],'<%=request.getContextPath()%>/LogicServerAppServlet',params);
         }
	</script>
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
				var centrePoint = new GLatLng('<%= latitude %>', '<%= longitude %>');
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
      <script type="text/javascript">
			var actionDel = false;

			function deleteAction(){
				actionDel = true;
			}
			
			function GoBack(){
				history.back();	
			}
				
			
          function fxCheckForm(form) {
             var toReturn = true;
             var temp = false;

             if( !actionDel ){
                 
             if(toReturn == true){
               temp = fxMaster(form.userPosted,'TX',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.newssource,'TX',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.title,'TX',true,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.url,'TX',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.description,'TX',true,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.address,'TX',false,false,'0','0','0','0',false,'');
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
               temp = fxMaster(form.latitude,'TN',false,true,'0','0','0','6',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.longitude,'TN',false,true,'0','0','0','6',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.type,'IS',true,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.riskLevel,'IS',false,false,'0','0','0','0',false,'');
               if(temp == false)
                  toReturn = temp;
             }
             
             if(toReturn == true){
               temp = fxMaster(form.numberkilled,'TX',false,false,'0','0','0','0',false,'');
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
			temp = fxMaster(form.submit,'fxUP',false,false,'0','0','0','0',false,'');
                  toReturn = temp;
             }
		 }//end if actionDel
		 else
		   if(toReturn == true){
			temp = fxMaster(form.submit,'fxDL',false,false,'0','0','0','0',false,'');
			actionDel = false;
			toReturn = temp;
             }
             return toReturn;
          }
      </script></head>
   <body bgcolor="#FFFFFF"" onload = "uploadDropBoxes();inicializar();">
   	<table cellspacing="0" cellpadding="0"><tr><td><img src="images/historyback.jpg" onClick="history.go(-1)" /></td></tr></table>
	
	
	<table cellspacing="0" cellpadding="0" align="center"><tr><td>
   <p align="Center"><b><font size="3" color="#000000" face="Arial">Update Global Incident</font></b></p></td></tr></table><br/><center>
   	<form action="<%= request.getContextPath() %>/LogicServerAppServlet" method="POST" name="forma" onsubmit="return fxCheckForm(forma)">
	
	<div id="mapa" style="width: 670px; height: 250px;"></div>
			 
	 <br/>
			 

   	<input type="hidden" name="requiredServlet" value="servlet110UD11"><table cellspacing="0" cellpadding="0" class="frmtable">
      <tr>
         <td></td>
         <td><font>User Posted</font></td>
         <td align="" class="frmtdvalue"><input name="userPosted" type="text" size="100" maxlength="" readonly="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');" value="<%= userPosted %>"></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td><font>News Source</font></td>
         <td align="" class="frmtdvalue"><input name="newssource" type="text" size="100" maxlength="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');" value="<%= newssource %>"></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
         <td><font>Title</font></td>
         <td align="" class="frmtdvalue"><textarea name="title" wrap="on" cols="" rows="2" onChange="fxMaster(this,'TX',true,false,'0','0','0','0',false,'');"> <%= title%></textarea></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td><font>URL</font></td>
         <td align="" class="frmtdvalue"><textarea name="url" wrap="on" cols="63" rows="2" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');"> <%= url%></textarea></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
         <td><font>Description</font></td>
         <td align="" class="frmtdvalue"><textarea name="description" wrap="on" cols="63" rows="4" onChange="fxMaster(this,'TX',true,false,'0','0','0','0',false,'');"> <%= description%></textarea></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td><font>Address</font></td>
         <td align="" class="frmtdvalue"><input name="address" id="inputTextAddress" type="text" size="100" maxlength="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');" value="<%= address %>"></td>
         <td></td>
         <td> <input type="button" onclick="javascript:codeAddress();" id="inputButtonGeocode" style="width:100px" title="Click to Geocode" value="Geocode" /></td>
      </tr>
	   
      <tr>
         <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
         <td><font>Country</font></td>
         <td align="" class="frmtdvalue"><select name="country" id="inputTextCountry" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');fillstate();">
               <option value="<%= country %>"><%= country%></option></select><input type="hidden" name="Hcountry" value="<%= country %>"></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
         <td><font>State</font></td>
         <td align="" class="frmtdvalue"><select name="state" id="inputTextState" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');">
               <option value="<%= state %>"><%= state%></option></select><input type="hidden" name="Hstate" value="<%= state %>"></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td><font>City</font></td>
         <td align="" class="frmtdvalue"><input name="city" id="inputTextCity" type="text" size="100" maxlength="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');" value="<%= city %>"></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td><font>Latitude</font></td>
         <td align="" class="frmtdvalue"><input id="latbox" name="latitude" type="text" size="14" maxlength="" onChange="fxMaster(this,'TN',false,true,'0','0','0','6',true,'');" value="<%= latitude %>"></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td><font>Longitude</font></td>
         <td align="" class="frmtdvalue"><input id="lngbox" name="longitude" type="text" size="14" maxlength="" onChange="fxMaster(this,'TN',false,true,'0','0','0','6',true,'');" value="<%= longitude %>"></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
         <td><font>Type</font></td>
         <td align="" class="frmtdvalue"><select name="type" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');">
               <option value="<%= type %>"><%= type%></option></select><input type="hidden" name="Htype" value="<%= type %>"></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td><font>Risk Level</font></td>
         <td align="" class="frmtdvalue"><%boolean briskLevel = false; String strriskLevel = "" + riskLevel;%><select name="riskLevel" size="1" onChange="fxMaster(this,'IS',false,false,'0','0','0','0',false,'');"><option value = "" <%  if(strriskLevel.equals("")){ out.write("selected"); briskLevel = true;}%> > ---------------------- </option><option value = "Critical" <%  if(strriskLevel.equals("Critical")){ out.write("selected"); briskLevel = true;}%> > Critical </option><option value = "High" <%  if(strriskLevel.equals("High")){ out.write("selected"); briskLevel = true;}%> > High </option><option value = "Medium" <%  if(strriskLevel.equals("Medium")){ out.write("selected"); briskLevel = true;}%> > Medium </option><option value = "Low" <%  if(strriskLevel.equals("Low")){ out.write("selected"); briskLevel = true;}%> > Low </option><% if(!briskLevel){	out.write("<option value = '"+riskLevel+"' selected >"+riskLevel+" </option>");} %></select></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td><font>numberkilled</font></td>
         <td align="" class="frmtdvalue"><input name="numberkilled" type="text" size="10" maxlength="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');" value="<%= numberkilled %>"></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td></td>
         <td><font>News Date</font></td>
         <td align="" class="frmtdvalue"><input name="dateNews" type="text" size="10" maxlength="" readonly="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');" value="<dt:format pattern="yyyy-MM-dd" date="<%= dateNews %>"></dt:format>"></td>
         <td></td>
         <td><input type="button" value=".." onClick="newWindowdateNews();"></td>
      </tr>
      <tr>
         <td></td>
         <td><font>Date Posted</font></td>
         <td align="" class="frmtdvalue"><input name="datePosted" type="text" size="10" maxlength="" readonly="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');" value="<dt:format pattern="yyyy-MM-dd" date="<%= datePosted %>"></dt:format>"></td>
         <td></td>
         <td><input type="button" value=".." onClick="newWindowdatePosted();"></td>
      </tr>
      <tr>
         <td></td>
         <td><font>timePosted</font></td>
         <td align="" class="frmtdvalue"><input name="timePosted" type="text" size="100" maxlength="" onChange="fxMaster(this,'TX',false,false,'0','0','0','0',false,'');" value="<%= timePosted %>"></td>
         <td></td>
         <td></td>
      </tr>
   </table>
   <table xmlns:saxon="http://icl.com/saxon" width="70%">
      <tr>
         <td align="Center"><input type="submit" value="Update" name="update"></td>
         <td align="Center"><input type="submit" value="Delete" name="delete" onClick="deleteAction()"></td>
      </tr>
   </table><input type="hidden" name="wh_idrazienGlobalIncident" value="<%= wh_idrazienGlobalIncident%>">
   	</form>
   	</center><br xmlns:saxon="http://icl.com/saxon">
   	</body>
</html>