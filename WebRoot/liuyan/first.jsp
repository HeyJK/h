<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>留言板</title>
<style type="text/css">
body {
	background-color: #cff;
}

#i1 {
	background: url("liuyan/2.jpg");
	background-position: center center;
	background-repeat: no-repeat;
	height: 1000px;
	width: 900px;;
	margin-top: 50px;
	margin: 0 auto;
}

#i2 {
	height: 500px;
	width: 600px;
	margin-left: 150px;
	padding-top: 230px;
	//
	整体
}

.i2 {
	height: 70px;
	width: 250px;
	border: 2px solid gray;
	border-bottom: none;
	font: 30px/2.2em "黑体"; /* 字体大小上下居中*/
	text-align: center;
	background-color: #CFF;
	//
	左边
}

.i3 {
	height: 70px;
	width: 350px;
	border: 2px solid gray;
	border-left: none;
	border-bottom: none;
	float: right;
	margin-top: -71.6px;
	margin-right: -6.5px;
	//
	右边
}

#i4 {
	border-bottom: 2px solid gray;
}

#i5 {
	border-bottom: 2px solid gray;
	border-right: none;
}

input {
	font-size: 30px;
}

#i6 {
	height: 290.5px;
	width: 350px;
	margin: -75px 252px;
	border: 2px solid gray;
	border-top: none;
}

a {
	text-decoration: none;
	font-size: 30px;
}

#i7 {
	height: 100px;
	width: 200px;
	margin-top: -150px;
	margin-left: 20px;
}
}
</style>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<div id="i1">
		<div id="i2">
			<form action="liuyan/third.jsp" method="post">
				<div class="i2">用户名：</div>
				<div class=i3>
					<input type="text" name="yhm" style="height:100%;width: 100%;">
				</div>
				<div class=i2>邮箱：</div>
				<div class=i3>
					<input type="email" name="yx" style="height:100%;width: 100%;">
				</div>
				<div class=i2>手机：</div>
				<div class=i3>
					<input onkeyup="this.value=this.value.replace(/\D/g,'')"
						onafterpaste="this.value=this.value.replace(/\D/g,'')" name="sj"
						style="height:100%;width: 100%;"><!--只能输入数字-->
				</div>
				<div class=i2>主题：</div>
				<div class=i3 id="i4">
					<input type="text" name="zt" style="height:100%;width: 100%;">
				</div>
				<div class=i2 id="i5">留言内容：</div>
				<div id="i6">
					<textarea rows=19% cols=47% name="neirong"></textarea>
				</div>
				<div id="i7">
					<input type="submit" name="submit" value="留言"> <input
						type="reset" name="reset" value="重置">
				</div>
			</form>
			<a href="liuyan/second.jsp">查看留言板</a>
		</div>
	</div>
</body>
</html>
