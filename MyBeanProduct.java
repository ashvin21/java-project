
package demo;

import java.sql.*;


public class MyBeanProduct {
 
    String product,productid,mdate,edate;
    Blob barcode;
    Double price;

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getMdate() {
        return mdate;
    }

    public void setMdate(String mdate) {
        this.mdate = mdate;
    }

    public String getEdate() {
        return edate;
    }

    public void setEdate(String edate) {
        this.edate = edate;
    }

    public Blob getBarcode() {
        return barcode;
    }

    public void setBarcode(Blob barcode) {
        this.barcode = barcode;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
    
 public int save()
 {
  int i = 0;
  try
  {
	Connection con = ConnectionProvider.getConnection();
	
	PreparedStatement pstmt2 = con.prepareStatement("insert into productdetails2  (product,productid,price,mdate,edate) values(?,?,?,?,?)");
	pstmt2.setString(1,product);
	pstmt2.setString(2,productid);
	pstmt2.setDouble(3,price);
	pstmt2.setString(4,mdate);
	pstmt2.setString(5,edate);
        
        
        System.out.println("i am in bean class   "+getProductid());
        
    
	//i = pstmt2.executeUpdate();
	pstmt2.close();
	con.close();
	
        if(i!=0)
	{
            return i;
        }
	
  }catch(Exception e)
  {
	  e.printStackTrace();
  }
  return i;	 
 }
 
public boolean find(String pid)
 {
	boolean flag = false;
	try
	{
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement pstmt = con.prepareStatement("select * from productdetails2 where productid=?");
	pstmt.setString(1,pid);
	ResultSet rset = pstmt.executeQuery();
	if(rset.next())
        {
            setProduct(rset.getString(1));
            setProductid(rset.getString(2));
            setPrice(rset.getDouble(3));
            setMdate(rset.getString(4));
            setEdate(rset.getString(5));
            setBarcode(rset.getBlob(6));
            
//	  setJob(rset.getString(4));
	  flag=true;
	}
	pstmt.close();
	rset.close();
	con.close();
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	 
	 return flag;
 }
    
    
 public int deleteProduct(String pid)
 {
	int i = 0;
	try
	{
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement pstmt = con.prepareStatement("delete from productdetails2 where productid= ? ");
	pstmt.setString(1,pid);
	i = pstmt.executeUpdate();
//	if(rset.next())
//        {
//           
////	  this.setName(rset.getString(2));
////            setEmail(rset.getString(3));
////            setContact(rset.getLong(5));
////            setLicense(rset.getString(6));
////            setBatch(rset.getString(7));
////            setAddress(rset.getString(8));
////	  setJob(rset.getString(4));
//	  flag=true;
//	}
	pstmt.close();
	con.close();
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	 
	 return i;
 }
    
}
