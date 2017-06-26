<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zixunshow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
   <frameset rows="47%,*"name="zixun"border="1" >
   <frame name="left1" src="head.jsp" border="0"  scrolling="no">
  <frameset cols="28%,*"name="houtai" border="1" >
<frame name="left1" src="newstiqu2" border="0"  >
<frame name="right1" id="right1" src="body4.jsp" >
</frameset>
></frameset>
  <body>
   
  </body>
</html>
