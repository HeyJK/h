<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>

<html>
<head>
<title>发言区</title>
<style type="text/css">
</style>
<meta http-equiv="refresh" content="5">
</head>
<style type="text/css">
body{font: 20px "微软雅黑" ;}</style>
<body>
	<% 
		out.print((String) application.getAttribute("show"));%>
</body>
</html>