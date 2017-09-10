

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,demo.ConnectionProvider,java.io.*"%>
<%
   String pid=null;
    try
    {
     response.setContentType("image/jpeg");
    pid = request.getParameter("search");
    System.out.println("Sid : "+pid);
     Connection con = ConnectionProvider.getConnection();
     PreparedStatement ps = con.prepareStatement("select * from productdetails2 where productid = ?");
            ps.setString(1,pid);
//            ps.setString(2, name);
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
            
            
            
           %>
           <%--<jsp:include page="sbarcode.jsp"/>--%>
<%     
      
      }
  }catch(Exception e)
  {
    out.println("Can't be uploaded!");
    e.printStackTrace();
  }
    %>         
    