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
	String city = request.getParameter("city");
	String route = request.getParameter("route");
	String xcity="";
	String xroute="";
	System.out.println(route);
	if(city.equals("null")) {
		xcity="";
	}
	else {
		xcity="city = "+"\""+city+"\"";
	}
	if(route.equals("null")) {
		xroute="";
	}
	else {
		xroute="route =" + "\"" + route + "\"";
	}
	String sql="select * from user2" + (xcity.equals("")&&xroute.equals("")?"":" where ") + xcity + (xcity.equals("")||xroute.equals("")?"":" and ") + xroute;

    stmt = conn.createStatement();  
    rs = stmt.executeQuery(sql);
     int count=0;
 	    while (rs.next()) {
 	    	if(count%4==0) {
 	    		out.println("<div class=\"row\">");
 	    	}
 	    	out.println("<div class=\"col-md-3\">");
	    	out.println("<div class=\"thumbnail "+city+" "+route+" \" style=\"text-align:center\">");
 	    	out.println("<img src=\"img/"+rs.getString("image")+"\" alt=\"无头像\" width=\"100\" height=\"100\">");
 	    	out.println("<div class=\"caption\">");
 	    	out.println("<h3>"+rs.getString("name")+"</h3>");
 	    	out.println("<p>"+rs.getString("character")+"</p>");
 	    	out.println("<p>"+"tel: "+rs.getString("tel")+"</p>");
 	    	out.println("</div></div></div>");
 	    	count++;
 	    	if(count%4==0) {
 	    		out.println("</div>");
 	    	}

 	    }
 	     if(count==0) {
      	out.println("<h2 style=\"margin-left:295px\">很抱歉！未搜索到驴友！</h2>");
      }
//     //out.println("</div>");
}
else{
	out.println("Connect Failed !!");
}
%>
</body>
</html>