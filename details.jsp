<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String un = request.getParameter("Username");
String pw = request.getParameter("Password");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "pl1";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html><head>
<body background="bro.jpg">
<left>
<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>roll</td>
<td>subject</td>
<td>cgpa</td>
<td>endorsement</td>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from detail";
ResultSet K = statement.executeQuery(sql);
while(K.next()){
%>
<tr>
<td><%=K.getString(1) %></td>
<td><%=K.getString(2) %></td>
<td><%=K.getString(3) %></td>
<td><%=K.getString(4) %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</left>
</table> 
<center>
<table border="1">
<tr>
<td>cname</td>
<td>code</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database,userid, password);
statement=connection.createStatement();
String sql ="select * from company";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString(1) %></td>
<td><%=resultSet.getString(2) %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</center>
</table>
</body>
</html>