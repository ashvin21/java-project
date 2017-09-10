<%@page import="demo.*,java.sql.*"%>
<jsp:useBean id="bean" class="demo.MyJavaBean"/>
<jsp:setProperty name="bean" property="*" />
<%
 int i = bean.save();
 if(i!=0)
 {
%>
  <script>
  alert("Regsitered Successfully!");
  
</script>
  

 <jsp:forward page="login.jsp?msg=Registered Successfully!"/>
  <%
 }
 else
 {
 %>
 <jsp:forward page="registered.jsp"/>
 <%
 }
%>