<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%//用户编辑自己的游记详情 %>
<% 
request.setCharacterEncoding("utf-8"); //new  看是否能解决数据库乱码

int id=(Integer)request.getSession().getAttribute("user_id");//获取sesson的id
String name=(String)request.getSession().getAttribute("user_name"); //用户名
//数据库连接
Connection con = null;
Statement stm = null;
String url = "jdbc:mysql://localhost/travel?useUnicode=true&characterEncoding=UTF-8";//数据库名称就是你的数据库名字
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

String sql="select count(*) from user_logs where user_id = "+ id;
//数据库添加一条记录sql语句
ResultSet rs = stm.executeQuery(sql);
int nextIndex=0;
if(rs.next())
{ 
	int count=rs.getInt(1);
	nextIndex=count+1; //这一篇文章的log_id
	}
else{ 
	out.println("错误");
}



// 看看是否有post表单过来
String allInfoStr="";

try
{
	allInfoStr = request.getParameter("allInformation"); //是input的name属性
}
catch (Exception e)
{

} 
if(allInfoStr==null)
{
	allInfoStr="";
}
//这里插入失败了 因为position表中的外键是log_id 先建立了文章才能建立坐标！
/*
//不为null 不是不为""
if(allInfoStr != null && nextIndex!=0)//不为空，有参数, 而且文章log_id正常
{
	out.print(allInfoStr);
	
	String[] strArr = allInfoStr.split(";",-1);  //集合 注意 加了-1才能不忽略空值
    System.out.println(strArr.length); //4*n+1
  
    for (int i = 0; i < strArr.length/4; i++){
    	int index=Integer.parseInt(strArr[i]);
    	double lng=Double.parseDouble(strArr[i+1]);//维度
    	double lat=Double.parseDouble(strArr[i+2]);//经度
    	String describe=strArr[i+3];//描述
    	String insertSQL ="INSERT INTO location VALUES ('"+index+"' , '"+lng+"' , '"+lat+"' , '"+describe+"' ,'"+nextIndex+"')";
    	stm.execute(insertSQL); //执行插入  坐标数据
    }
}
*/














//关闭数据库连接
stm.close();
con.close();
%>




<!DOCTYPE html>
<html lang="en-US">
<meta charset="UTF-8">
<head>
    <title>游记编辑器</title>
	<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
	<link href="css/eidtorCss/froala_editor.min.css" rel="stylesheet" type="text/css">

    <style>
        body {
            text-align: center;
            background-image: url("Editor/img/text_background.png");
            background-size: cover;
            background-repeat: no-repeat;
        }

        section {
            width: 80%;
            margin: auto;
            text-align: left;
        }
    </style>
</head>

<body>




  <section id="editor" style="margin-top: 30px;width:800px">
      <div id="edit" >
        <div id="id">
	        <h2 id="h2id">请在此编辑标题</h2>
	        <p>请插入一张封片图片</p>
	        <p id="AbstractInput">(请在此框内输入正文)<p>
	      </div>
      </div>
      
      <div id="tishi">
    	<form action="transmit.jsp" method="post" >
        <input type="text" name="all" id="tempInput" style="display:none">
        <input type="text" name="imgUrl" id="imgUrl" style="display:none">
        <input type="text" name="title" id="title" style="display:none">
        <input type="text" name="Abstract" id="Abstract" style="display:none">
        <input type="text" name="date" id="date" style="display:none">
        
        <input type="text" name="allInfoStr" style="display:none" value="<%=allInfoStr %>">
        <br>
         <input type="submit" onClick="httpPost()" style="color: black; font-size: 15px; font-weight: 1000; background-color: rgba(255,217,171,1.00); width:100px; height:50px;" value="保存提交">
 		</form>
 	  </div>
  </section>
	
<div style="width:200px;height: 200px;position: absolute;right:10%;top:50px">
	<a href="Editor/editMap.jsp" style="color: black; font-size:20px; text-decoration: none" >请先定位
	<img src="Editor/img/map.png" style="width:50px; height:50px" alt="">
	</a>
	<a href="travelLog.jsp">
        <input type="button" style="color: black; font-size: 15px; font-weight: 1000; background-color: rgba(255,217,171,1.00); width:100px; 
            height:50px; margin-top: 20px;" value="返回游记页" >
	</a>
</div>
	
   <script>
        function httpPost(){
        	//获取编辑器全部内容，id
            var name = document.getElementById("id").innerHTML;
            var temp=document.getElementById("tempInput");
       
            temp.value=name;
           // alert(name);
           //这一步是把innerHTML 保存到隐藏的 input  在把imput的内容post到后端 
           
           //这是获取到用户输入的
           var imgUrl = document.body.getElementsByTagName("img")[0].src;//图片地址
           var title=document.getElementsByTagName("h2")[0].textContent.substring(0,30);//标题
           // var title=document.getElementById("h2id").innerHTML; //摘要
        var Abstract=document.getElementById("AbstractInput").textContent.substring(1,80)+"...";    
		   //var Abstract=document.getElementById("AbstractInput").innerHTML.substring(1,80); //摘要
		   // var Abstract=document.getElementsByTagName("p")[0].innerHTML.substring(0,70);//标题
		   var date=getNowFormatDate();
	//alert(imgUrl);alert(title);alert(Abstract);alert(date); 提示信息
			
			//这是获取id的输入框，之后要加入东西
		   var tempUrl=document.getElementById("imgUrl");
		   var tempTitle=document.getElementById("title");
		   var tempAbstract=document.getElementById("Abstract");
		   var tempDate=document.getElementById("date");

		  
		   //进行赋值，之后传输
		   tempUrl.value=imgUrl;
		   tempTitle.value=title;
		   tempAbstract.value=Abstract;
		   tempDate.value=date;
        }
        
        
        function getNowFormatDate() { //获取日期
            var date = new Date();
            var seperator1 = "-";
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            return currentdate;
        }
   </script>

  <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
  <script src="Editor/js/froala_editor.min.js"></script>
  <!--[if lt IE 9]>
    <script src="../js/froala_editor_ie8.min.js"></script>
  <![endif]-->
  <script src="Editor/js/plugins/tables.min.js"></script>
  <script src="Editor/js/plugins/lists.min.js"></script>
  <script src="Editor/js/plugins/colors.min.js"></script>
  <script src="Editor/js/plugins/media_manager.min.js"></script>
  <script src="Editor/js/plugins/font_family.min.js"></script>
  <script src="Editor/js/plugins/font_size.min.js"></script>
  <script src="Editor/js/plugins/block_styles.min.js"></script>
  <script src="Editor/js/plugins/video.min.js"></script>

  <script>
      $(function(){
          $('#edit').editable({inlineMode: false, alwaysBlank: true})
      });
  </script>
</body>
</html>
