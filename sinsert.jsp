<%@ page import="java.io.*"  %>

<%@ page import="java.sql.*"  %>
<%


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pl1","root","");

String roll=request.getParameter("ROLL");
String subject=request.getParameter("SUBJECT");
String cgpa=request.getParameter("CGPA");
String endorsement=request.getParameter("ENDORSEMENT");
PreparedStatement ps=con.prepareStatement("insert into detail values(?,?,?,?)");


ps.setString(1,roll);
ps.setString(2,subject);
ps.setString(3,cgpa);
ps.setString(4,endorsement);
int result=ps.executeUpdate();

if(result==1)

out.println("Insertion sucessfull");

else

out.println("failure");
%>
