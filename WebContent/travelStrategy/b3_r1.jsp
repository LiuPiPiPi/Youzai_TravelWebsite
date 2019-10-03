<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>  旅游攻略 </title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/blog.css" rel="stylesheet">
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/self.css" rel='stylesheet'>
    <link href="css/hotel_list.css" rel='stylesheet'>
    <style>
        body {
            margin: 0;
            background-color: #eee;
        }
    </style>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script type='text/JavaScript'>
    document.onreadystatechange = function () {
        if(document.readyState=="complete") {            
			showPath();  
        }       
    } 
	    function showPath()
	    {
	      $('.hotel-hd').hide();
	      var xmlhttp;
	      var adr = $('#Address').val();
	      var day = $('#Day').val();
	      xmlhttp=new XMLHttpRequest();
	      xmlhttp.onreadystatechange=function(){
	      if (xmlhttp.readyState==4 && xmlhttp.status==200){
	          document.getElementById("showPath").innerHTML=xmlhttp.responseText;
	        }
	      }
	      xmlhttp.open("GET","AJAX/showPath.jsp?adr="+adr+"&day="+day,true);
	      xmlhttp.send();
	    }
    </script>
    <script type="text/JavaScript">
        function Select(){
            var addr = $('#Address').val();
            var day = $('#Day').val();
            $('div.hotel-hd').hide();
            $('div.hotel-hd').filter('.'+addr).filter('.'+day).show();
        }
    </script>
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
    <script type="text/JavaScript">
    function signIn() {
    	
    }
    
    </script>
    <div class="middle-main" style="margin-left: 250px">
    	<br>

        <div >
            <select class="form-control input-lg" id='Address' onchange="showPath()">
                <option selected disabled value="none">请选择旅游地</option>
                <option value="北京">北京</option>
                <option value="西安">西安</option>
                <option value="上海">上海</option>
            </select>
        </div>
        <br>
        <div>
            <select class="form-control input-lg" id='Day' onchange="showPath()">
                    <option selected disabled value="0">请选择出行天数</option>
                    <option value="2">二日游</option>
                    <option value="3">三日游</option>
                    <option value="5">五日游</option>
                    <option value="7">七日游</option>
                </select>
        </div>
        <br>
        <h2>路程推荐</h2>
        <br>
	</div>
	<div id="showPath">
       
    </div>
</body>
</html>