<%@page import="servlet.newstiqu"%>
<%@page import="bean.newsbean"%>
<%@ page language="java" import="java.util.*" import="bean.*"
	contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>



<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'body3.jsp' starting page</title>
<style type="text/css">
body{background-color: #ffa;}
#b3-1 {margin-top: 70px;
width: 300px;
	height: 475px;
	padding-left: 20px;
	padding-top: 40px;
	background: #afeeee;
	border: #CcCcCc 2px solid;
	border-radius: 10%;
	
}
a{text-decoration: none;}
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
	<div id="b3-1">
	<h1>新闻</h1><div id="b3-3"><a href="newstiqu2?ID=20">更多</div>
		<%
			if (request.getAttribute("bean_ls") != null) {//System.out.println("123");
				List<newsbean> bean_ls = (List<newsbean>) (request
						.getAttribute("bean_ls"));
				for (newsbean bean : bean_ls) {
		%>
		<table>
			<td><a href="newstiqu3?type=chakan&ID=<%=bean.getId()%>" target="right1"">
					<%
						out.print(bean.getTitle());
					%>
			</a></td>
		</table>
		<%
			}
			}
		%>
		<a href="zhu.jsp" target="_top">返回</a>
	</div>
</body>
</html>
