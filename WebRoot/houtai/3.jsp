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
<title>My JSP '3.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.hidden_nav {
	display: none;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}

.menu  {
	width: 160px;
	text-align: center;
	line-height: 40px;
	
}
.hidden_nav li{height:30px;}
.hidden_nav li a  {
	width: 100px;
	line-height:15px;
	text-align: center;
		
	
}
.menu ul li a {
	width: 150px;
	height: 40px;
	display: block;
}

.b1 {
	width: 300px;
	background-color: #00ddFF;
	height: 600px;
	padding-top: 100px;
	padding-left: 50px;
}
.b1-1{
	width: 250px;height: 400px;
	background-color: #88ddFF;
	border: #CcCcCc 2px solid;
	
}
</style>


</head>
<body>
	<div class="b1">
		<div class="b1-1">
			<ul class="nav">
				<li class="menu"><a href="javascript:void(0)" title="">单机游戏</a>
					<ul class="hidden_nav">
						<li><a href="javascript:void(0)" title="">1</a></li>
						<li><a href="javascript:void(0)" title="">2</a></li>
						<li><a href="javascript:void(0)" title="">3</a></li>
						<li><a href="javascript:void(0)" title="">4</a></li>
					</ul></li>
				<li class="menu"><a href="javascript:void(0)" title="">网络游戏</a>
					<ul class="hidden_nav">
						<li><a href="javascript:void(0)" title="">1</a></li>
						<li><a href="javascript:void(0)" title="">2</a></li>
						<li><a href="javascript:void(0)" title="">3</a></li>
						<li><a href="javascript:void(0)" title="">4</a></li>
					</ul></li>
				<li class="menu"><a href="javascript:void(0)" title="">网页游戏</a>
					<ul class="hidden_nav">
						<li><a href="javascript:void(0)" title="">1</a></li>
						<li><a href="javascript:void(0)" title="">2</a></li>
						<li><a href="javascript:void(0)" title="">3</a></li>
						<li><a href="javascript:void(0)" title="">4</a></li>
					</ul></li>
				<li class="menu"><a href="javascript:void(0)" title="">小游戏</a>
					<ul class="hidden_nav">
						<li><a href="javascript:void(0)" title="">1</a></li>
						<li><a href="javascript:void(0)" title="">2</a></li>
						<li><a href="javascript:void(0)" title="">3</a></li>
						<li><a href="javascript:void(0)" title="">4</a></li>
					</ul></li>
				<li class="menu"><a href="javascript:void(0)" title="">游戏攻略</a>
					<ul class="hidden_nav">
						<li><a href="javascript:void(0)" title="">1</a></li>
						<li><a href="javascript:void(0)" title="">2</a></li>
						<li><a href="javascript:void(0)" title="">3</a></li>
						<li><a href="javascript:void(0)" title="">4</a></li>
					</ul></li>
				<li class="menu"><a href="javascript:void(0)" title="">资讯平台</a>
					<ul class="hidden_nav">
						<li><a href="javascript:void(0)" title="">1</a></li>
						<li><a href="javascript:void(0)" title="">2</a></li>
						<li><a href="javascript:void(0)" title="">3</a></li>
						<li><a href="javascript:void(0)" title="">4</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<script type="text/javascript" src="/h/js/jquery-1.8.3.min.js">
	</script>
	<!-- 实现图片轮播 -->
	<script>
		$(document).ready(function() {
			$(".menu").click(function() {
				$(this).children(".hidden_nav").show();
				$(this).siblings().children(".hidden_nav").hide();
			});
		});
	</script>


</body>
</html>
