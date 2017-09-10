<%@page import="demo.*,java.sql.*"%>
<jsp:useBean id="bean" class="demo.MyBeanProduct"/>
<jsp:setProperty name="bean" property="*" />
<%
 int i = bean.save();
 if(i!=0)
 {    
    System.out.println("Data to ja rha hai ");
    
%>
  <script>
  alert("Regsitered Successfully!");
</script>
  

 <jsp:forward page="items.jsp"/>
  <%
 }
 else
 {
 %>
 <jsp:forward page="nproduct.jsp"/>
 <%
 }
%>