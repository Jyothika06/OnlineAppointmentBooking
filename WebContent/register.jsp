 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.sql.*" %>
  <%
  String Name=request.getParameter("name");
  String Email=request.getParameter("email");
  String Mobile=request.getParameter("mobile");
  String Username=request.getParameter("username");
  String Password=request.getParameter("password");  
  String Conpassword=request.getParameter("re-password");
  String driver="com.mysql.cj.jdbc.Driver";
  String url ="jdbc:mysql://localhost:3306/hospitalwebsite";
	String user ="root";
	String pass ="jyoo@123456";
  try{
	 Class.forName(driver);
	 Connection conn=DriverManager.getConnection(url,user,pass);
	 PreparedStatement ps=conn.prepareStatement("insert into register1(name,email,mobile,username,password,confirmpassword) values(?,?,?,?,?,?)");
	 ps.setString(1,Name);
	 ps.setString(2,Email);
	 ps.setString(3,Mobile);
	 ps.setString(4,Username);
	 ps.setString(5,Password);
	 ps.setString(6,Conpassword);
	  int i=ps.executeUpdate();
	  if(i>0){
		  out.println("Registered Successfully.....");
		  out.println("\n");
		  out.println("Go to Login  "+"<a href='login.html'>Login</a>");
	  }
	  else{
		  out.println("incorrect username or password..");
	  }
		  
	 
	 
  }
  catch(Exception e)
  {
	  out.println(e);
  }
  
  
  %>
