<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%//显示#他人的#游记卡片界面   user_id  需要传入一个get参数user_id %>

<!DOCTYPE html>
<html lang="en-US">
  <head>
  	<meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>游记主页</title>
<!--    <meta name="description" content="Demo of Material design portfolio template"/>-->
<!--    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;amp;lang=en" rel="stylesheet">-->
	<link href="css/familyEn.css" rel="stylesheet">
	  
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--	<link href="css/icon.css" rel="stylesheet">-->
	  
<!--    <link href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" rel="stylesheet">-->
	<link href="css/material.indigo-pink.min.css" rel="stylesheet">
    <link href="styles/main.css" rel="stylesheet">
	<link href="css/search_box.css" rel="stylesheet">
	<link href="css/article_write_card.css" rel="stylesheet">
	  
	  
  </head>
	
	
  <body id="top">
<!--	邮箱-->
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<a href="contact.html" id="contact-button" class="mdl-button mdl-button--fab mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--accent mdl-color-text--accent-contrast mdl-shadow--4dp"><i class="material-icons">mail</i></a>
		
<!--头部导航-->
      <header class="mdl-layout__header mdl-layout__header--waterfall site-header">
        <div class="mdl-layout__header-row site-logo-row"><span class="mdl-layout__title">
            <div class="site-logo"></div>
			<span class="site-description">游哉旅游网站</span></span></div>
			
		<div class="MyCentericon">
				<div style="width:100px;height:100px;display: block;">
					<img src="img/用户.png" style="width:50px;height:50px;display: block;padding-left: 25px;padding-top:0px;">


<!--
					<div style="width:200px;height:50px;display: block;text-align:center;">登录/注册/个人中心
					</div>
-->
				</div>	
		</div> 
<!--		  下一步 小屏幕也显示 删除large only-->
        <div class="mdl-layout__header-row site-navigation-row mdl-layout--large-screen-only">
          <nav class="mdl-navigation mdl-typography--body-1-force-preferred-font"><a class="mdl-navigation__link" href="index.html">首页</a><a class="mdl-navigation__link" href="travelLog.jsp">游记</a><a class="mdl-navigation__link" href="about.html">论坛</a><a class="mdl-navigation__link" href="contact.html">旅游攻略</a>
          </nav>
        </div>
      </header>

		
<!--		下拉隐藏 目前到这里 需要在上方引入css 来查看具体的功能！！！！！-->
      <main class="mdl-layout__content">
        <div class="site-content">
<!--			进度！！！！ width 100% 和1200px-->
          <div class="container" style="width:100% ;float: left">
			  
	
<!--	jquery-->
			  <div id="browserWidth" style="width: 1400px"> </div>


  
<!--		<button>显示 div 元素的尺寸</button>	  -->
			  
			  
<!--	###################################################布局现在不用变了就是缩小右侧 js文件可以删除####################################-->
			  
			  <!--栅格化的布局mdl-grid  下面两个实际上也能看作 mdl-cell?-->
<!--			  new游记详情页可以自适应，而游记的左侧条目不能自适应大小,只能固定大小,因为图片固定333*250，自适应后边框！-->
			  <div class=" site-max-width " id="fixWidth" style="min-width: 1400px;">
				  
				  <!--			总的list,靠左侧-->
   				 <div class="leftArea">
<!--搜索框-->


		<h3>我的游记</h3>


<% 
//int id=(Integer)request.getSession().getAttribute("user_id");//获取sesson的id

int id = Integer.parseInt(request.getParameter("user_id"));
String name=(String)request.getSession().getAttribute("user_name"); //用户名
//数据库连接
Connection con = null;
Statement stm = null;
String url = "jdbc:mysql://localhost/travel?useUnicode=true&characterEncoding=UTF-8";//数据库名称就是你的数据库名字
String driver = "com.mysql.jdbc.Driver"; //驱动类位置
String username = "root"; //数据库登录名称,此处写上你的用户名称
String pwd = "zzxx1122"; //数据库登录密码,此处写上你的登录密码
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

String sql="select * from user_logs where user_id = "+ id +" order by log_id";
//数据库添加一条记录sql语句
ResultSet rs = stm.executeQuery(sql);





