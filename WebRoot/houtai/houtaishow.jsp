<%@page import="bean.newsbean"%>
<%@ page language="java"  import="java.util.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<title>My JSP '1.jsp' starting page</title>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css"></style>
</head><%if(session.getAttribute("zhanghao")==null){response.sendRedirect("houtailog.jsp");} %>
<frameset cols="28%,*"name="houtai" border="1" >
<frame name="left" src="houtai/left.jsp" border="0" scrolling="no" >
<frame name="right" id="right" src="newstiqu" >
</frameset> <%--session.setAttribute("zhanghao",null);--%>
</html>
