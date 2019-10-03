<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<% 
int id=(Integer)request.getSession().getAttribute("user_id");//获取sesson的id
String name=(String)request.getSession().getAttribute("user_name"); //用户名

int log_id=(Integer)request.getSession().getAttribute("log_id");//文章标号


//按了按扭后 js把输入框输入内容，同时调用java的这个函数，让java获取输入框的内容
/*public class test {
    public String sd(){
        return "sd";
    }
}
问题 要有java 的spring才能在java普通类中执行request
*/


//现在 一步提交+跳转


//数据库连接
Connection con = null;
Statement stm = null;
String url = "jdbc:mysql://localhost/travel";//数据库名称就是你的数据库名字
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

String sql="select count(*) from user_logs where user_id = "+ id;




//关闭数据库连接
stm.close();
con.close();
%>

  <!DOCTYPE html>  
<html>
<head>  
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  

<!--百度api-->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=rCvwIbEa7fMb6C5CiLNOgWYBHRMSdYoo">
//v3.0版本的引用方式：src="http://api.map.baidu.com/api?v=3.0&ak=您的密钥"
</script>

<!--模块二 远程文件	-->
<!--	坑：这个百度远程jquery是无效的，但是预览有效，实际打开无效！，加载时间特别长，而且没有动态效果。换一个.而且jquery好像只能远程，下载到本地无效？？-->
<!--<script src="//libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>-->
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script src="/js/baiduJquery.js"></script>
	
<!--	api-->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=rCvwIbEa7fMb6C5CiLNOgWYBHRMSdYoo"></script>
<!--加载鼠标绘制工具-->
<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
<!--加载检索信息窗口-->
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />	
<link href="../css/material.indigo-pink.min.css" rel="stylesheet">
	
<title>地图标记</title>  
<!--	模块1样式表-->
<style type="text/css">  
html{height:100%}  
body{height:100%;margin:0px;padding:0px}  
	

#container {
	width: 80%;
	height: 400px;
	overflow: hidden;
	margin-left: 10%;
	font-family:"微软雅黑";
	border:#5651E9;
	border-style:solid;
/*	display: block;*/
}
	
#nav{
	margin-top:20px;
	margin-bottom: 20px;
	margin-left: 10%;
	width: 80%;
	height: 60px;
/*	背景图还有问题###########################*/
	background: url("img/contact.jpg"); 
	background-size: cover;
}
#mapsearch{
	width: 100%;
	height: 60px;
	background:rgba(242,242,242,0.1);		
	border-radius: 15px;
	float:top;
}

</style>  
<!--	模块2样式表-->
<style type="text/css">
body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
#allmap {width: 100%; height:500px; overflow: hidden;}
#result {width:100%;font-size:12px;}
dl,dt,dd,ul,li{
	margin:0;
	padding:0;
	list-style:none;
}
p{font-size:12px;}
dt{
	font-size:14px;
	font-family:"微软雅黑";
	font-weight:bold;
	border-bottom:1px dotted #000;
	padding:5px 0 5px 5px;
	margin:5px 0;
}
dd{
	padding:5px 0 0 5px;
}
li{
	line-height:28px;
}
</style>
				
</head>  
 
<body> 

<!--	导航栏 模块1-->
	<div id="nav">
		<div id="mapsearch">			
			<div style="font-size: 16px; padding-top: 8px; padding-left: 15px; color: #FF3030;">热搜词：
				<a href="#" onclick="hotcityclick(this)" style="text-decoration:none; margin-left: 5px;">天安门</a>
				<a href="#" onclick="hotcityclick(this)" style="text-decoration:none; margin-left: 5px;">桂林山水</a>
				<a href="#" onclick="hotcityclick(this)" style="text-decoration:none; margin-left: 5px;">世界之窗</a>
				<a href="#" onclick="hotcityclick(this)" style="text-decoration:none; margin-left: 5px;">天涯海角</a>
				<a href="#" onclick="hotcityclick(this)" style="text-decoration:none; margin-left: 5px;">景点</a>
				<a href="#" onclick="hotcityclick(this)" style="text-decoration:none; margin-left: 5px;">KTV</a>
				<a href="#" onclick="hotcityclick(this)" style="text-decoration:none; margin-left: 5px;">美食街</a>
