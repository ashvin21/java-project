package demo;

import java.sql.*;
public class MyJavaBean {
    String name,password,email,address,batch,license;
    int id;
 long contact;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}

public long getContact() {
	return contact;
}
public void setContact(long contact) {
	this.contact = contact;
}
public String getLicense() {
	return license;
}
public void setLicense(String license) {
	this.license = license;
}
public String getBatch() {
	return batch;
}
public void setBatch(String batch) {
	this.batch = batch;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
 public int save()
 {
  int i = 0;
  try
  {
	Connection con = ConnectionProvider.getConnection();
	id = 0;
	PreparedStatement pstmt1 = con.prepareStatement("select max(id) from users");
	ResultSet rset1 = pstmt1.executeQuery();
	if(rset1.next())
	{
		id = rset1.getInt(1);
	}
	id++;
	pstmt1.close();
	PreparedStatement pstmt2 = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?)");
	pstmt2.setInt(1,id);
	pstmt2.setString(2,name);
	pstmt2.setString(3,email);
	pstmt2.setString(4,password);
	pstmt2.setLong(5,contact);
        pstmt2.setString(6,license);
        pstmt2.setString(7,batch);
        pstmt2.setString(8,address);
	i = pstmt2.executeUpdate();
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
 
 public boolean find()
 {
	 boolean flag = false;
	try
	{
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement pstmt = con.prepareStatement("select * from users where email=? and password=?");
	pstmt.setString(1,email);
	pstmt.setString(2,password);
	ResultSet rset = pstmt.executeQuery();
	if(rset.next())
        {
	  this.setName(rset.getString(2));
            setEmail(rset.getString(3));
            setContact(rset.getLong(5));
            setLicense(rset.getString(6));
            setBatch(rset.getString(7));
            setAddress(rset.getString(8));
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
    
}
