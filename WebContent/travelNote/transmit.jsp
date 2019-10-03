<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<% //用户点击保存，此页面生成用户游记详情页文件并保存，并访问logPage.jsp 实现跳转 所以这个页面是个中转站 %>

<%  int id=(Integer)request.getSession().getAttribute("user_id");//获取sesson的id%>
<%  String phoneNum = (String)request.getSession().getAttribute("phoneNum"); %>

<%!  int count;%>
<%!  int nextIndex;%>


<% 
request.setCharacterEncoding("utf-8"); //new

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

if(rs.next())
{ 
	count=rs.getInt(1);
	nextIndex=count+1;
}
else{ 
	out.println("错误");
}

%>



<html>
<%
	//创建和写文件
	request.setCharacterEncoding("utf-8");
	String info = request.getParameter("all");
	
	String imgUrl = request.getParameter("imgUrl"); //地址 name属性名称
	String title = request.getParameter("title");   //标题
	

	String Abstract = request.getParameter("Abstract"); //摘要
 
	String date = request.getParameter("date"); //日期
	
	String allInfoStr = request.getParameter("allInfoStr"); //位置描述信息

	String head="<!DOCTYPE html>"+
			"<html>"+
			"<head>"+
			"<meta charset=\"UTF-8\">"+
			"<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">"+
			"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"+
			"<title>游记详情</title>"+
			"<meta name=\"description\" content=\"Your portfolio page description\"/>"+
			"<!--    <link href=\"https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;amp;lang=en\" rel=\"stylesheet\">-->"+
			"<link href=\"css/familyEn.css\" rel=\"stylesheet\">"+
			"<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">"+
			"<link href=\"css/material.indigo-pink.min.css\" rel=\"stylesheet\">"+
			"<!--    <link href=\"https://code.getmdl.io/1.3.0/material.indigo-pink.min.css\" rel=\"stylesheet\">-->"+
			"<link href=\"styles/main.css\" rel=\"stylesheet\">"+
			"</head>"+
			"<body id=\"top\">"+
			"<div class=\"mdl-layout mdl-js-layout mdl-layout--fixed-header\">"+
			"<!--		浏览器头部 图标和标签栏 header -->"+
			"    <header class=\"mdl-layout__header mdl-layout__header--waterfall site-header\">"+
			"        <div class=\"mdl-layout__header-row site-logo-row\">"+
			"<!--			用了main.css的site-logo,网站头图片-->"+
			"			<span class=\"mdl-layout__title\">"+
			"            <div class=\"site-logo\"></div>"+
			"            <span class=\"site-description\">游哉旅游网站</span></span>"+
			"		  </div>"+
			"          "+
			"        <div class=\"mdl-layout__header-row site-navigation-row mdl-layout--large-screen-only\">"+
			"<!--			前一个用了main.css的,后一个是远程css的字体-->"+
			"<!--			四个导航栏目 转到href的链接-->"+
			"          <nav class=\"mdl-navigation mdl-typography--body-1-force-preferred-font\">"+
			"			  <a class=\"mdl-navigation__link\" href=\"index.jsp\">首页</a>"+
			"			  <a class=\"mdl-navigation__link\" href=\"travelLog.jsp\">游记</a>"+
			"			  <a class=\"mdl-navigation__link\" href=\"http://www.ilovenpu.com/youzai/mokuai_2?tdsourcetag=s_pctim_aiomsg\">论坛</a>"+
			"			  <a class=\"mdl-navigation__link\" href=\"../travelStrategy/b3_r1.jsp\">旅游攻略</a>"+
			"            </nav>"+
			"        </div>"+
			"        "+
			"      </header>"+
			"		"+
			"<!--		左侧弹出菜单drawer，只在小屏的时候使用，可以修改 -->"+
			"      <div class=\"mdl-layout__drawer mdl-layout--small-screen-only\">"+
			"<!--		  前一个main 后一个远程字体-->"+
			"        <nav class=\"mdl-navigation mdl-typography--body-1-force-preferred-font\">"+
			"			<a class=\"mdl-navigation__link\" href=\"index.jsp\">首页</a>"+
			"			<a class=\"mdl-navigation__link\" href=\"travelLog.jsp\">游记</a>"+
			"			<a class=\"mdl-navigation__link\" href=\"http://www.ilovenpu.com/youzai/mokuai_2?tdsourcetag=s_pctim_aiomsg\">论坛</a>"+
			"			<a class=\"mdl-navigation__link\" href=\"../travelStrategy/b3_r1.jsp\">旅游攻略</a>"+
			"        </nav>"+
			"          "+
			"        <div class=\"MyCentericon\">      <!-- 个人中心   -->"+
			"            <div style=\"width:30px;height:30px;display: block;\">"+
			"                <img src=\"img/用户.png\" style=\"width:30px; height:30px; display: block;\">"+
			"            </div>	"+
			"        </div> "+
			"          "+
			"        </div>"+
			"<!--	下拉隐藏-->"+
			"  <main class=\"mdl-layout__content\">"+
			"	 "+
			"		"+
			"		"+
			"      <div class=\"mdl-grid site-max-width \"  id=\"fixWidth\"><!--使用居中部分 设置最大宽度900-->"+
			"		  "+
			"<!--		  左侧-->"+
			"        <div class=\"leftArea\">"+
			"          <div class=\"mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp page-content \"  style=\" width:840px; \" >"+
			"            ";

				
	//这里加入string date
	
	String bottom="	  "+
			"			  "+
			"          </div>";
			
			

	
	String mapButton_1="<a href=";
	
	//加入地图链接
	//++mapButton="  "		String  mapButtonJsp="logPageMap.jsp?user_id="+id+"&log_id="+nextIndex;
	
	String mapButton_2=
	">"+
	"	<input type=\"button\" class=\"mdl-button mdl-button--raised mdl-js-button mdl-js-ripple-effect mdl-button--accent\" style=\"float: right;margin-top:10px;margin-right: 10%\" value=\"查看地图\" >"+
	"	</a>"+


			"        </div>"+
			"		"+
			"<!--		右侧-->"+
			"        <div class=\"rightArea mdl-layout--large-screen-only\">"+
			"			"+
			"<!--			<div class=\"demo-card-image mdl-card mdl-shadow--2dp person1\">-->"+
			"				"+
			"		"+
			"<!--"+
			"				<div class=\"mdl-cell mdl-cell--4-col\">"+
			"				</div>"+
			"-->"+
			"		<div class=\"mdl-shadow--2dp\" style=\"float: left\">"+
			"			<div class=\"authorPadding\" style=\"float:left\">"+
			"				<div class=\"author-image mdl-shadow--2dp person1 \" style=\"width:120px;height:120px\">"+
			"				  <div class=\"mdl-card__title mdl-card--expand\"></div>"+
			"				  <div class=\"mdl-card__actions\">"+
			"					<span class=\"demo-card-image__filename\" style=\"position: relative;bottom: -50px;\">";
			
	

	String bottom2= "</span>"+
			"				  </div>	"+
			"				</div>"+
			"			</div>"+
			"			<div class=\"authorPadding\" style=\"width:250px;float:left\">"+
			"				<div style=\" word-wrap: break-word;\"> <p>";
			
	String userInfo="作者联系方式：";
	
	//+    phoneNumber
	
	String path = "               -游哉-";
	
	String bottom3=		"		</p></div>"+
			"			</div>"+
			"			"+
			"		  <div class=\"mdl-cell mdl-cell--6-col mdl-card__supporting-text \" style=\"float: left\"> <a class=\"mdl-button mdl-button--raised mdl-js-button mdl-js-ripple-effect mdl-button--accent\" href=";

