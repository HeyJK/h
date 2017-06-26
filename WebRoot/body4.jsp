<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,bean.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My  starting page</title>    
    <style type="text/css">
    #b4-1 {margin-top: 100px;
	
}
#b4-2 {margin-top: 100px;
	
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
  <% if(request.getAttribute("bean")!=null){
  newsbean bean=(newsbean)request.getAttribute("bean");%>
  <center> <body>
 <div id="b4-1">	 <%out.print(bean.getTitle());%></div>
  
   <% if(bean.getNeirong()!=null){%>
 <div id="b4-2">   <%out.print(bean.getNeirong());}}%></div>
  </body></center>
</html>
