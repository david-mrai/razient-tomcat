
<html><%@page language="java" errorPage="error.jsp" %>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   
      <LINK rel="stylesheet" type="text/css" href="../CSSFiles/forms.css">
      		<SCRIPT LANGUAGE='JavaScript1.2' SRC='js/contractExtendFrame.js' TYPE='text/javascript'></SCRIPT>
      		
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/RegExpValidate.js' TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fxValidate.js'     TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fxMaster.js'       TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/110QV18fromdate.js' TYPE='text/javascript'></SCRIPT><SCRIPT LANGUAGE='JavaScript1.2' SRC='js/110QV18todate.js' TYPE='text/javascript'></SCRIPT>
      
      
      
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
                     
             return toReturn;
          }
      </script>
      </head>
   <body bgcolor="#FFFFFF" background="">
      <table cellspacing="0" cellpadding="0">
         <tr>
            <td><img src="images/extend.jpg" onClick="extend_Contract(136)" /></td>
         </tr>
      </table>
      <p align="Center"><b><font face="Arial" size="3" color="#000000">Global Incidents Inquiry by Date Posted</font></b></p>
      <center>
         <form action="<%=request.getContextPath()%>/LogicServerAppServlet" name="forma" method="POST" target="ResultDataEntry" onSubmit="return fxCheckForm(forma)">
            <INPUT type="hidden" name="sourceXBRF" value="11011015brf">
            <INPUT type="hidden" name="Function" value="XBRFResolver">
            <INPUT type="hidden" name="NameXSL" value="10BWF110SC20">
            <INPUT type="hidden" name="NameBODY" value="110QV18">
            
            <table cellspacing="0" cellpadding="0">
               <tr>
                  <td>
                     <table cellspacing="1" cellpadding="1" class="frmtable"><tr>
                        <td></td>
                        <td align="Center"><font face="Arial" color="#000000" size="2">From Date</font></td>
                        <td class="frmtdvalue"><input name="@fromdate" type="text" size="10" maxlength="" readonly="" value=""><input type="button" value=".." onClick="newWindowfromdate();"></td>
                        <td></td>
                        <td align="Center"><font face="Arial" color="#000000" size="2">To Date</font></td>
                        <td class="frmtdvalue"><input name="@todate" type="text" size="10" maxlength="" readonly="" value=""><input type="button" value=".." onClick="newWindowtodate();"></td></tr>
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