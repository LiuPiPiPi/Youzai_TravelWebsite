<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	String price = request.getParameter("price");
	String sql = "";
	String query_adr = "";
	if (adr.equals("null")){
		query_adr = "";
	}
	else{
		query_adr = "pos = \"" + adr + "\"";
	}
	if (price.equals("low_price")){
		sql = "select * from Hotel where " + query_adr + (adr.equals("null")?"":" and ") + " price <= 200;";
	}else if(price.equals("mid_price")){
		sql = "select * from Hotel where " + query_adr + (adr.equals("null")?"":" and ") + " price > 200 and price <= 500;";
	}else if(price.equals("high_price")){
		sql = "select * from Hotel where " + query_adr + (adr.equals("null")?"":" and ") + " price > 500;";
	}
	else{
		sql = "select * from Hotel " + (adr.equals("null")?"":" where ") + query_adr;
	}
    stmt = conn.createStatement();  
    rs = stmt.executeQuery(sql);  
    while (rs.next()) {
       	out.println("<div class=\"row\">");
       	out.println("<div class=\"col-md-3\">");
	    out.println("<div class=\"items\"><img src=\"img/"+rs.getString("image")+ "\" height=100px  class=\"img-rounded\"></div> </div>");
	    out.println("<div class=\"col-md-3\">");
	    out.println("<a href=\"http://hotel.tuniu.com/detail/394573?checkInDate=2019-09-23&checkOutDate=2019-09-24\"><h3>"+rs.getString("name") +"</h3><small>" +rs.getString("description") +"</small></a></div>");
	    out.println("<div class=\"col-md-3\">");
	    out.println("<h4>&nbsp;&nbsp;&nbsp;"+rs.getString("pos")+"</h4></div>");
	    out.println("<div class=\"col-md-3\">");
	    out.println("<h4>&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getInt("price")+"</h4></div>");
	    out.println("</div><br>");
    }
}
else{
	out.println("Connect Failed !!");
}
%>
</body>
</html>