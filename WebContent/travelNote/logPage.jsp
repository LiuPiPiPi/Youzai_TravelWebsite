<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%//显示 user_id + log_id 的游记详情界面,文件读取显示器  需要传入两个get参数user_id、log_id%>
 <%
 	request.setCharacterEncoding("utf-8"); //new  看是否能解决数据库乱码
 
 	int user_id = Integer.parseInt(request.getParameter("user_id"));
 	int log_id = Integer.parseInt(request.getParameter("log_id")); 
   
	String savename ="./LOGs/"+user_id+"_"+log_id+".html"; //文件名
	String filename = request.getRealPath(savename);
	
	java.io.File f = new java.io.File(filename);

	
	java.io.FileReader fr = new java.io.FileReader(f);
	
	InputStreamReader isr = new InputStreamReader(new FileInputStream(new File(filename)), "UTF-8");
	BufferedReader br = new BufferedReader(isr);
	
	char[] buffer = new char[100];
	int length; //读出的字符数(一个中文为一个字符)
	//读文件内容
	//out.write(filename+"<br>");
	
	while((length=fr.read(buffer))!=-1) {
	//输出
		out.write(buffer,0,length);
	}
	fr.close();




%>



	