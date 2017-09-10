<%-- 
    Document   : delete
    Created on : 16 Jul, 2017, 12:42:11 PM
    Author     : Ashvinee
--%>
<%@page import="java.sql.*,demo.ConnectionProvider,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="mybean" class="demo.MyJavaBean"/>
                    <jsp:setProperty property="*" name="mybean"/>
                    
<%
    Connection con = null;
    try{
    con = ConnectionProvider.getConnection();
    System.out.println("pidin delete: "+request.getParameter("pid"));
    PreparedStatement ps = con.prepareStatement("delete from productdetails2 where productid = ?");
    String pid = request.getParameter("pid").toString();
    ps.setString(1, pid);
    ps.executeUpdate();
    %>
               <script>
                
    alert("product deleted successfully");
    </script>
    <jsp:include page="rproduct.jsp"/>
    <%
    }
    catch(Exception e){

}
%>


