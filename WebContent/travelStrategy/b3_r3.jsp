<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">    
    <meta name="viewport" content='width=device-width, initial-scale=1'>
    <title>景点门票查看</title>

    <link href="css/bootstrap.css" rel='stylesheet'>
	<link href="css/blog.css" rel='stylesheet'>   
	<link href="css/ie10-viewport-bug-workaround.css" rel='stylesheet'>
    <link href="css/self.css" rel='stylesheet'>
    <link href="css/main.css" rel='stylesheet'>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>	
	<script src="js/unslider.min.js"></script>
	<script type="text/JavaScript">
        function showSpot()
	    {
        	
	      var xmlhttp;
	      var dest = $('#Destination').val();
	      xmlhttp=new XMLHttpRequest();
	      xmlhttp.onreadystatechange=function(){
	      if (xmlhttp.readyState==4 && xmlhttp.status==200){
	          document.getElementById("showSpot").innerHTML=xmlhttp.responseText;
	        }
	      }
	      xmlhttp.open("GET","AJAX/showSpot.jsp?city="+dest,true);
	      xmlhttp.send();
	    }
    </script>
	<script><!--实现自动轮播及进度条效果-->
	$(document).ready(function(e) {
		var progress = $(".progress"),li_width = $("#spot9 li").length;
	    var unslider04 = $('#spot9').unslider({
			dots: true,
			complete:function(index){
				progress.animate({"width":(100/li_width)*(index+1)+"%"});<!--jQuery自定义动画-->
			}
		}),
	
		data04 = unslider04.data('unslider');
		$('.unslider-arrow04').click(function() {
	        var fn = this.className.split(' ')[1];
	        data04[fn]();
	    });
	});
	</script>
	
	<div _ngcontent-deepmind-website-c2="" class="header-container">
        <div _ngcontent-deepmind-website-c2="" class="menu-wrapper">
            <br><br>
            <nav _ngcontent-deepmind-website-c2="">
                <ul _ngcontent-deepmind-website-c2="" class="pages">
						<li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="../travelNote/index.jsp">
							<span class="glyphicon glyphicon-align-center" aria-hidden="true"></span></a></li>
                    <li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="../游记数据库测试/index.jsp"> 首页 </a></li>
                    <li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="b3_r1.jsp"> 旅游路径规划 </a></li>
                    <li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="b3_r2.jsp"> 酒店吃住安排 </a></li>
                    <li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="b3_r3.jsp"> 景点门票查看 </a></li>
                    <li _ngcontent-deepmind-website-c2="" ><a _ngcontent-deepmind-website-c2="" class="nav-cta page-link" href="b3_r4.jsp"> 寻找同行驴友 </a></li>
                </ul>
            </nav>
        </div>
    </div>
	
	<div class="container" style="margin:0 auto">
		<div class="container-fluid">
		<br>
        <div>
            <select class="form-control input-lg" id="Destination" onchange="showSpot()">
                <option selected disabled>请选择目的地</option>
				<option value="渭南">渭南</option>
                <option value="西安">西安</option>
				<option value="香港">香港</option>
				<option value="成都">成都</option>
			</select>
        </div>
        <br>
        
        <div class="view-header">	
			<div class="list-group" style="float:left;">
			  <a href="###" class="list-group-item active">
			    热门城市
			  </a>
			  <a href="###" class="list-group-item">西安</a>
			  <a href="###" class="list-group-item">香港</a>
			  <a href="###" class="list-group-item disabled">桂林</a>
			  <a href="###" class="list-group-item">成都</a>
			</div>
			<div class="banner" id="spot9">
				<ul>
					<li class="slider-item"><a href="###"><img src="img/huashan.jpeg" alt="华山" width="640" height="480" ><span class="slider-title"><em>华山</em></span></a></li>
					<li class="slider-item"><a href="###"><img src="img/treasure.jpg" alt="镶金兽首玛瑙杯" width="640" height="480" ><span class="slider-title"><em>陕西省历史博物馆</em></span></a></li>
					<li class="slider-item"><a href="###"><img src="img/potteryfigurine.jpg" alt="兵马俑" width="640" height="480" ><span class="slider-title"><em>秦兵马俑博物馆</em></span></a></li>
					<li class="slider-item"><a href="###"><img src="img/ShangHai.jpg" alt="上海" width="640" height="480" ><span class="slider-title"><em>东方之珠</em></span></a></li>
					
				</ul>
				<div class="progress"></div>
				<a href="javascript:void(0);" class="unslider-arrow04 prev"><img class="arrow" id="al" src="img/arrowl.png" alt="prev" width="20" height="35"></a>
				<a href="javascript:void(0);" class="unslider-arrow04 next"><img class="arrow" id="ar" src="img/arrowr.png" alt="next" width="20" height="37"></a>
			</div>
		</div>
		<br>
		
		<div id="showSpot"></div>
		
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="text-align:center">
	  <div class="modal-dialog" role="document" >
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel"><br><br>请付款<br><br></h4>
		  </div>
		  <div class="modal-footer" style="text-align:center">
			<button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button> 
		  </div>
		</div>
	  </div>
	</div>   
		</div>
	</div>
	
</body>
</html>
