<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>寻找同行驴友</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel='stylesheet' type='text/css' media='screen' href='main.css'>
<link href="css/self.css" rel='stylesheet'>
<script src='main.js'></script>
</head>
<body onLoad="javascript:document.form.reset()">
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
   <div _ngcontent-deepmind-website-c2="" class="header-container">
        <div _ngcontent-deepmind-website-c2="" class="menu-wrapper">
            <br><br>
            <nav _ngcontent-deepmind-website-c2="">
                <ul _ngcontent-deepmind-website-c2="" class="pages" align="center">
                    <li _ngcontent-deepmind-website-c2=""><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="../travelNote/index.jsp">
                        <img src="img/logo.png" width=50px height=50px ></a></li>
                    <li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="b3_r1.jsp"> 旅游路径规划 </a></li>
                    <li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="b3_r2.jsp"> 酒店吃住安排 </a></li>
                    <li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="b3_r3.jsp"> 景点门票查看 </a></li>
                    <li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="b3_r4.jsp"> 寻找同行驴友 </a></li>
                	<li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="b3_r4.jsp"> 个人中心 </a></li>
                </ul>
            </nav>
        </div>
    </div>
	<br>
	<br>
	<br>
	<div class="middle-main">
		<div class="container-fluid">
			<h1 align="center">选择志同道合的驴友</h1>

			<form name="form">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<select class="form-control input-md" name="opp" id="city"
							onclick="ChangCity()" onchange="choosePeople()">
							<option selected disabled>请选择城市</option>
							<option value="xian">西安</option>
							<option value="beijing">北京</option>
							<option value="shanghai">上海</option>
						</select>
					</div>

					<div class="col-md-2"></div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<select class="form-control input-md" name="opc" id="route"
							onchange="choosePeople()">
							<option selected disabled>请选择路线</option>
						</select>
					</div>
					<div class="col-md-2"></div>
				</div>
			</form>
			<br>
			<div id="people" style="margin-left: 100px" class="container-fluid">
			</div>
		</div>
	</div>

	<script type="text/JavaScript">
	 document.onreadystatechange = function () {
         if(document.readyState=="complete") {            
    		choosePeople();
         }       
     } 
	    function choosePeople()
	    {
	      var xmlhttp;
	      var city = $('#city').val();
	      var route = $('#route').val();
	      xmlhttp=new XMLHttpRequest();
	      xmlhttp.onreadystatechange=function(){
	      if (xmlhttp.readyState==4 && xmlhttp.status==200){
	          document.getElementById("people").innerHTML=xmlhttp.responseText;
	        }
	      }
	      xmlhttp.open("GET","AJAX/showpeople.jsp?city="+city+"&route="+route,true);
	      xmlhttp.send();
	    }
    </script>

	<script>
	//js中数组只有一维数组
	//但是·我们可以将数组一级数组中的元素变为数组
	//以便构成我们需要的二级数组
	var aCity = new Array();
	aCity[0] = new Array();
	aCity[1] = new Array();
	aCity[2] = new Array();
	aCity[3] = new Array();
	aCity[0][0] = "请选择路线";
	aCity[1][0] = "请选择路线";
	aCity[1][1] = "小寨-钟楼-大雁塔-华清池";
	aCity[1][2] = "城墙-陕博-兵马俑-华山";
	aCity[3][0] = "请选择路线";
	aCity[3][1] = "城隍庙-豫园-思南公馆-田子坊";
	aCity[3][2] = "静安寺-上海博物馆-步行街-陆家嘴";
	aCity[3][3] = "外滩-海洋水族馆-东方明珠-中共一大遗址";
	aCity[2][0] = "请选择路线";
	aCity[2][1] = "天安门广场-故宫-景山公园-什刹海";
	aCity[2][2] = "天坛-国家大剧院-西单商业街";
	aCity[2][3] = "八达岭长城-颐和园-三里屯太古里";
	
 	function ChangCity () {
 		var i,ip,ic,xcity;
 		//动态获取表单中opp<select>中的<option>索引
 		ip = document.form.opp.selectedIndex;
 		xcity=document.form.opp.options[ip].value;
 		ic = 0;
		while(aCity[ip][ic] != null)
 		ic++;
 		//动态分配表单中opc<select>的长度
 		document.form.opc.length = ic;
 		for (i = 1; i <= ic - 1; i++)
 		{
 			var a=i.toString();
 		//动态的给表单中opc<select>中的<option>赋值
 			document.form.opc[i] = new Option(aCity[ip][i],xcity+a);
	}

 		//document.form.opc[3] = new Option('郝' , '2' , true , true);
 		document.form.opp.focus();
	}
 </script>
</body>
</html>