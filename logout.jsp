<%-- 
    Document   : logout
    Created on : 15 Jul, 2017, 5:08:26 PM
    Author     : Ashvinee
--%>
<%
    session.invalidate();
    %>
    <jsp:forward page="index.jsp"/>
