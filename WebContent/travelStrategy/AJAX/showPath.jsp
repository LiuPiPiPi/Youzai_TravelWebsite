<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver" %>
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
	String adr = request.getParameter("adr");
	String day = request.getParameter("day");
	String q_a = "";
	String q_d = "";
	if (adr.equals("null")){
		q_a = "";
	}
	else{
		q_a = "pos = \"" + adr + "\"";
	}
	if (day.equals("null")){
		q_d = "";
	}
	else{
		q_d = "day = " + day;
	}
	String sql = "select * from PathArrange" + (q_a.equals("")&&q_d.equals("")?"":" where ") + q_a + (q_a.equals("")||q_d.equals("")?"":" and ") + q_d;
    stmt = conn.createStatement();  
    rs = stmt.executeQuery(sql);  
    while (rs.next()) {  
    	out.println("<div class=\"hotel-hd\">");
    	out.println("<div class=\"hotel-free fl\"></div>");
    	out.println("<div class=\"hotel-logo fl has-more-snapshots\">");
    	out.println("<img class=\"lazy\" src=\"img/"+rs.getString("image")+"\"></div>");
    	out.println("<div class=\"hotel-info fl\"><div class=\"nameAndIcon\">");
    	out.println("<a href=\"/detail/704474?checkInDate=2019-09-23&amp;checkOutDate=2019-09-24\" class=\"name\" target=\"_blank\"><h3>"+rs.getString("path")+"</h3></a>");
    	out.println("<div class=\"level star-2\">"+rs.getString("level")+"</div><span class=\"decorate_year\">"+rs.getString("short_dis")+"</span></div><div class=\"remarkTags\"></div>");
    	out.println("<div class=\"addressInfo\">"+rs.getString("description")+"</div>");
    	out.println("</div><div class=\"hotel-seperator fl\"></div><div class=\"hotel-brief fl\">");
    	out.println("<div class=\"startPrice\"><span class=\"yen\">¥</span><span class=\"digit\">"+rs.getInt("price")+"</span>");
    	out.println("</div><div class=\"satisfaction\"><span class=\"highlight\">"+rs.getFloat("satisfcation")+"</span><span class=\"slash\">/</span>5");
    	out.println("</div><div class=\"hotelDetail\"><a href=\" \" target=\"_blank\" rel=\"nofollow\">查看详情</a></div></div></div><br>");
    }
}
else{
	out.println("Connect Failed !!");
}
%>
</body>
</html>