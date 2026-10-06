<%@ page errorPage="error.jsp" session="true"  %>

<%
HttpSession sessions = request.getSession();
if(request.getSession().getAttribute("intomobile") == null)
	sessions.invalidate();
%>
<% 
	String error=request.getParameter("error");
%>
<head>
	<title>Frame Menu </title>
	<script language="JavaScript">
		var indi_frame_menu = 0;
	</script>
</head>
<FRAMESET FRAMEBORDER="0" FRAMESPACING="1" BORDER="0" rows="20%,*">
<FRAME SRC="110HE1.html" NAME="cabecera" scrolling="no" >
<FRAME SRC="MCMloginTable110LT1.jsp?error=<%= error %>" NAME="contenido">
</FRAMESET>
