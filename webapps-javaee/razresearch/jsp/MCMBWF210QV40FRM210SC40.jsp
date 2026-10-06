<%
	HttpSession sesion = request.getSession(true);
	java.util.Enumeration e = request.getParameterNames();
	while (e.hasMoreElements()) {
	    String key = (String)e.nextElement();
	    String value = request.getParameter(key);
	    sesion.setAttribute(key,value);
	}
%>

<%@ page errorPage="error.jsp" %>
<html>
	<head>
		<title>Frame QV</title>
		<script language="JavaScript">
			var indi_frame_qv = 0;
		</script>
	</head>
		<FRAMESET frameborder="0" framespacing="0" border="0"  id="frameqv" rows="157,*">
		<FRAME src="MCMBWF210QV40DE210SC40.jsp" name="DataEntry" scrolling="no">
		<FRAME src="ResultDataEntry.html" name="ResultDataEntry">
		</FRAMESET>
</html>
