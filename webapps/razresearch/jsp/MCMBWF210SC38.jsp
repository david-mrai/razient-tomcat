<% String country = request.getParameter("@country"); %>
<% String state = request.getParameter("@state"); %>
<% String type = request.getParameter("@type"); %>
<% String city = request.getParameter("@city"); %>
<FRAMESET FRAMEBORDER="0" FRAMESPACING="1" BORDER="0" COLS="*">
<FRAME SRC="MCMfw210DD39.jsp?@country=<%=country%>&amp;@state=<%=state%>&amp;@type=<%=type%>&amp;@city=<%=city%>" NAME="contenido">
</FRAMESET>
