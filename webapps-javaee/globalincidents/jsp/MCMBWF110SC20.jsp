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
<FRAMESET FRAMEBORDER="0" FRAMESPACING="1" BORDER="0" COLS="*">
<FRAME SRC="MCMBWF110QV18FRM110SC20.jsp" NAME="contenido">
</FRAMESET>
