<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'body10.jsp' starting page</title>
<style type="text/css">
#b10-1 {
	height: 400px;
	overflow: hidden;
}

#b10-2 {
	height: 50px;
	width: 200px;
	position: relative;
	bottom: 50px;
}

#b10-3 {
	height: 350px;
	width:350px;	
	float:right;
	margin-top:-400px;
	margin-right:50px;
	
}

#b10-2 ul li {
	width: 15px;
	height: 15px;
	float: left;
	margin-left: 11px;
	border-radius: 50%;
	background-color: #fff;
}

#b10-2 ul li.curr {
	background-color: #111;
}
</style>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>
	<div id="b10-1">
		<a href="#"><img src="img/b10-1.jpg"></a> <a href="#"><img
			src="img/b10-2.jpg"></a> <a href="#"><img src="img/b10-3.jpg"></a>
	</div>
	<div id="b10-2">
		<ul>
			<!-- shift+右键-->
			<li class="curr"></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<div id="b10-3">
		<input type="radio" name="r" value="on">国内 <input type="radio"
			name="r" value="on">国际<br>
			<input type="text" name="t1" value="从："style="width:250px;height:50px"><br>
			<input type="text" name="t2" value="到："style="width:250px;height:50px"><br>
			<input type="submit" value="搜索" style="width:256px;height:50px;background-color:#e38">
			
	</div>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js">		
	</script>
	<!-- 实现图片轮播 -->
	<script>
		var index = 0;
		var time = null;//$为选择器
		$("#b10-2 ul li").hover(function() {//鼠标画上去实现
			index = $(this).index();
			$(this).addClass("curr").siblings().removeClass("curr");
			$("#b10-1 a").eq(index).fadeIn().siblings().hide();
		});
		$("#b10-2 li").hover(function() {
			clearInterval(time);//鼠标放在图片上面清除定时器
		}, function() {//鼠标离开
			autoplay();//调用自动轮播
		});
		function autoplay() {//自动轮播
			time = setInterval(function() {
				$("#b10-2 ul li").eq(index).addClass("curr").siblings()
						.removeClass("curr");
				$("#b10-1 a").eq(index).fadeIn().siblings().hide();
				index++;
				if (index > 3) {
					index = 0;
				}
			}, 1500);
		}
		autoplay();
	</script>
</body>
</html>