<!--	最迷BUG 上面行 下面不行,和缩进格式有关?????????????????????????????????????-->
<!--				<a href="#" οnclick="hotcityclick(this)" style="text-decoration:none; margin-left: 5px;">景点</a>	-->
				

				
				<div style="display:inline-block;">
<!--				id ="suggestId" 是关键 脚本识别 虽然css中没有-->
					
				<input type="text" id ="suggestId" name="weatherinput" placeholder="请输入要查询的地名或景点，如：天安门" style="width:400px; height:32px;background:rgba(242,242,242,0.5);	margin-left:120px;  font-size: 16px;color: #330000;">
					
<!--				点击下拉的导航-->
				<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;">
				</div> 
				<button id="searchbtn" οnmοuseοver="mouseon(this)" style="width:80px; height:32px; background: #CFE2F3; font-size: 16px;">搜索</button><br>
				</div>

			</div>		
		</div>
	</div>	

<!--	地图主体-->
<div id="container"></div> 


<form action="../textEditor.jsp" method="post" >
   <!-- 输入标记id、经度、纬度、描述，临时存储 ########-->
  <input type="text" name="allInformation" id="tempInput" style="float: right;border-bottom:solid;margin-top:10px;margin-right: 1%;display:none"><br> 
 
  <input type="submit" onClick="httpPost()" class="mdl-button mdl-button--raised mdl-js-button mdl-js-ripple-effect mdl-button--accent" style="float: right; margin-top:10px;margin-right: 10%" value="返回编辑器" >
</form>
		
<!--  注释了 <a href="../textEditor.html">
	</a>-->
<!--ui描述列表 模块2	-->
<div id="addDescription" style="width:70%;height:200px;overflow:auto;margin-left:10%;visibility:visible">
<!--输入信息的列表，编辑模式可见，浏览模式不可见！（不可清空标签）-->
<!--	if(处于编辑模式！！)  否则删除remove()-->
	
	
	<div>
	 <p style="font-size:20px">请添加地图标记的描述</p>
	<ol id="dataList" style="border:ridge">
	<!-- <li>标签1<input  placeholder="请输入描述"></li>-->

	</ol>
	<div style="padding-bottom: 10px;padding-left: 40px;padding-top:px">
	<!--		确定按钮，刷新数据###########-->
	<button class="mdl-button mdl-button--raised mdl-js-button mdl-js-ripple-effect mdl-button--accent" style="text-align: center" onclick="freshMarkers()">保存描述信息</button>
	<button class="mdl-button mdl-button--raised mdl-js-button mdl-js-ripple-effect mdl-button--accent" style="text-align: center; margin-left: 50px;" onclick="clearAll()">清除所有标记</button>
	</div>
	</div>
</div>
	
<!--	全部脚本-->
<script type="text/javascript"> 
var map = new BMap.Map("container");
// 创建地图实例  
	
		
//导航栏模块1 脚本
{
//map.centerAndZoom(new BMap.Point(118.204, 23.215), 11);  // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl({
		mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));	  
	var local = new BMap.LocalSearch(map, {
		renderOptions:{map: map}
	});
	function hotcityclick(id){			
		var hotsearch = id.innerHTML;
		local.search(hotsearch);
	}
	
	searchbtn.onclick = function(){			
		var searchplace = document.getElementById('suggestId').value;					
		if(searchplace != ""){
			local.search(searchplace);
		}
	}
//搜索2
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}

