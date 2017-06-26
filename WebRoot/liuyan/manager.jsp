<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>My JSP 'manager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
body {
	background-color: #ffa;
}</style>
  </head>
  <body>	<%
		if (request.getAttribute("zhanghao") != null)
			out.print(request.getAttribute("zhanghao"));
		session.setAttribute("zhanghao", null);
		//session.removeAttribute("");
		if (request.getAttribute("yzm") != null)
			out.print(request.getAttribute("yzm"));
	%><center>
   后台管理员<form action="../liuyanmangerlogo?type=delete" method="post">
  <input type="text"  style="width:200px;height:30px"name="zhanghao">账号
  <font size="4" color="red"></font><br>
		<input type="text"style="width:110px;height:30px" name="yzm">
		<img alt="" src="/h/yanzhengma.jsp" onclick="chang()"> 验证码
 <br> <input type="submit" style="width:200px;height:50px" value="登录"></form></center>
  </body>
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
</html>
