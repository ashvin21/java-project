<%-- 
    Document   : productdisplay
    Created on : 17 Jul, 2017, 11:36:44 AM
    Author     : Ashvinee
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,demo.ConnectionProvider,java.io.*"%>
<%
    try
    {
    response.setContentType("image/jpeg");
    String name = request.getParameter("name");
    System.out.println("Sid : "+name);
     Connection con = ConnectionProvider.getConnection();
     PreparedStatement ps = con.prepareStatement("select * from productdetails2 where productid = ?");
            ps.setString(1,name);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
             Blob b = rs.getBlob(6);
            response.setContentType("image/jpeg");
            //response.setContentType("application/octet-stream");
            response.setContentLength((int) b.length());
            InputStream is = b.getBinaryStream();
            OutputStream os = response.getOutputStream();
            byte buf[] = new byte[(int) b.length()];
            is.read(buf);
            os.write(buf);
            os.close();
            
                
      
      }
  }catch(Exception e)
  {
    out.println("Can't be uploaded!");
    e.printStackTrace();
  }
    %>         
      