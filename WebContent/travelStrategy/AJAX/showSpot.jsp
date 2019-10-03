<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.util.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<%
String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
String DB_URL = "jdbc:mysql://localhost:3306/travel?useUnicode=true&characterEncoding=UTF-8";
String USER = "root";
String PASS = "liubihao";
Connection conn = null;
Statement stmt = null;
Class.forName(JDBC_DRIVER);
System.out.println("Connect Database...");
conn = DriverManager.getConnection(DB_URL,USER,PASS);
if (conn!=null){
	ResultSet rs = null;  
	String dest = request.getParameter("city");
	String q_a = "";
	q_a = "city = \"" + dest + "\"";
	String sql = "select * from spotticket where " + q_a;
    stmt = conn.createStatement();  
    rs = stmt.executeQuery(sql);
    out.println("<ul class=\"media-list\">");
    while(rs.next()){
    	out.println("<li class=\"media\">");
    	out.println("<div class=\"media-left\"><a herf=\"###\">");
    	
    	out.println("<img class=\"media-object\" src=\"img/"+rs.getString("img")+"\" alt=\""+rs.getString("alt")+"\"></a></div>");
    	out.println("<div class=\"media-body\"><h1 class=\"media-heading\">"+rs.getString("spotname")+"</h1><p>"+rs.getString("city")+"</p><p>"+rs.getString("description")+"</p></div>");
    	out.println("<div class=\"media-right media-middle\"><div class=\"panel panel-success\"><div class=\"panel-heading\">票价</div>");
    	out.println("<div class=\"panel-body\"><span class=\"glyphicon glyphicon-yen\"></span>"+rs.getString("price")+"</div></div>");
		out.println("<button type=\"button\" class=\"btn btn-primary btn-lg\" data-toggle=\"modal\" data-target=\"#myModal\">预订</button></div>");
    	out.println("</li>");
    }
    out.println("</ul>");
}
else{
	out.println("Connect Failed !!");
}
%>
</body>
</html>