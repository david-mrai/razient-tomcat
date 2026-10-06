<% String country = request.getParameter("@country"); %>
<% String state = request.getParameter("@state"); %>
<% String city = request.getParameter("@city"); %>
<% String type = request.getParameter("@type"); %>
<% String newsdate = request.getParameter("@newsdate"); %>
<FRAMESET FRAMEBORDER="0" FRAMESPACING="1" BORDER="0" COLS="*">
<FRAME SRC="MCMfw210DD16.jsp?@country=<%=country%>&amp;@state=<%=state%>&amp;@city=<%=city%>&amp;@type=<%=type%>&amp;@newsdate=<%=newsdate%>" NAME="contenido">
</FRAMESET>