while(rs.next())
{ 
	String imgUrl=rs.getString("card_imgUrl");
	String title=rs.getString("card_title");
	String Abstract=rs.getString("card_abstract");
	String date=rs.getString("card_date");
	int log_id=rs.getInt("log_id");

	
	String savename ="./LOGs/"+id+"_"+log_id+".html"; //文件名
	String filename = request.getRealPath(savename);

	String detailJsp = "logPage.jsp?user_id="+id+"&log_id="+log_id; //传到jsp的网页
	//www.w3cschool.cn/hello?key1=value1&key2=value2


String part1=
		"<div class=\"mdl-shadow--4dp \" style=\"float: left;margin-bottom: 5%;border-radius: 5px;\">"+
		"<!--			     inline bolck 强行一行并列-->"+
		"		<img class=\"card-image-small divCenter\" style=\"display: inline-block\" src=";

		
//	imgUrl "img/portfolio9.jpg"
String part1_2=
		"alt=\"\">"+
		"<!--        	</div>-->"+
		"			"+
		"			"+
		"        <div class=\"youji-card-table  \" style=\"display: inline-block;width:400px\">"+
		"					<a href= ";
		
//logPage	"logPage.jsp?key1=id&key2=log_id"

String part1_3	=" class=\"h3c\" style=\"padding-left: 40px;\">";
//card_title
String part2="</a>"+
		"					<hrc></hrc>"+
		"					<p class=\"youji-card-mainText\" style=\"width:370px;height:100px;\">"+
		"<!--						字数最多80 因为图片设定了 300*250-->";
//card_abstract
String part3="<a style=\"font-size: 12px\" href=\"游记详情.html\">";
//详情

String part4="详情";
String part5=
		"</a>"+
		"					</p>"+
		"<!--			左下角元素-->"+
		"					<ul class=\"card-DescriptLeft\">"+
		"<!--								inline-block 和float 一行显示-->"+
		"						<li style=\"display: inline-block;float: left;padding-left: 50px;\">"+
		"							  <img src=\"img/日历.png\" class=\"card-smallIcon\" alt=\"\">";
//日期
String part6="						</li>"+
		"					</ul>"+
		"<!--			右下角元素-->"+
		"					<ul class=\"post-mate DescriptRight\" >"+
		"						<li class=\"浏览量\" style=\"display: inline-block;float: left;padding-right: 20px;\">"+
		"								<img src=\"img/浏览.png\" class=\"card-smallIcon\" alt=\"\">5500"+
		"						</li >"+
		"					</ul>"+
		"		</div>"+
		"		</div>";

		try
		{
			//PrintWriter pw = new PrintWriter(new FileOutputStream(filename));
			//写入，全部html文件
			
			out.print(part1);
			out.print(detailJsp);
			out.print(part1_2);
				out.print(imgUrl);
			out.print(part1_3);
				out.print(title);
			out.print(part2);
				out.print(Abstract);
			out.print(part3);
			out.print(part4);
			out.print(part5);
				out.print(date);
			out.print(part6);

				
		} catch(IOException e) {
		out.println(e.getMessage());
	}


}


%>


    


					 
		
		
<!--		list的结束-->
<div style="margin-bottom: 10%">
					 </div>
		
</div>

				  
				  <!--				  右侧布局-->
			    <div class="rightArea mdl-layout--large-screen-only" >

				<div class="cardBox" style="height: 100px">
						  <div class="bodyBox" style="border-right:thin;border-right-style: solid"><a href="textEditor.html"><img src="img/填写.png"  alt="填写按钮" class="boxImg"></a>
						<p><a title="写游记" href="textEditor.html" style="color: black" >写游记</a></p>
					  </div>
						  <div class="bodyBox"> <img src="img/关注.png" alt="关注按钮" class="boxImg">
						<p><a title="我的关注"  style="color: black" >我的关注</a></p>
					  </div>
					
				</div>


					 
				<br><br><br><br><br>
					<div style="width:400px" >
				<div class="authorPadding mdl-shadow--2dp mdl-list" style="list-style: decimal">
					<div class="h3c " >热点旅游信息/文章</div>
					<a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-list__item" href="游记详情.html">热点一</a>
					<a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-list__item" href="游记详情.html">热点二</a>
					<a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-list__item" href="游记详情.html">热点三</a>
					<a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-list__item" href="游记详情.html">热点四</a>
				</div>
				</div>
	 				</div>
				  </div>
	
			  </div>
		  </div>
			
		  
<!--			页脚-->
        <footer class="mdl-mini-footer" style="width: 100%">
          <div class="footer-container">
            <div class="mdl-logo">&copy; Unitiled. More Templates <a href="#" target="_blank" title="模板之家">游记</a> - Collect from <a href="#" title="网页模板" target="_blank">游记</a></div>
            <ul class="mdl-mini-footer__link-list">
              <li><a href="#">Privacy & Terms</a></li>
            </ul>
          </div>
        </footer>
      </main>
      <script src="https://code.getmdl.io/1.3.0/material.min.js" defer></script>
    </div>
		
  </body>
</html>