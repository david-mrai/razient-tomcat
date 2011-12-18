<%@ page errorPage="error.jsp" import="com.mcmsoftware.project.beanLogins" %>
<%@ page language="java" session="true" %> 
<% 
	beanLogins bean =(beanLogins)session.getAttribute("User");
	String ipAddress;
	if(bean==null){ 
		response.sendRedirect("error.jsp");
	}
	else{
		ipAddress = bean.getIpAddress();
		if(!ipAddress.equals(request.getRemoteAddr()))
			response.sendRedirect("error.jsp");
	}
%>
<head>
	<title>Frame Menu </title>
	<script language="JavaScript">
		var indi_frame_menu = 0;
	</script>
</head>
<FRAMESET FRAMEBORDER="0" FRAMESPACING="1" BORDER="1" rows="15%,*">
<FRAME SRC="110HE1.html" NAME="cabecera" scrolling="no" >
<FRAMESET FRAMEBORDER="0" FRAMESPACING="1" BORDER="1" id="framemenu" cols="25%,*">
	<FRAME SRC="110ME1.html" NAME="menu" target="contenido" scrolling="auto">
<FRAME SRC="globalincidents.html" NAME="contenido">
</FRAMESET>
</FRAMESET>
