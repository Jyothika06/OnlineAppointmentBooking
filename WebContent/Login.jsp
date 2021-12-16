<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%
String driver="com.mysql.cj.jdbc.Driver";
String url ="jdbc:mysql://localhost:3306/hospitalwebsite";
String user ="root";
String pass ="jyoo@123456";
String userid = request.getParameter("username");    
String pwd = request.getParameter("password");
Class.forName(driver);
Connection con=DriverManager.getConnection(url,user,pass);
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from register1 where username='" + userid + "' and password='" + pwd + "'");
if (rs.next()) {
 session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
 
        response.sendRedirect("appointment.html");
       // out.println("Login successful");
       
    } else {
        out.println("Invalid password");
    }
%>