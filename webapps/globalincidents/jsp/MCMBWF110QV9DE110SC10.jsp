
<html><%@page language="java" errorPage="error.jsp" %>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   
      <LINK rel="stylesheet" type="text/css" href="../CSSFiles/forms.css">
      		<SCRIPT LANGUAGE='JavaScript1.2' SRC='js/contractExtendFrame.js' TYPE='text/javascript'></SCRIPT>
      		
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/RegExpValidate.js' TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fxValidate.js'     TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fxMaster.js'       TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/110QV9fromdate.js' TYPE='text/javascript'></SCRIPT><SCRIPT LANGUAGE='JavaScript1.2' SRC='js/110QV9todate.js' TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/jsrsClient.js'  TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fillDropBox.js' TYPE='text/javascript'></SCRIPT>
      
      <script language="LiveScript">
         function uploadDropBoxes(){		
	     
             i = getFieldPosition(document.forma,'@type');
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
      
      
      <script language="JavaScript1.2">
          function GoBack(){
              history.back();
          }
          
          function fxCheckForm(form) {
             var toReturn = true;
             var temp = false;
                            
               if(toReturn == true){
                  i = getFieldPosition(form,'@fromdate');
                  temp = fxMaster(form[i],'TX',false,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                                    
               if(toReturn == true){
                  i = getFieldPosition(form,'@todate');
                  temp = fxMaster(form[i],'TX',false,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                                    
               if(toReturn == true){
                  i = getFieldPosition(form,'@type');
                  temp = fxMaster(form[i],'IS',false,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                     
             return toReturn;
          }
      </script>
      </head>
   <body bgcolor="#FFFFFF" background="" onload="uploadDropBoxes()">
      <table cellspacing="0" cellpadding="0">
         <tr>
            <td><img src="images/extend.jpg" onClick="extend_Contract(136)" /></td>
         </tr>
      </table>
      <p align="Center"><b><font face="Arial" size="3" color="#000000">Global Incidents by Posted Date and Type</font></b></p>
      <center>
         <form action="<%=request.getContextPath()%>/LogicServerAppServlet" name="forma" method="POST" target="ResultDataEntry" onSubmit="return fxCheckForm(forma)">
            <INPUT type="hidden" name="sourceXBRF" value="11011012brf">
            <INPUT type="hidden" name="Function" value="XBRFResolver">
            <INPUT type="hidden" name="NameXSL" value="2BWF110SC10">
            <INPUT type="hidden" name="NameBODY" value="110QV9">
            
            <table cellspacing="0" cellpadding="0">
               <tr>
                  <td>
                     <table cellspacing="1" cellpadding="1" class="frmtable"><tr>
                        <td></td>
                        <td align="Center"><font face="Arial" color="#000000" size="2">From Date</font></td>
                        <td class="frmtdvalue"><input name="@fromdate" type="text" size="10" maxlength="" readonly="" value=""><input type="button" value=".." onClick="newWindowfromdate();"></td>
                        <td></td>
                        <td align="Center"><font face="Arial" color="#000000" size="2">To Date</font></td>
                        <td class="frmtdvalue"><input name="@todate" type="text" size="10" maxlength="" readonly="" value=""><input type="button" value=".." onClick="newWindowtodate();"></td>
                        <td></td>
                        <td align="Center"><font face="Arial" color="#000000" size="2">Incident Type</font></td>
                        <td class="frmtdvalue"><select name="@type" size="1" onChange="fxMaster(this,'IS',false,false,'0','0','0','0',false,'');">
                              <option value=""></option></select></td></tr>
                     </table>
                  </td>
                  <td>
                     <table cellspacing="0" cellpadding="0">
                        <tr></tr>
                     </table>
                  </td>
               </tr>
               <tr>
                  <td align="center">
                     <table cellspacing="0" cellpadding="0" width="90%">
                        <tr>
                           <td align="Center"><input type="submit" value="Ok"></td>
                           <td align="Center"><input type="reset" value="Cancel"></td>
                        </tr>
                     </table>
                  </td>
               </tr>
            </table>
         </form>
      </center>
   </body>
</html>