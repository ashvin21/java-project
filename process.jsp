
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="demo.MyBeanProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*,java.sql.*"  %>
<%@page import="demo.ConnectionProvider" %>
<!DOCTYPE html>
<html>
    <head>

<jsp:useBean id="mybean" class="demo.MyJavaBean" scope="session"/>
		<jsp:setProperty property="*" name="mybean"/>
<jsp:useBean id="myprobean" class="demo.MyBeanProduct" scope="session"/>
		<jsp:setProperty property="*" name="myprobean"/>
                <% 
                    mybean = (demo.MyJavaBean)session.getAttribute("mybean");
                    myprobean = (demo.MyBeanProduct)session.getAttribute("myprobean");
                    session.setAttribute("myprobean",null);
 //                       request.setAttribute("cname", mybean.getName());
                %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Barcode Generator</title>
    </head>
    <body>

        <%
        try
        {
        String s1,s2,s3,s4,s5,s6;
        // String s7,s8,s9;
         
       
         
         
         

       // s1=(String)application.getAttribute("productid");
        //System.out.println("product id :: "+s1);
         //s1=(String)application.getAttribute("name");
        // s3=(String)application.getAttribute("license");
        //  s4=(String)application.getAttribute("batch");
          s1=(String)application.getAttribute("product");
//           s2=(String)application.getAttribute("productid");
            s2 = myprobean.getProductid();
           System.out.println("PID Process: "+s2);
           s3=(String)application.getAttribute("price");
           s4=(String)application.getAttribute("mdate");
           s5=(String)application.getAttribute("edate");
           s6= mybean.getName();
           System.out.println("canme"+ s6);
        /*s1=request.getParameter("pid");
        s2=request.getParameter("pname");
       s3=request.getParameter("price");
       s4=request.getParameter("mdate");
       s5=request.getParameter("edate");
        s6=request.getParameter("cname");
       s7=request.getParameter("address");
*/
        
        MyBeanProduct mybp= new MyBeanProduct();
        mybp.deleteProduct(s2);
        
        Connection con=ConnectionProvider.getConnection();
        String q="insert into productdetails2 values(?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(q);
        ps.setString(1,s1);
        ps.setString(2,s2);
        ps.setString(3,s3);
        ps.setString(4,s4);
        ps.setString(5,s5);
        ps.setString(7,s6);
       // ps.setString(6,s6);
       // ps.setString(7,s7);
		////ps.setString(8,s8);
		//ps.setString(9,s9);
        
  String p = (String)application.getAttribute("path");
  System.out.println("Insided Jsp : "+p);
  File image=new File(p);
  FileInputStream fis=new FileInputStream(image);
  
  ps.setBinaryStream(6, (InputStream)fis, (int)(image.length()));
//ps.setString(7,session.getAttribute("name").toString());
        int r=ps.executeUpdate();
       application.removeAttribute("path");
        if(r>0)
                       {
                           System.out.println("helo");
            %>
           
            <script>
                
    alert("product registered/updated successfully");
    </script>
    <jsp:include page="nproduct.jsp"/>
    <%
    //response.sendRedirect("nproduct.jsp");
    %>
           <%
         
           

           }
         else
                   {

          response.sendRedirect("nproduct.jsp");
          }
        }


        catch(Exception e)
                               {
            out.println(e.getMessage());
        }

        %>
    </body>
</html>
