<% String country = request.getParameter("@country"); %>
<% String state = request.getParameter("@state"); %>
<% String type = request.getParameter("@type"); %>
<FRAMESET FRAMEBORDER="0" FRAMESPACING="1" BORDER="0" COLS="*">
<FRAME SRC="MCMfw210DD44.jsp?@country=<%=country%>&amp;@state=<%=state%>&amp;@type=<%=type%>" NAME="contenido">
</FRAMESET>