//++++++++++++个人中心链接
			
	String bottom4=
			">ta的中心<span class=\"mdl-button__ripple-container\"><span class=\"mdl-ripple\"></span></span> </a> </div>"+
			"		  <div class=\"mdl-cell mdl-cell--6-col mdl-card__supporting-text \" style=\"float: left\"> <a class=\"mdl-button mdl-button--raised mdl-js-button mdl-js-ripple-effect mdl-button--primary\" href=";
	
//+用户的游记链接		
	String bottom5=
			">ta的游记<span class=\"mdl-button__ripple-container\"><span class=\"mdl-ripple\"></span></span> </a> </div>"+
			"			"+
			"				"+
			"			</div>"+
			"			"+
			"			"+
			"        </div>"+
			"	  "+
			"	  "+
			"  "+
			"    </div>"+
			"	"+
			"<!--	页尾-->"+
			"    <footer class=\"mdl-mini-footer\">"+
			"      <div class=\"footer-container\">"+
			"        <div class=\"mdl-logo\">&copy; Unitiled. More Templates <a href=\"http://www.cssmoban.com/\" target=\"_blank\" title=\"模板之家\">游记</a> - Collect from <a href=\"http://www.cssmoban.com/\" title=\"网页\" target=\"_blank\">游记</a></div>"+
			"        <ul class=\"mdl-mini-footer__link-list\">"+
			"          <li><a href=\"#\">Privacy & Terms</a></li>"+
			"        </ul>"+
			"      </div>"+
			"    </footer>"+
			"  </main>"+
			"  <script src=\"https://code.getmdl.io/1.3.0/material.min.js\" defer></script> "+
			"</div>"+
			"</body>"+
			"</html>";
	
	String savename ="./LOGs/"+id+"_"+nextIndex+".html"; //文件名
	//文件路径应该变,但是感觉必须这个路径
	String filename = request.getRealPath(savename); //保存文件
	//String h = request.getContextPath(savename);
	
	
	
	//数据库插入一条信息
	//execute("insert  into  student  values('"+name+"','"+age+"','"+introduce+"')"

	String insertSQL ="INSERT INTO user_logs VALUES ('"+nextIndex+"' , '"+id+"' , '"+imgUrl+"' , '"+title+"' ,'"+Abstract+"' , '"+date+"')";
	stm.execute(insertSQL); //执行插入
	
	
