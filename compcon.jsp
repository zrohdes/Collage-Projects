<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pl1","root","");

Statement stmt=con.createStatement();
String username=request.getParameter("cname");
String password=request.getParameter("code");
ResultSet rs=stmt.executeQuery("select * from company where cname='"+username+"' and code='"+password+"'");
if(rs.next())
{
%>
<jsp:forward page="sd.jsp"/>
<%
}
else
{
out.println("Login Failed");
}
%>