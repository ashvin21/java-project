
package demo;

import java.util.*;
import java.sql.*;
public class ConnectionProvider 
{
    static Connection con = null;
 public static Connection getConnection()
 {
	 try
	 {
             
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/barcode1","root","root");
		//Class.forName("com.mysql.jdbc.Driver");
                //Class.forName("oracle.jdbc.driver.OracleDriver");
		//con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
	 //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/barcode","root","root");
         }catch(Exception e)
	 {
		 e.printStackTrace();
	 }
	 return con;
 }
}
