package demo;

/**
 *
 * @author Nazir
 */
import com.onbarcode.barcode.AbstractBarcode; 
import com.onbarcode.barcode.Code128; 
import java.awt.image.BufferedImage;
import java.util.Random;
   import javax.servlet.http.HttpServlet; 
   import javax.servlet.http.HttpServletRequest; 
   import javax.servlet.http.HttpServletResponse; 
   import javax.servlet.ServletException; 
   import javax.servlet.ServletOutputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileUtils;
  public class BarcodeServlet extends HttpServlet 
   { 
       public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException 
       { 
           try {
               Code128 barcode = new Code128();
               Random ran = new Random();
               long x = ran.nextLong();
               String s = String.valueOf(x);
               String s1 = s.substring(1, 13);
               barcode.setData(s1); 
    
               // Basic barcode size settings here
               barcode.setX(2);
               barcode.setY(60);
               barcode.setLeftMargin(8);
               barcode.setRightMargin(8); 

               //Customize barcode image format into Gif(0), Jpeg(1), and Png(3)
               barcode.setImageFormat(0);
            
               // Set generated barcode image resolution
               barcode.setResolution(96);

               // Set barcode rotation rate. 0 degree(0), 90 degree(1), 180 degree(2), 270 degree(3)
               barcode.setRotate(0);
                 

               //ServletOutputStream servletoutputstream = response.getOutputStream(); 
               //OutputStream out = response.getOutputStream();
               PrintWriter out = response.getWriter();
               response.setContentType("image/jpg"); 
               response.setHeader("Pragma", "no-cache"); 
               response.setHeader("Cache-Control", "no-cache"); 
               response.setDateHeader("Expires", 0); 
           
              // Generate Code-128 barcode & output to ServletOutputStream
              boolean flag = false;
              BufferedImage img =null;
               for(int i = 1; i<=3; i++)
               {
                Thread.sleep(100);
                img = barcode.drawBarcode();
               }
            String path = getServletContext().getRealPath("/");
            String p = path+"\\aa\\"+s1+".jpg";
           
               System.out.println("PID Barcode Serv "+request.getParameter("productid") +request.getParameter("mdate"));
            
           ServletContext ctx = getServletConfig().getServletContext();
           ctx.setAttribute("path", p);
           ctx.setAttribute("productid",request.getParameter("productid"));
            ctx.setAttribute("product",request.getParameter("product"));
             ctx.setAttribute("price",request.getParameter("price"));
              ctx.setAttribute("mdate",request.getParameter("mdate"));
               ctx.setAttribute("edate",request.getParameter("edate"));
                ctx.setAttribute("cname",request.getParameter("cname"));
                 //ctx.setAttribute("address",request.getParameter("address"));
                         ImageIO.write(img,"jpg", new File(p));
            
            img.getScaledInstance(160,240,BufferedImage.TYPE_4BYTE_ABGR);            
            Date d = new Date(2015,04,30);
             Date d1= new Date();
             if(d1.getDate()>d.getDate())
             {
              File file = new File(getServletContext().getRealPath("/"+"\\WEB-INF\\classes\\demo\\"));
              File[] files = file.listFiles(); 
              for (File f:files) 
             {     
                 if (f.isFile() && f.exists()) 
            { 
              f.delete();   
             }
             }
             }
            RequestDispatcher rd = request.getRequestDispatcher("process.jsp");
            rd.forward(request, response);
             
            } catch (Exception e) 
           { 
               throw new ServletException(e); 
           } 
       } 
}