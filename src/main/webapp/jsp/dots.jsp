<%@ page import="project.lab2web.model.Entries" %>
<%@ page import="project.lab2web.model.Entry" %><%--
  Created by IntelliJ IDEA.
  User: Number_One
  Date: 11/12/2023
  Time: 6:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  Entries entries = ((Entries) request.getServletContext().getAttribute("entries"));
    if (entries != null) {
        for (Entry entry : entries.getEntries()) {%>
<circle id="point"
        r="4"
        cx="<%=((300 / 2 + (entry.getX() + 0.02) / entry.getR() * 100))%>"
        cy="<%=((300 / 2 + (entry.getY() - 0.02) / entry.getR() * -100))%>"
        fill="<%=entry.isResult() ? "green" : "red"%>"
        stroke="white" />
<%}}%>



<!--<circle id="point" r="4" cx="150" cy="150" fill="red" stroke="white" aria-hidden="true" />-->

