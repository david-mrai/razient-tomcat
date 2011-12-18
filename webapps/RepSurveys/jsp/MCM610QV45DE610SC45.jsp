<%@page language="java" errorPage="error.jsp" %>
<html>
   <head>
      <LINK rel="stylesheet" type="text/css" href="../CSSFiles/forms.css"/>
     		<SCRIPT LANGUAGE='JavaScript1.2' SRC='js/contractExtendFrame.js' TYPE='text/javascript'></SCRIPT>
     		
     <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/RegExpValidate.js' TYPE='text/javascript'></SCRIPT>
     <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fxValidate.js'     TYPE='text/javascript'></SCRIPT>
     <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fxMaster.js'       TYPE='text/javascript'></SCRIPT>
     
     <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/jsrsClient.js'  TYPE='text/javascript'></SCRIPT>
     <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fillDropBox.js' TYPE='text/javascript'></SCRIPT>
     
      <script language="LiveScript">
         function uploadDropBoxes(){		
	     
             i = getFieldPosition(document.forma,'@idSurvey');
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 4, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='61061055brf'; 
             params[1][0]='Function';
             params[1][1]='XBRFResolver';
             params[2][0]='NameXSL';	
             params[2][1]='null';		
             params[3][0]='DropBoxOption';
             params[3][1]='Yes';
             fillDropBox('',document.forma[i],'<%=request.getContextPath()%>/LogicServerAppServlet',params);
         }
      </script>
   
      
   
      <script language="JavaScript1.2">
          var active = false;
 	    var hrefValue;

          function GoBack(){
              history.back();
          }
          
          function fxCheckForm(form) {
             var toReturn = true;
             var temp = false;
                            
               if(toReturn == true){
                  i = getFieldPosition(form,'@idSurvey');
                  temp = fxMaster(form[i],'IS',true,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                            
             return toReturn;
          }
	                    
   		function fxAsignidSurvey(){
			var i = getFieldPosition(document.forma,'@idSurvey');
			var j = getFieldPosition(document.formaXLS,'@idSurvey');
			document.formaXLS[j].value = 	document.forma[i].value;
             }
	                         
   		function fxAsigncxRaz__razient__customersurveys__idcustomerSurveys(){
			var i = getFieldPosition(document.forma,'@cxRaz__razient__customersurveys__idcustomerSurveys');
			var j = getFieldPosition(document.formaXLS,'@cxRaz__razient__customersurveys__idcustomerSurveys');
			document.formaXLS[j].value = 	document.forma[i].value;
             }
	          
		function fxEnable(){
			      
			fxAsignidSurvey();
         
			fxAsigncxRaz__razient__customersurveys__idcustomerSurveys();
   

			return active;
		}	

      </script>
   
   </head>
   <body bgcolor="#FFFFFF" background="" onload="uploadDropBoxes()">
      <table cellspacing="0" cellpadding="0">
         <tr>
            <td><img src="images/extend.jpg" onClick="extend_Contract(136)" /></td>
         </tr>
      </table>
      <center>
         <table cellspacing="0" cellpadding="0">
            <tr>
               <td>
                  <p align="Center">
                     <b>
                        <font face="Arial" size="3" color="#000000">Survey Answers</font>
                     </b>
                  </p>
               </td>
               <td>&nbsp;&nbsp;</td>
               <td>
                  <form action="<%=request.getContextPath()%>/LogicServerAppServlet" name="formaXLS" method="POST" target="_blank" onSubmit="return fxEnable()">
      
                     <INPUT type="hidden" name="sourceXBRF" value="61061056brf"/>
      
                     <INPUT type="hidden" name="Function" value="EXCELFORMAT"/>
      
                     <INPUT type="hidden" name="NameXLS" value="610QV45XLS"/>
                     <INPUT type="hidden" name="@idSurvey" value=""/>
      
                     <INPUT type="hidden" name="fields" value="@idSurvey"/><a href="#blank" onClick="javascript:if(fxEnable()){document.forms.formaXLS.submit()}else return false;"><img BORDER="0" src="images/excel.jpg" width="16" height="16" ALT="EXCEL"></a></form>
               </td>
            </tr>
         </table>
         <form action="<%=request.getContextPath()%>/LogicServerAppServlet" name="forma" method="POST" target="ResultDataEntry" onSubmit="javascript:if(fxCheckForm(forma)){active=true; return true;}else return false;">
      
            <INPUT type="hidden" name="sourceXBRF" value="61061056brf"/>
      
            <INPUT type="hidden" name="Function" value="XBRFResolver"/>
      
            <INPUT type="hidden" name="NameXSL" value="610QV45"/>
      
            <INPUT type="hidden" name="NameBODY" value="610QV45"/>
      
            <INPUT type="hidden" name="Graphics" value=""/>
      
            <table cellspacing="0" cellpadding="0">
               <tr>
                  <td>
                     <table cellspacing="1" cellpadding="1" class="frmtable"><tr><td>
                           <font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font>
                        </td>
                        <td align="Right">
                           <font face="Arial" color="#000000" size="2">Surveys</font>
                        </td>
                        <td class="frmtdvalue">
                           <select name="@idSurvey" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');">
                              <option value=""/>
                           </select>
                        </td></tr></table>
                  </td>
                  <td>
                     <table cellspacing="0" cellpadding="0">
                        <tr/>
                     </table>
                  </td>
               </tr>
               <tr>
                  <td align="center">
                     <table cellspacing="0" cellpadding="0" width="90%">
                        <tr>
                           <td align="Center">
                              <input type="submit" value="Ok"/>
                           </td>
                           <td align="Center">
                              <input type="reset" value="Cancel"/>
                           </td>
                        </tr>
                     </table>
                  </td>
               </tr>
            </table>
         </form>
      </center>
   </body>
</html>