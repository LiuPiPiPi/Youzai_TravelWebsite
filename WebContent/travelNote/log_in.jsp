<html>
<!-- 注意这个要写咋html里面！ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<head>
<title>登入</title>
</head>
<body>
<center>



<%

Connection con = null;
Statement stm = null;
String url = "jdbc:mysql://localhost/travel";//数据库名称就是你的数据库名字
String driver = "com.mysql.jdbc.Driver"; //驱动类位置
String username = "root"; //数据库登录名称,此处写上你的用户名称
String pwd = "liubihao"; //数据库登录密码,此处写上你的登录密码
try
{
Class.forName(driver);
con = DriverManager.getConnection(url, username, pwd); //创建Connection连接对象
stm = con.createStatement(); //创建Statement 命令执行对象
}
catch (ClassNotFoundException e)
{
// TODO Auto-generated catch block
e.printStackTrace();
} catch (SQLException e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
int id=Integer.parseInt(request.getParameter("user_id")); //获取传过来的名称
String password=request.getParameter("password");//获取传过来的密码
String sql="select * from user where user_id = "+ id;
//数据库添加一条记录sql语句
ResultSet rs = stm.executeQuery(sql);
while(rs.next())
{
	out.println(password);
	out.println(rs.getString("password"));
	String user_name=rs.getString("user_name");
	String phoneNum=rs.getString("phoneNum");
	
	if(password.equals(rs.getString("password")))
	{   out.println("登陆成功");
	%>
		<% 
		request.getSession().setAttribute("user_id",id); //用Session保存用户id
		request.getSession().setAttribute("user_name",user_name); //保存用户名
		request.getSession().setAttribute("password",password); //保存密码
		request.getSession().setAttribute("phoneNum",phoneNum); //保存密码
		//response.sendRedirect("E:/tool2/tmlProjectFiles/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/travelLog/LOGs/1_13.jsp");
		response.sendRedirect("index.jsp");
		/*
		<form action="traveLog.jsp" method="GET">
		<input type="text" name="user_id">
		</form>*/
		%>
	<% 
	}
	else
	{
		%>
		<script>
			alert("密码错误！");
			window.location.href="log_in.html"
		</script>  
		<% 

		
	}
}

{
	%>
	<script>
		alert("用户错误！");
		window.location.href="log_in.html"
	</script>  
	<% 

	
}

//关闭数据库连接
stm.close();
con.close();
%>







</body>
</html>
 