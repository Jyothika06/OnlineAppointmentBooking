 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.sql.*" %>
  <%
  String Name=request.getParameter("name");
  String Age=request.getParameter("age");
  String Gender=request.getParameter("gender");
  String Email=request.getParameter("email");
  String Mobile=request.getParameter("mobile");  
  String HealthIssue=request.getParameter("healthissue");
  String driver="com.mysql.cj.jdbc.Driver";
  String url ="jdbc:mysql://localhost:3306/hospitalwebsite";
	String user ="root";
	String pass ="jyoo@123456";
  try{
	 Class.forName(driver);
	 Connection conn=DriverManager.getConnection(url,user,pass);
	 PreparedStatement ps=conn.prepareStatement("insert into appointment(name,age,gender,email,mobile,healthissue) values(?,?,?,?,?,?)");
	 ps.setString(1,Name);
	 ps.setString(2,Age);
	 ps.setString(3,Gender);
	 ps.setString(4,Email);
	 ps.setString(5,Mobile);
	 ps.setString(6,HealthIssue);
	 if(Name==""||Age==""||Gender==""||Email==""||Mobile==""||HealthIssue=="")
	  {
		  out.println("Something went wrong......");  
	  }
	 else{
	  int i=ps.executeUpdate();
	  if(i>0){
		  
		  out.println(Name+"Your Appointment is successfull....");
		  out.println("\n");
		  out.println("Please check your registerd mail to know about date and timing of the doctor.. ");
		  //out.println("Go to Login  "+"<a href='login.html'>Login</a>");
		  
	  }
	  else{
		  out.println("Something went wrong......");
	  }
	 }
	 
	 
  }
  catch(Exception e)
  {
	  out.println(e);
  }
  
  
  %>
