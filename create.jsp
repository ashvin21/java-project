<jsp:useBean id="mybean" class="demo.MyJavaBean" />
<jsp:setProperty property="*" name="mybean"/>
<%
 if(mybean.find())
 {   
    session.setAttribute("email", mybean.getEmail());
    session.setAttribute("mybean",mybean);
%>
   <jsp:forward page="items.jsp"></jsp:forward>
 <%  
 }
 else
 {
%>
<script>
  alert("Sorry! Invalid email or password!");
</script>
 <jsp:include page="login.jsp"></jsp:include>
  
<%
 }
%>







