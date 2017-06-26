<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>


<title></title>
<style type="text/css">
body {
	background-color: #ffa;
}

#i1 {
	text-align: center;
}

#i2 {
	text-align: center;
}

i2 {
	margin: 0 auto;
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
	<%
		if (request.getAttribute("yhm") != null)
			{out.print(request.getAttribute("yhm"));
		session.setAttribute("yhm", null);}
		//session.removeAttribute("");
		if (request.getAttribute("yzm") != null)
			{out.print(request.getAttribute("yzm"));session.setAttribute("yzm", null);}
	%>
	<div id="i2">
		<form action="houtaicheck.jsp" method="post">
			<div style="margin-bottom: 30px;">
				<font size="4" color="red">账号：</font> <input type="text"
					name="zhanghao" style="width:220px;height:30px"><br>
			</div>
			<div style="margin-top: 30px;">
				<font size="4" color="red">验证码：</font> <input type="text" name="yzm"
					style="width:145px;height:30px"> <img alt=""
					src="/h/yanzhengma.jsp" onclick="chang()"
					style="height: 25px;width: 70px; vertical-align: middle;">
			</div>
			<br> <input type="submit" value="登录"
				style="width:140px;height:30px">
		</form>
	</div>
	<script type="text/javascript" src="/h/js/jquery-1.8.3.min.js">	</script>
	<script>
	//alert($);
	function chang(){
	var image=document.getElementsByTagName("img")[0];
	var myDate=new Date();
	image.src="/h/yanzhengma.jsp?time="+myDate.getTime();
	//alert(image.src);
	}
	</script>
</body>
</html>
