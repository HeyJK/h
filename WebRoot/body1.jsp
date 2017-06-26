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

<title>My JSP 'body1.jsp' starting page</title>
<style type="text/css">
#b1 {
	width: 103%;
	height: 400px;
	margin: 2px;
	position: relative;
}

#b1-1 {
	width: 1900px;
	height: 400px;
	overflow: hidden;
	position: absolute;
	right: 1px;
}

#b1-2 {
	height: 50px;
	width: 250px;
	position: absolute;
	bottom: 50px;
	right: 50px;
}

#b1-3 {
	height: 350px;
	width: 400px;
	position: absolute;
	top: 20px;
	left: 20px;
	background-color: #fff;
}

#b1-3-1 {
	height: 298px;
	margin-top: 50px;
	width: 80px;
	background-color: #ffa;
}

#b1-3-2 {
	height: 350px;
	width: 320px;
	margin-top: -300px;
	float: right;
}

#b1-3-3 {
	width: 80px;
	height: 50px;
	margin-top: -350px;
	float: left;
	font: 25px/2.0em "黑体";
}

#b1-3-1 li {
	display: block;
	height: 48px;
	text-align: center;
	line-height: 43px;
	border-bottom: 2px solid #777;
}

#b1-3-2-1 {
	height: 100px;
	width: 315px;
	border: 2px solid #fff;
	margin-top: -48px;
}

#b1-3-2-1-1 {
	height: 100px;
	width: 315px;
	margin-top: 0px;
	background-image: url(img/b1-3-2-1-1.png);
}
#b1-3-2-2 {
	height: 225px;
	width: 315px;
	margin-top: 1px;
	padding-top: 15px;
}

#b1-3-1 li:HOVER {
	background-color: #ff2;
}

#b1-2 ul li {
	width: 15px;
	height: 15px;
	float: left;
	margin-left: 11px;
	border-radius: 50%;
	background-color: #fff;
}

#b1-2 ul li.curr {
	background-color: #d37;
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
	<div id="b1">
		<div id="b1-1">
			<a href="#"><img src="img/01.jpg"></a> <a href="#"><img
				src="img/02.jpg"></a> <a href="#"><img src="img/03.jpg"></a>
			<a href="#"><img src="img/04.jpg"></a> <a href="#"><img
				src="img/05.jpg"></a> <a href="#"><img src="img/06.jpg"></a>
			<a href="#"><img src="img/07.jpg"></a>
		</div>
		<div id="b1-2">
			<ul>
				<!-- shift+右键-->
				<li class="curr"></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<div id="b1-3">
			<div id="b1-3-1">
				<li>自由行</li>
				<li>景点门票</li>
				<li>度假酒店</li>
				<li>机票</li>
				<li>游轮</li>
				<li>签证</li>
			</div>
			<div id="b1-3-2">
				<div id="b1-3-2-1">
					<div id="b1-3-2-1-1"></div>
				</div>
				<div id="b1-3-2-2">
					<h10>国内热门</h10>
					<pre>  内蒙古  云南 九寨沟 青海 张家界 上海 厦门
黄山 桂林 乌镇 山西 新疆 长白山 西安 三亚</pre>
					<h10>出境热门</h10>
					<pre>  泰国 日本 韩国 长滩岛 欧洲 马来西亚 澳洲
柬埔寨 美国 中国台湾 越南 迪拜 巴厘岛 吉普岛</pre>
					<h10>热门主题</h10>
					<pre>  甘肃玩乐参团 开心驴行 摄影 出境温泉季 299抢
送咕咚洗衣机 送电影票 暑期欢乐送 上海迪士尼</pre>
				</div>
			</div>
			<div id="b1-3-3">跟团游</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js">
		
	</script>
	<!-- 实现图片轮播 -->
	<script>
		var index = 0;
		var time = null;//$为选择器
		$("#b1-2 ul li").hover(function() {//鼠标画上去实现
			index = $(this).index();
			$(this).addClass("curr").siblings().removeClass("curr");
			$("#b1-1 a").eq(index).fadeIn().siblings().hide();
		});
		$("#b1-2 li").hover(function() {
			clearInterval(time);//鼠标放在图片上面清除定时器
		}, function() {//鼠标离开
			autoplay();//调用自动轮播
		});
		function autoplay() {//自动轮播
			time = setInterval(function() {
				$("#b1-2 ul li").eq(index).addClass("curr").siblings()
						.removeClass("curr");
				$("#b1-1 a").eq(index).fadeIn().siblings().hide();
				index++;
				if (index > 7) {
					index = 0;
				}
			}, 2000);
		}
		autoplay();
	</script>
</body>
</html>