//	var map = new BMap.Map("container");
//	map.centerAndZoom("北京",12);                   // 初始化地图,设置城市和地图级别。

	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "suggestId"
		,"location" : map
	});

	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		
		setPlace();
	});

//	好像有问题?
//下一步 地图多个点标记 带上标签 可以上传图片 写点东西  路径连线 后台直接生成文章!!!!########
//	文本编辑器
	function setPlace(){
//		map.clearOverlays();    //不能清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
	}
	
}
	
	
	
//图标记模块2 脚本
{
    var overlays = [];  //api自动画的，可以补充加上描述信息，存放所有markers
	var data_info=[];	//存放经纬度和描述信息
	var guideLines=[];  //存放路径，以便于删除和重绘
	var index=1;
	
//进行添加遮盖物的响应
{
	var overlaycomplete = function(e){
		//	 右键菜单
		var markerMenu=new BMap.ContextMenu();
		markerMenu.addItem(new BMap.MenuItem('删除',removeMarker.bind(e.overlay)));
		e.overlay.addContextMenu(markerMenu);
	
		//是一个标注类型
		if(e.overlay=="[object Marker]")
		{
			var label = new BMap.Label("标注"+index,{offset:new BMap.Size(20,-10)});
			e.overlay.setLabel(label);
			index++;
			var lastIndex=data_info.length;
			
//			数据新增加一行 坑：这里最外面要用单引号！！里面双引号 不然无效
			var dateItem='<li>'+'标签'+(lastIndex+1)+'<input placeholder="请输入描述"></li>'
			$("#dataList").append(dateItem);
			
			data_info[lastIndex]=([e.overlay.getPosition().lng,e.overlay.getPosition().lat,"暂未描述"])
		}
		

		//完整的 遮盖组件加入到overlays中 可以删除
		overlays.push(e.overlay);
    };
}
	
//实例化鼠标绘制工具,接口 注意，仅在编辑模式，浏览模式不可见
//	if(处于编辑模式！！)
//#########################################################################################
{
    var styleOptions = {
        strokeColor:"red",    //边线颜色。
        fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 3,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
        fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
    }
    
	

		var drawingManager = new BMapLib.DrawingManager(map, {
			isOpen: false, //是否开启绘制模式
			enableDrawingTool: true, //是否显示工具栏
			drawingToolOptions: {
				anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
				offset: new BMap.Size(50, 40), //偏离值
			},
			circleOptions: styleOptions, //圆的样式
			polylineOptions: styleOptions, //线的样式
			polygonOptions: styleOptions, //多边形的样式
			rectangleOptions: styleOptions //矩形的样式
		});  
		 //添加鼠标绘制工具监听事件，用于获取绘制结果
		drawingManager.addEventListener('overlaycomplete', overlaycomplete);
}
	
	//画连线
	function DrawLine()
	{   
		var allOverlay = map.getOverlays();
		//每次点击保存，清除已经画过的
		for (var i = 0; i < allOverlay.length; i++){
			if(allOverlay[i]=="[object Polyline]")//如果是线类型
				{
					allOverlay[i].remove();
				}
		}
		//重画
		for(var i = 0;i<data_info.length;i++)
			{
				if(i==data_info.length-1){break;}
				var point1=new BMap.Point(data_info[i][0],data_info[i][1]);
				var point2=new BMap.Point(data_info[i+1][0],data_info[i+1][1]);
				var polyline = new BMap.Polyline([
				point1,point2
				],
				{strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5
				}
				);
				guideLines[i]=polyline; //线段加入到lines中
				map.addOverlay(polyline);
			}
		
	}
	
	//清除api画的图
	function clearApiMarker()
	{
		for(var i = 0; i < overlays.length; i++){
			map.removeOverlay(overlays[i]);
		}
		index=1;//重置标记序号
		overlays.length = 0   
	}
		
	//清除所有遮盖物
	function clearAll() {
			data_info=[] //清空数据文件
			clearApiMarker(); //删除地图上markers
			guideLines=[]; //清空地图上的线端文件
			DrawLine(); //清空并根据点文件重绘，也就是清空
			$('#dataList').find('li').each(function() { //删除ui界面的li
				$(this).remove();
			})
			
		
		
 }
		
	//放弃，待定参考代码
	function information(){
	//	
	//	$("#dataList").append("<li>asdg</li>");
	}


	//删除标记点脚本
	var removeMarker = function(e,ee,marker){	
		//数组难删除 现在不实现
		if(marker=="[object Marker]")
			{
				alert("删除功能未实现，请点击清除按钮重画！")
			}
		else
			{
				map.removeOverlay(marker);
			}
	}

	//进行标记，窗口，要有数据才行
	//var data_info = [[116.417854,39.921988,"地址：北京市东城区王府井大街88号乐天银泰百货八层"],
	//					 [116.406605,39.921585,"地址：北京市东城区东华门大街"],
	//					 [116.412222,39.912345,"地址：北京市东城区正义路甲5号"]
	//					];


	var opts = {
					width : 250,     // 信息窗口宽度
					height: 80,     // 信息窗口高度
					title : "介绍:" , // 信息窗口标题
					enableMessage:true//设置允许信息窗发送短息
				   };

	//	根据数据文件 刷新地点和相应的标签
	function freshMarkers()	
		{
	//		clearApiMarker()//先删除所有api自动画的点 再画上去由坐标数据的点

//			alert(data_info.length)
//			alert(overlays.length) 这两个长度应该一致
			
			//js 遍历li 收藏
			$('#dataList').find('li').each(function() {
				var index=$(this).index();//下标
				var test =$(this).find('input').val();
	//			var text =this.innerHTML; //描述内容
				data_info[index][2]=test; //内容存到数据中
	//			alert(index);
	//			alert(data_info[index][2]);
			})

			for(var i=0;i<data_info.length;i++){
	//			var marker = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
				var marker = overlays[i]
				var content = data_info[i][2];
				var label = new BMap.Label("标注"+(i+1),{offset:new BMap.Size(20,-10)}); //添加标记
				marker.setLabel(label);	
	//			map.addOverlay(marker);               // 将标注添加到地图中
				addClickHandler(content,marker);
			}
			
			//画线
			DrawLine();
			
//new  进行数据库保存工作，先用分号转到input里面			
			var temp=document.getElementById("tempInput");//临时输入框
			var allstr="";
			for(var i =0; i<data_info.length;i++)
			{
				allstr+=(i+1)+";"+data_info[i][0]+";"+data_info[i][1]+";"+data_info[i][2]+";";
				//分别是标号、维度lng、经度lat、描述
			}
			temp.value=allstr;//存到临时框
			
			
		}


	function addClickHandler(content,marker){
			marker.addEventListener("click",function(e){
				openInfo(content,e)}
			);
		}

	
	//点击后打开窗口
	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}	
	
}
	
	
	
	
	
	
	
	
	
	
//初始坐标点
	
var startPoint = new BMap.Point(116.403, 39.915);	
var startPoint2 = new BMap.Point(116.403, 39.916);	
map.centerAndZoom(startPoint, 15);  
map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
//创建一个点
	
//	增加一个标注点

//alert("当前位置：" + e.point.lng + ", " + e.point.lat);  
//	刷新绘制



//	百度对外接口的坐标系为BD09坐标系，并不是GPS采集的真实经纬度

	
	

	
//添加城市列表控件
var size = new BMap.Size(10, 20);
map.addControl(new BMap.CityListControl({
    anchor: BMAP_ANCHOR_TOP_LEFT,
    offset: new BMap.Size(60, 20), //偏离值
}));
	
//	控件的添加
map.addControl(new BMap.NavigationControl());    
map.addControl(new BMap.ScaleControl());    
map.addControl(new BMap.OverviewMapControl());    
  	
</script>  






</body>  
</html>