//new#####写在这里 数据库插入位置信息
	if(allInfoStr != null && allInfoStr!="" && nextIndex!=0)//不为空，有参数, 而且文章log_id正常
{
	System.out.print(allInfoStr);
	
	String[] strArr = allInfoStr.split(";",-1);  //集合 注意 加了-1才能不忽略空值
    System.out.println(strArr.length); //4*n+1
  
    
    //待修改！！###########################################
    int j=0;
   	for (int i=0; i<=strArr.length-4 ;i+=4 ) //解析字符串到data_info 注意好循环的执行次数！
   	{
   		int index=Integer.parseInt(strArr[i]);
    	double lng=Double.parseDouble(strArr[i+1]);//维度
    	double lat=Double.parseDouble(strArr[i+2]);//经度
    	String describe=strArr[i+3];//描述
    	String insertSQL2 ="INSERT INTO location VALUES ('"+index+"' , '"+lng+"' , '"+lat+"' , '"+describe+"' ,'"+nextIndex+"','"+id+"')";
    	stm.execute(insertSQL2); //执行插入  坐标数据
   	}

   	
}
	
	
	
	java.io.File f = new java.io.File(filename);
	if(!f.exists())//如果文件不存，则建立
	{
		System.out.println(filename);
		f.createNewFile();
	}

	try
	{
		
		String  mapButtonJsp="logPageMap.jsp?user_id="+id+"&log_id="+nextIndex;
		String myLogs="personPage.jsp?user_id="+id;
		String user_name=(String)request.getSession().getAttribute("user_name");//获取sesson的id
		
		PrintWriter pw = new PrintWriter(new FileOutputStream(filename));
		//写入，全部html文件
		pw.println(head);//写入之前的html
		
		pw.println("<div style=\"margin-left:5%;margin-right:5%;\">");
		
		pw.println(info);//写入用户编辑的内容
		pw.println(date);
		pw.println(path);
		
		pw.println("</div>");
		
		pw.println(bottom);//写入之后的html
		pw.println(mapButton_1);
		pw.println(mapButtonJsp); //地图的链接
		pw.println(mapButton_2);
		pw.println(user_name);
	
		pw.println(bottom2);
		pw.println(userInfo);
		
		pw.println(phoneNum); //联系方式
		pw.println(bottom3);
		//##############加入个人中心
		pw.println(bottom4);
		pw.println(myLogs);
		pw.println(bottom5);

		pw.close();
		
	} catch(IOException e) {
	out.println(e.getMessage());
}
	
	
	//关闭数据库连接
	stm.close();
	con.close();
	
	
	//response.sendRedirect(filename);
	//读文件
	/*
	java.io.FileReader fr = new java.io.FileReader(f);
	char[] buffer = new char[100];
	int length; //读出的字符数(一个中文为一个字符)
	//读文件内容
	out.write(filename+"<br>");
	
	while((length=fr.read(buffer))!=-1) {
	//输出
	out.write(buffer,0,length);
	}
	fr.close();*/
	//修改 读文件的操作在logPage.jsp实现，不然这个页面一刷新会新建文章
	
	String detailJsp="logPage.jsp?user_id="+id+"&log_id="+nextIndex;
	response.sendRedirect(detailJsp);//转到中转浏览站
	
	

	
%>

</html>


<script>
//固定大小，不能删去
$(document).ready(function(){
    var windowWidth1=$(window.screen).width;
	var windowWidth=$("#browserWidth").width();
//	1500px
    $("#fixWidth").css("width",windowWidth);
	
var myw = screen.availWidth; 
var myh = screen.availHeight; 
window.moveTo(0, 0); 
window.resizeTo(myw, myh); 
});
</script>