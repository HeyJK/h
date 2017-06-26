<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% 
request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
%>
<html>
  <head>
    <title>My JSP 'chat.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
 <frameset rows="*,14%" >
<frame name="cshow" src="ChatShow.jsp" >
<frame name="cinput" src="ChatInput.jsp">
</frameset>
  <body>
 
  </body>
</html>
