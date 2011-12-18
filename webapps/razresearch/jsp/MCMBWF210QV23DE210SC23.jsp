
<html><%@page language="java" errorPage="error.jsp" %>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   
      <LINK rel="stylesheet" type="text/css" href="../CSSFiles/forms.css">
      		<SCRIPT LANGUAGE='JavaScript1.2' SRC='js/contractExtendFrame.js' TYPE='text/javascript'></SCRIPT>
      		
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/RegExpValidate.js' TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fxValidate.js'     TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fxMaster.js'       TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/210QV23fromdate.js' TYPE='text/javascript'></SCRIPT><SCRIPT LANGUAGE='JavaScript1.2' SRC='js/210QV23todate.js' TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/jsrsClient.js'  TYPE='text/javascript'></SCRIPT>
      <SCRIPT LANGUAGE='JavaScript1.2' SRC='js/fillDropBox.js' TYPE='text/javascript'></SCRIPT>
      
      <script language="LiveScript">
         function uploadDropBoxes(){		
	     
             i = getFieldPosition(document.forma,'@country');
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 4, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='21021025brf'; 
             params[1][0]='Function';
             params[1][1]='XBRFResolver';
             params[2][0]='NameXSL';	
             params[2][1]='null';		
             params[3][0]='DropBoxOption';
             params[3][1]='Yes';
             fillDropBox('',document.forma[i],'<%=request.getContextPath()%>/LogicServerAppServlet',params);
             i = getFieldPosition(document.forma,'@type2');
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 4, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='21021028brf'; 
             params[1][0]='Function';
             params[1][1]='XBRFResolver';
             params[2][0]='NameXSL';	
             params[2][1]='null';		
             params[3][0]='DropBoxOption';
             params[3][1]='Yes';
             fillDropBox('',document.forma[i],'<%=request.getContextPath()%>/LogicServerAppServlet',params);
             i = getFieldPosition(document.forma,'@type3');
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 4, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='21021028brf'; 
             params[1][0]='Function';
             params[1][1]='XBRFResolver';
             params[2][0]='NameXSL';	
             params[2][1]='null';		
             params[3][0]='DropBoxOption';
             params[3][1]='Yes';
             fillDropBox('',document.forma[i],'<%=request.getContextPath()%>/LogicServerAppServlet',params);
             i = getFieldPosition(document.forma,'@type1');
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 4, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='21021028brf'; 
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
		
		 i = getFieldPosition(document.forma,'@state');
		 document.forma[i].selectedIndex = 0
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 5, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='21021026brf';
             params[1][0]='Function';
             params[1][1]='XBRFResolver';
             params[2][0]='NameXSL';
             params[2][1]='null';
		 
		 j = getFieldPosition(document.forma,'@country');
		 params[3][0]='@country';
	       params[3][1]=document.forma[j].value;
		 
             params[4][0]='DropBoxOption';
             params[4][1]='Yes';
		 i = getFieldPosition(document.forma,'@state');
             fillDropBox('',document.forma[i],'<%=request.getContextPath()%>/LogicServerAppServlet',params);
         }
	
            function fillcity(){		
		
		 i = getFieldPosition(document.forma,'@city');
		 document.forma[i].selectedIndex = 0
		 document.forma[i].options[0].text="loading..."
		 document.forma[i].options[0].value=""

             dimension ('params', 6, 2);
             params[0][0]='sourceXBRF';
             params[0][1]='21021027brf';
             params[1][0]='Function';
             params[1][1]='XBRFResolver';
             params[2][0]='NameXSL';
             params[2][1]='null';
		 
		 j = getFieldPosition(document.forma,'@country');
		 params[3][0]='@country';
	       params[3][1]=document.forma[j].value;
		 
		 j = getFieldPosition(document.forma,'@state');
		 params[4][0]='@state';
	       params[4][1]=document.forma[j].value;
		 
             params[5][0]='DropBoxOption';
             params[5][1]='Yes';
		 i = getFieldPosition(document.forma,'@city');
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
                  i = getFieldPosition(form,'@country');
                  temp = fxMaster(form[i],'IS',true,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                                    
               if(toReturn == true){
                  i = getFieldPosition(form,'@type2');
                  temp = fxMaster(form[i],'IS',true,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                                    
               if(toReturn == true){
                  i = getFieldPosition(form,'@fromdate');
                  temp = fxMaster(form[i],'TX',true,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                                    
               if(toReturn == true){
                  i = getFieldPosition(form,'@state');
                  temp = fxMaster(form[i],'IS',true,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                                    
               if(toReturn == true){
                  i = getFieldPosition(form,'@type3');
                  temp = fxMaster(form[i],'IS',false,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                                    
               if(toReturn == true){
                  i = getFieldPosition(form,'@todate');
                  temp = fxMaster(form[i],'TX',true,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                                    
               if(toReturn == true){
                  i = getFieldPosition(form,'@city');
                  temp = fxMaster(form[i],'IS',true,false,'0','0','0','0',false,'');
                  if(temp == false)
                      toReturn = temp;
               }
                                    
               if(toReturn == true){
                  i = getFieldPosition(form,'@type1');
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
            <td><img src="images/extend.jpg" onClick="extend_Contract(182)" /></td>
         </tr>
      </table>
      <p align="Center"><b><font face="Arial" size="3" color="#000000">Multiple Incident Type by City</font></b></p>
      <center>
         <form action="<%=request.getContextPath()%>/LogicServerAppServlet" name="forma" method="POST" target="ResultDataEntry" onSubmit="return fxCheckForm(forma)">
            <INPUT type="hidden" name="sourceXBRF" value="21021031brf">
            <INPUT type="hidden" name="Function" value="XBRFResolver">
            <INPUT type="hidden" name="NameXSL" value="13BWF210SC23">
            <INPUT type="hidden" name="NameBODY" value="210QV23">
            <INPUT type="hidden" name="Graphics" value="">
            
            <table cellspacing="0" cellpadding="0">
               <tr>
                  <td>
                     <table cellspacing="1" cellpadding="1" class="frmtable"><tr>
                        <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                        <td align="Center"><font face="Arial Bold" color="#000000" size="2"><b>Country</b></font></td>
                        <td class="frmtdvalue"><select name="@country" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');fillstate();">
                              <option value=""></option></select></td>
                        <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                        <td align="Center"><font face="Arial Bold" color="#000000" size="2"><b>Type 1</b></font></td>
                        <td class="frmtdvalue"><select name="@type2" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');">
                              <option value=""></option></select></td>
                        <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                        <td align="Center"><font face="Arial Bold" color="#000000" size="2"><b>From Date</b></font></td>
                        <td class="frmtdvalue"><input name="@fromdate" type="text" size="10" maxlength="" readonly="" value=""><input type="button" value=".." onClick="newWindowfromdate();"></td></tr><tr>
                        <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                        <td align="Center"><font face="Arial Bold" color="#000000" size="2"><b>State</b></font></td>
                        <td class="frmtdvalue"><select name="@state" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');fillcity();">
                              <option value=""></option></select></td>
                        <td></td>
                        <td align="Center"><font face="Arial Bold" color="#000000" size="2"><b>Type 2</b></font></td>
                        <td class="frmtdvalue"><select name="@type3" size="1" onChange="fxMaster(this,'IS',false,false,'0','0','0','0',false,'');">
                              <option value=""></option></select></td>
                        <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                        <td align="Center"><font face="Arial Bold" color="#000000" size="2"><b>To Date</b></font></td>
                        <td class="frmtdvalue"><input name="@todate" type="text" size="10" maxlength="" readonly="" value=""><input type="button" value=".." onClick="newWindowtodate();"></td></tr><tr>
                        <td><font xmlns:saxon="http://icl.com/saxon" color="red" size="2">* </font></td>
                        <td align="Center"><font face="Arial Bold" color="#000000" size="2"><b>City</b></font></td>
                        <td class="frmtdvalue"><select name="@city" size="1" onChange="fxMaster(this,'IS',true,false,'0','0','0','0',false,'');">
                              <option value=""></option></select></td>
                        <td></td>
                        <td align="Center"><font face="Arial Bold" color="#000000" size="2"><b>Type 3</b></font></td>
                        <td class="frmtdvalue"><select name="@type1" size="1" onChange="fxMaster(this,'IS',false,false,'0','0','0','0',false,'');">
                              <option value=""></option></select></td>
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