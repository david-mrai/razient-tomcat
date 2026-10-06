<%@ page import="java.io.*" isErrorPage="true" %>
<%
	String strError;
	String strHelp = null;
	String strTitulo = null;
	boolean expired = false;
	try{
		strError = request.getParameter("errorCode");			
		if( strError == null ){
			if( exception != null ){
			   strError = exception.getMessage();			
			   strHelp  = "Please Contact your provider for support";
			   strTitulo = "APPLICATION ERROR";
			}
			else{
			   strError = "You should start a session";
			   strHelp  = "Current page has expired";
			   strTitulo = "LOGIN REQUIRED";
			   expired  = true;
			}
		}
	}
	catch(Exception e){
	
		strError = "An unexpected error has ocurred";
		System.out.print(strError);
		strTitulo = "APPLICATION ERROR";
	}
%>
<html>
    <head>
	  <title>Error Report</title>
	  <link href="../CSSFiles/generic.css" rel="stylesheet" type="text/css">
	  
    </head>
    <body>
	<center>
	    <p>&nbsp;</p>
	    <p> <br> <br> </p>
	    <hr>
		<div align="center"><span class="headTitle">
			<font color="000080" face="arial" size="7"><%= strTitulo  %></font></span> 
		</div>
	    <hr>	
	    <table width="438" align="center">
		<tr> 
		   <td width="348" align="center"/>&nbsp;&nbsp;&nbsp;
		</tr>
		<tr> 
		    <td align="center"/>&nbsp;&nbsp;&nbsp;
		</tr>
		<tr> 
		    <td align="center">
		       <font size="6" face="arial" color="7D5C3C"><%= strError %></font> 
		    </td>
		</tr>
		<tr> 
		     <td align="center"> <span class="helpCondition">
			  <font size="3" face="arial" color="7D5C3C"><%=strHelp%></font></span> 
		     </td>
		</tr>
	    </table>
	    <br>
	    <br>
  	    <a href="index.jsp" target="_top" class="indexLink">Home</a> 
	</center>
    </body>
</html>
