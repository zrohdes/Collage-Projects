<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8080/pl1","root","");

Statement stmt=con.createStatement();
String id=request.getParameter("Username");
String pass=request.getParameter("Password");
ResultSet rs=stmt.executeQuery("select * from registerlogin where Username='"+id+"' and Password='"+pass+"'");
if(rs.next())
{
%>
<jsp:forward page="search.jsp"/>
<%
}
else
{
out.println("Login Failed");
}
%>