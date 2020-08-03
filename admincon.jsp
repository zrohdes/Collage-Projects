<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pl1","root","");

Statement stmt=con.createStatement();
String username=request.getParameter("un");
String password=request.getParameter("pw");
ResultSet rs=stmt.executeQuery("select * from admin where un='"+username+"' and pw='"+password+"'");
if(rs.next())
{
%>
<jsp:forward page="details.jsp"/>
<%
}
else
{
out.println("Login Failed");
}
%>