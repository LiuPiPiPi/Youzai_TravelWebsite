<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>游记主页</title>
<meta name="description"
	content="Demo of Material design portfolio template" />
<!--    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;amp;lang=en" rel="stylesheet">-->
<link href="css/familyEn.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--	<link href="css/icon.css" rel="stylesheet">-->

<!--    <link href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" rel="stylesheet">-->
<link href="css/material.indigo-pink.min.css" rel="stylesheet">
<link href="styles/main.css" rel="stylesheet">

<link href="css/search_box.css" rel="stylesheet">
<link href="css/article_write_card.css" rel="stylesheet">


</head>

<body id="top">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

		<!--头部导航-->
		<header
			class="mdl-layout__header mdl-layout__header--waterfall site-header">

			<div class="mdl-layout__header-row site-logo-row">
				<span class="mdl-layout__title">
					<div class="site-logo"></div> <span class="site-description">游哉旅游网站</span>
				</span>
			</div>


			<!--			用了main.css的mdl-layout__header-row\site-navigation-row,网站头图片
mdl-layout--large-screen-only可能是远程搞文字字体的-->
			<div
				class="mdl-layout__header-row site-navigation-row mdl-layout--large-screen-only">
				<!--			前一个用了main.css的,后一个是远程css的字体-->
				<!--			四个导航栏目 转到href的链接-->
				<nav
					class="mdl-navigation mdl-typography--body-1-force-preferred-font">
					<a class="mdl-navigation__link" href="index.jsp">首页</a> <a
						class="mdl-navigation__link" href="travelLog.jsp">游记</a> <a
						class="mdl-navigation__link"
						href="http://www.ilovenpu.com/youzai/mokuai_2?tdsourcetag=s_pctim_aiomsg">论坛</a>
					<a class="mdl-navigation__link" href="../travelStrategy/b3_r1.jsp">旅游攻略</a>
				</nav>
			</div>
		</header>

		<!--		左侧弹出菜单drawer，只在小屏的时候使用，可以修改 -->
		<div class="mdl-layout__drawer mdl-layout--small-screen-only">
			<!--		  前一个main 后一个远程字体-->
			<nav
				class="mdl-navigation mdl-typography--body-1-force-preferred-font">
				<a class="mdl-navigation__link" href="index.jsp">首页</a> <a
					class="mdl-navigation__link" href="travelLog.jsp">游记</a> <a
					class="mdl-navigation__link"
					href="http://www.ilovenpu.com/youzai/mokuai_2?tdsourcetag=s_pctim_aiomsg">论坛</a>
				<a class="mdl-navigation__link" href="../travelStrategy/b3_r1.jsp">旅游攻略</a>
			</nav>

			<div class="MyCentericon">
				<!-- 个人中心   -->
				<div style="width: 30px; height: 30px; display: block;">
					<a href="log_in.html"> <img src="img/用户.png"
						style="width: 30px; height: 30px; display: block;">
					</a>
				</div>
			</div>

		</div>

		<!--		下拉隐藏 目前到这里 需要在上方引入css 来查看具体的功能！！！！！-->
		<main class="mdl-layout__content">
		<div class="site-content">
			<!--			进度！！！！ width 100% 和1200px-->
			<div class="container" style="width: 100%; float: left">


				<!--	jquery-->
				<div id="browserWidth" style="width: 1400px"></div>

				<script src="//libs.baidu.com/jquery/1.10.2/jquery.min.js">
					
				</script>
				<!--			  初始化界面的时候 不同浏览器的宽度不一样，要先用js获取 设置最大宽度并固定下来，之后用百分比设置组件，就不会自适应了-->
				<!--			  jquery也不能获取到全屏时的浏览器宽度，所以还是定为1500px固定值吧-->

				<script>
					//固定大小，不能删去
					$(document).ready(function() {
						var windowWidth1 = $(window.screen).width;
						var windowWidth = $("#browserWidth").width();
						//	1500px
						$("#fixWidth").css("width", windowWidth);

						var myw = screen.availWidth;
						var myh = screen.availHeight;
						window.moveTo(0, 0);
						window.resizeTo(myw, myh);
					});
				</script>

				<!--		<button>显示 div 元素的尺寸</button>	  -->


				<!--	###################################################布局现在不用变了就是缩小右侧 js文件可以删除####################################-->

				<!--栅格化的布局mdl-grid  下面两个实际上也能看作 mdl-cell?-->
				<!--			  new游记详情页可以自适应，而游记的左侧条目不能自适应大小,只能固定大小,因为图片固定333*250，自适应后边框！-->
				<div class=" site-max-width " id="fixWidth">

					<!--			总的list,靠左侧-->
					<div class="leftArea">
						<!--搜索框-->
						<div class="Scontainer">
							<!--这是搜索框-->
							<!-- 通过get搜索文章 ,点击图片 换一种函数写法 -->
							<form class="Sparent" method="get" id="searchForm">
								<input type="text" name="searchKey" id="tempInput"
									class="Ssearch" placeholder="搜索"> <img
									onClick='submit("travelLog.jsp")' src="img/search.png"
									class="Sbtn">
							</form>


						</div>





						<%
							//下面的内容是动态生成
							request.setCharacterEncoding("utf-8");

							int id = (Integer) request.getSession().getAttribute("user_id");//获取sesson的id
							String name = (String) request.getSession().getAttribute("user_name"); //用户名

							//数据库连接
							Connection con = null;
							Statement stm = null;
							String url = "jdbc:mysql://localhost/travel?useUnicode=true&characterEncoding=UTF-8";//数据库名称就是你的数据库名字
							String driver = "com.mysql.jdbc.Driver"; //驱动类位置
							String username = "root"; //数据库登录名称,此处写上你的用户名称
							String pwd = "liubihao"; //数据库登录密码,此处写上你的登录密码
							try {
								Class.forName(driver);
								con = DriverManager.getConnection(url, username, pwd); //创建Connection连接对象
								stm = con.createStatement(); //创建Statement 命令执行对象
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							ResultSet rs;
							int getFlag = 0, count = 0;
							//看看是否有get表单过来
							String searchKey = "";
							try {
								searchKey = request.getParameter("searchKey"); //是input的name属性
							} catch (Exception e) {
							}
							if (searchKey == null || searchKey == "")//没有传get来 	搜索全部
							{
								String sql = "select * from user_logs,user where user_logs.user_id=user.user_id  ORDER BY user_logs.user_id";
								rs = stm.executeQuery(sql);
							} else {
								//关键字搜索
								getFlag = 1;
								String sql = "select * from user_logs,user where user_logs.user_id=user.user_id and card_title like '%"
										+ searchKey + "%'";
								rs = stm.executeQuery(sql);
							}
							while (rs.next()) {
								if (getFlag == 0) {
									count++;
								}
								if (count == 9) {
									break;
								}
								String authorId = rs.getString("user_id");
								String log_id = rs.getString("log_id");
								String title = rs.getString("card_title");
								String authorName = rs.getString("user_name");
								String Abstract = rs.getString("card_abstract");
								String date = rs.getString("card_date");
								String imgUrl = rs.getString("card_imgUrl");
								String detailJsp = "logPage.jsp?user_id=" + authorId + "&log_id=" + log_id; //转到详情
								String authorJsp = "personPage.jsp?user_id=" + authorId; //传到用户的游记jsp的网页

								String user_id = "" + (request.getSession().getAttribute("user_id"));

								if (user_id == null) {
						%>
						<script>
							alert("请先登录！！！！");
							window.location.href = "log_in.html"
						</script>
						<%
							}

								//下面是动态生成  是复制personPage获取的
								String part1 = "<div class=\"mdl-shadow--4dp \" style=\"float: left;margin-bottom: 5%;border-radius: 5px;width:840px; \">"
										+ "		<img class=\"card-image-small divCenter\" style=\"display: inline-block\" src=";

								//+	imgUrl "img/portfolio9.jpg"

								String part1_2 = "  alt=\"\">" + "			" + "			"
										+ "        <div class=\"youji-card-table  \" style=\"display: inline-block;width:400px\">"
										+ "					<a href= ";

								//+logPage	详情"logPage.jsp?key1=id&key2=log_id"

								String part1_3 = " class=\"h3c\" style=\"padding-left: 40px;\">";

								//+card_title

								String part2 = "</a>" + "					<hrc></hrc>"
										+ "					<p class=\"youji-card-mainText\" style=\"width:370px;height:100px;\">"
										+ "<!--						字数最多70 因为图片设定了 330*250-->";

								//+ card_abstract 摘要

								String part3 = "<a style=\"font-size: 12px\" href=";

								//+logPage	详情"logPage.jsp?key1=id&key2=log_id"

								String part4 = ">详情";
								String part5 = "</a>" + "					</p>" + "<!--			左下角元素-->"
										+ "					<ul class=\"card-DescriptLeft\">"
										+ "<li style=\"display: inline-block;float: left\">" + "	<p class=\"card-DescriptLeft\" >"
										+ "		By - <a href=";

								//++作者的个人游记链接################

								String part5_2 = " class=\"l-blue\">";
								//作者一  +作者的用户名####

								String part5_3 = "</a>" + "	</p>" + "</li>"
										+ "						<li style=\"display: inline-block;float: left;padding-left: 50px;\">"
										+ "							  <img src=\"img/日历.png\" class=\"card-smallIcon\" alt=\"\">";
								//+日期

								String part6 = "						</li>" + "					</ul>" + "<!--			右下角元素-->"
										+ "					<ul class=\"post-mate DescriptRight\" >"
										+ "						<li class=\"浏览量\" style=\"display: inline-block;float: left;padding-right: 20px;\">"
										+ "								<img src=\"img/浏览.png\" class=\"card-smallIcon\" alt=\"\">";

								//+浏览量 int		5500

								String part7 = "						</li >" + "					</ul>" + "		</div>"
										+ "		</div>";
								try {
									//PrintWriter pw = new PrintWriter(new FileOutputStream(filename));
									//写入，全部html文件

									int randomInt = (int) (1 + Math.random() * (100 - 1 + 1));//1-100的随机数

									out.print(part1);
									out.print(imgUrl);
									out.print(part1_2);
									out.print(detailJsp);
									out.print(part1_3);
									out.print(title);
									out.print(part2);
									out.print(Abstract);
									out.print(part3);
									out.print(detailJsp);
									out.print(part4);
									out.print(part5);
									out.print(authorJsp);
									out.print(part5_2);
									out.print(authorName);
									out.print(part5_3);
									out.print(date);
									out.print(part6);
									out.print(randomInt);
									out.print(part7);

								} catch (IOException e) {
									out.println(e.getMessage());
								}

							}

							//关闭数据库连接
							stm.close();
							con.close();
						%>



						<%
							//动态生成
						%>





						<!--		list的结束-->
						<div style="margin-bottom: 10%"></div>

					</div>


					<!--				  右侧布局-->
					<div class="rightArea mdl-layout--large-screen-only">

						<div class="cardBox">
							<div class="bodyBox"
								style="border-right: thin; border-right-style: solid">
								<a href="textEditor.jsp"><img src="img/填写.png" alt="填写按钮"
									class="boxImg"></a>
								<p>
									<a title="写游记" href="textEditor.jsp" style="color: black">写游记</a>
								</p>
							</div>
							<div class="bodyBox">
								<img src="img/关注.png" alt="关注按钮" class="boxImg">
								<p>
									<a title="个人中心" style="color: black">个人中心</a>
								</p>
							</div>
							<div class="footBox" style="height: 60px">
								<img src="img/草稿.png" alt="草稿按钮" class="boxImg"
									style="float: left; margin-left: 25%; padding-top: 13px;">
								<p style="text-indent: 20px">
									<a title="草稿" style="color: black; font-size: 18.75px;"
										href="personPage.jsp">我的游记</a>
								</p>
							</div>
						</div>


						<br>
						<br>
						<br>
						<br>
						<br>
						<div style="width: 400px">
							<div class="authorPadding mdl-shadow--2dp mdl-list"
								style="list-style: decimal">
								<div class="h3c ">热点旅游信息/文章</div>
								<a
									class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-list__item"
									href="logPage.jsp?user_id=1&log_id=1">热点一</a> <a
									class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-list__item"
									href="logPage.jsp?user_id=1&log_id=2">热点二</a> <a
									class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-list__item"
									href="logPage.jsp?user_id=1&log_id=3">热点三</a> <a
									class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-list__item"
									href="logPage.jsp?user_id=1&log_id=4">热点四</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!--			页脚--> <footer class="mdl-mini-footer" style="width: 100%">
			<div class="footer-container">
				<div class="mdl-logo">
					&copy; Unitiled. More Templates <a href="#" target="_blank"
						title="模板之家">游记</a> - Collect from <a href="#" title="网页模板"
						target="_blank">游记</a>
				</div>
				<ul class="mdl-mini-footer__link-list">
					<li><a href="#">Privacy & Terms</a></li>
				</ul>
			</div>
		</footer> </main>
		<script src="https://code.getmdl.io/1.3.0/material.min.js" defer></script>
	</div>

</body>

<script>
	function submit(path) {
		$('searchForm').action = path;
		$('searchForm').submit();
	}
</script>

</html>



