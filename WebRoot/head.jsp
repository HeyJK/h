<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<html lang="en">
<head>  
<meta charset="UTF-8">
<title>head</title>
<style type="text/css">
ul,li {
	list-style: none;
}

#h3 ul li {
	float: left;
}

#h3 ul li a {
	width: 250px;
	height: 70px;
	font-size: 20px;
	text-align: center;
	line-height: 70px;
	display: block;
	border-right: 2px solid #ccc;
	background: #eee;
	color: #666;
}

#h3 ul li ul li a {
	width: 100px;
	height: 30px;
	font-size: 15px;
	line-height: 30px;
}

#h3 ul li ul {
	position: absolute;
	display: none;
}

#h3 ul li ul li {
	float: left;
	
}

#h3 ul li  a:hover {
	color: red;
	background-color: #699f00;
}

#h3 ul li ul li a:hover {
	color: red;
	background-color:#ffff00;
}

#h3 ul li:hover ul {
	display: block;
}

a {
	text-decoration: none;
}

#head {
	width: 103%;
	padding-top: 1px;
	margin: -8px 0 0 -7.5px;
	background-color: #cff;/*border-radiuss: 5px;四角圆滑*/
}

#h1 {
	height: 60px;
	font: 25px/2.0em "黑体";
	text-align: center;

}

#h1-1 {
	float: left;
	width: 300px;
	height: 50px;
	margin-top: 10px;
	margin-left: 50px;
}

#h1-2 {
	float: right;
	width: 300px;
	height: 50px;
	margin-top: 10px;
	margin-right: 50px;
}

#h2 {
	height: 120px;
}

#h3 {
	height: 125px;
	background-color: #d37;
	padding-top: 25px;
	padding-left: 25px;
}

#h3-1 {
	height: 120px;
	margin-left: -5px;
}
</style>
</head>
<body>
	<div id="head">
		<div id="h1">
			<div id="h1-1">
				<a href="liuyan/liuyan.jsp">驴友留言&nbsp</a><a href="chat/ChatIndex.jsp">驴友聊天室&nbsp</a>
			</div> 
			<div id="h1-2">
				<a href="houtai/houtailog.jsp">后台管理</a> <a href="zixunshow.jsp">旅游资讯</a>
			</div>
		</div>
		<div id="h2">
			<img src="img/h1.jpg" width=100% height=100%>
		</div>
		<div id="h3">
			<div id="h3-1">
				<ul>
					<li class="c1"><a href="zhu.jsp?show=1">首页 &nbsp</a></li>

					<li><a href="zhu.jsp?show=2">出境游&nbsp </a>
						<ul>
							<li><a href="#">美国 </a></li>
							<li><a href="#">日本</a></li>
							<li><a href="#">韩国 </a></li>
						</ul></li>

					

					
					<li><a href="zhu.jsp?show=10">机票 &nbsp</a>
						<ul>
							<li><a href="#">国内航班 </a></li>
							<li><a href="#">国际航班</a></li>
						</ul></li>

					<li><a href="zhu.jsp?show=11">旅游攻略 &nbsp</a>
						<ul>
							<li><a href="#">自费 </a></li>
						
						</ul></li>
					<li><a href="zhu.jsp?show=12">驴妈妈&nbsp </a></li>
				</ul>
			</div>
		</div>
	</div>
	
</body>
</html>