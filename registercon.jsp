<%@ page import="java.io.*"  %>

<%@ page import="java.sql.*"  %>
<%


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pl1","root","");

String fname=request.getParameter("First Name");
String lname=request.getParameter("Last Name");
String phno=request.getParameter("Phone no");
String un=request.getParameter("Username");
String pw=request.getParameter("Password");
PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?,?,?)");


ps.setString(1,fname);
ps.setString(2,lname);
ps.setString(3,phno);
ps.setString(4,un);
ps.setString(5,pw);
int result=ps.executeUpdate();

if(result==1)

out.println("Insertion sucessfull");

else

out.println("failure");
%>
