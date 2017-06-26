
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
<title>弹出菜单</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
/*标签选择器*/
*{margin: 0;}
#left-2 ul a {
	line-height: 50px;
	
}
ul{margin-bottom: 10px;
padding-top: 10px;}
li {
	/*li前面的小圆点消失*/
	list-style: none;
	/*利用外边距达到缩进的效果*/
	margin-left: 18px;
	display: none;
	line-height: 50px;
	text-align: center;
	background:#E1e1fa;
	border: #CcCcCc 2px solid;
	 border-radius:10%;
}

a {
	text-decoration: none; /*让连接的下划线消失*/
	font: 27px "幼圆";
	font-style: red;
	  border-radius:20%;
}

#left-1 {
	width: 350px;
	height: 800px;
	padding-top: 80px;
	padding-left: 15px;
	background:#00fa9a;
}

#left-2 {
	width: 300px;
	height: 620px;
	padding-left: 20px;
	padding-top: 40px;
	background:#afeeee;
	border: #CcCcCc 2px solid;
	border-radius:10%;
}

</style>
</head>
<body>
	<div id="left-1">
		<div id="left-2">
			<ul>
				<a href="#">新闻管理</a>
				<li><a href="#">添加新闻</a></li>
				<li><a href="#">删除新闻</a></li>
				<li><a href="#">修改新闻</a></li>
			</ul>
			<ul>
				<a href="#">留言管理</a>
				<li><a href="#">删除留言</a></li>
				<li><a href="#">添加留言</a></li>
				<li><a href="#">查看留言</a></li>
			</ul>
			<ul>
				<a href="#">我是菜单2</a>
				<li><a href="#">我是子菜单3</a></li>
				<li><a href="#">我是子菜单4</a></li>
			</ul>
		</div>
	</div>
	<script type="text/javascript" src="/h/js/jquery-1.8.3.min.js">
		
	</script>
	<script>
		//alert($);
		$(document).ready(function() {
			//首先需要找到所有的主菜单
			//然后给所有的主菜单添加onClick事件
			//var as = $("ul").children("a");//找标签不需要#  
			var as = $("ul > a");
			as.click(function() {
				//这里需要找到当前的ul中的li,然后让li显示出来
				//获取当前被点击ul节点里的a节点
				var aNode = $(this);
				
				//找到当前ul节点的所有li兄弟节点
				var lis = aNode.nextAll("li");
				//让子节点显示或影藏
				lis.toggle("show");
			});
			/*$("li > a").click(function() {
				$("#content").load($(this).attr("id"));
			});*/
		});
	</script>
</body>
</html>