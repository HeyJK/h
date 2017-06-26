<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>登录界面</title>
<style type="text/css">
ul {
	list-style: none;
}

#body {
	width: 102%;
	height: 500px;
	background-image: url(img/dl-cfy.jpg);
	background-size: cover;
	padding-top: 5px;
}

#b1 {
	width: 270px;
	height: 200px;
	margin-top: 100px;
	margin-left: 60px;
}
</style>
</head>
<body>
	<div id="body">
		<div id="b1">
			<b>登录界面</b><br> <input type="text" id="userNameTips"
				class="name">请输入你的账号<br> <input type="password"
				id="mima">请输入密码<br> <input type="password">
			请确认密码<br> <input type="text" name="yzm"> <img alt=""
				src="yanzhengma.jsp" onclick="chang()"> <input type="submit" value="登 录" /> <input
				type="reset" value="重置">
		</div>
	</div>

<script type="text/javascript" src="/h/js/jquery-1.8.3.min.js">	</script>
	<script>
	//alert($);
	function chang(){
	var image=document.getElementsByTagName("img")[0];
	var myDate=new Date();
	image.src="yanzhengma.jsp?time="+myDate.getTime();
	//alert(image.src);
	}
	</script>

</body>
</html>
