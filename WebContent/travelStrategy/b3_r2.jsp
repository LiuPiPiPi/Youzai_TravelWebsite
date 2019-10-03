<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>  板块三 </title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/blog.css" rel="stylesheet">
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/self.css" rel='stylesheet'>
    <style>
        body {
            background-color: #eee;
        }
    </style>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script type='text/JavaScript'>
    document.onreadystatechange = function () {
        if(document.readyState=="complete") {            
			showHotel();  
        }
    }
	    function showHotel()
	    {
	      $('tr.items').hide();
	      var xmlhttp;
	      var adr = $('#Address').val();
	      var price = $('#Price').val();
	      xmlhttp=new XMLHttpRequest();
	      xmlhttp.onreadystatechange=function(){
	      if (xmlhttp.readyState==4 && xmlhttp.status==200){
	          document.getElementById("showHotel").innerHTML=xmlhttp.responseText;
	        }
	      }
	      xmlhttp.open("GET"," AJAX/showHotel.jsp?adr="+adr+"&price="+price,true);
	      xmlhttp.send();
	    }
    </script>
<div _ngcontent-deepmind-website-c2="" class="header-container">
        <div _ngcontent-deepmind-website-c2="" class="menu-wrapper">
            <br><br>
            <nav _ngcontent-deepmind-website-c2="">
                <ul _ngcontent-deepmind-website-c2="" class="pages" align="center">
                    <li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="../travelNote/index.jsp">
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
    <div class="middle-main">
        <div class="container">
        <br>
        <select class="form-control input-lg"  id='Address' onchange="showHotel()">
            <option selected disabled value="defa">请选择地点</option>
            <option value="北京">北京</option>
            <option value="西安">西安</option>
            <option value="上海">上海</option>
        </select>
        <br><br>
        <select class="form-control input-lg"  id='Price' onchange="showHotel()">
            <option selected disabled value="defa">请选择价位</option>
            <option value="low_price">200元以下</option>
            <option value="mid_price">200-500元</option>
            <option value="high_price">500-1000元</option>
        </select>
    </div>
    <br>
    
    <div class="container list">
    
<!--         <div class="center-block"> -->
        	<div class="row"></div>
        		<div class="col-md-3"><h4>酒店图片</h4></div>
        		<div class="col-md-3"><h4>酒店名称</h4></div>
        		<div class="col-md-3"><h4>位置</h4></div>
        		<div class="col-md-3"><h4>价格</h4></div>
        		
        
<!--             <table class="table table-striped"> -->
<!--                 <tr id='head'> -->
<!--                     <td><h4>酒店图片</h4></td> -->
<!--                     <td><h4>酒店名称</h4></td> -->
<!--                     <td><h4>位置</h4></td> -->
<!--                     <td><h4>价格</h4></td> -->
<!--                 </tr> -->
<!--              </table> -->
			<br><br><br>
            <table id='showHotel' class='table table-striped item'>
                       
            </table>
<!--         </div> -->
    </div>
    </div>

</body>
</html>