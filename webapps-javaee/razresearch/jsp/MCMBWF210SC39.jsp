<% String country = request.getParameter("@country"); %>
<% String type = request.getParameter("@type"); %>
<% String state = request.getParameter("@state"); %>
<FRAMESET FRAMEBORDER="0" FRAMESPACING="1" BORDER="0" COLS="*">
<FRAME SRC="MCMfw210DD41.jsp?@country=<%=country%>&amp;@type=<%=type%>&amp;@state=<%=state%>" NAME="contenido">
</FRAMESET>
