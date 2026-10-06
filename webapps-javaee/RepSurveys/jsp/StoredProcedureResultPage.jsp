<html>
	<head>
		<%@ page language="java" import="java.util.Vector"%>
		<%
			String value;
			if(request.getAttribute("StoredProcedureReturnValue") != null)
				value=(String)request.getAttribute("StoredProcedureReturnValue");
			else
				value = "";
			if(value == null && value.equals(""))	
				value="No return";
		%>		
		<title>Stored Procedure Result Page</title>
	</head>
	<body>
			<font face="tahoma">
			<center>
				<hr>
				<h1>The Stored Procedure Was Executed Successfully !!!!!!!! </h1>
				<hr>
				<br>
				<font size="5">Return Value = <%= value %>	
			</center>
	</body>
</html>