<%@ page language="java" import="java.util.*"
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

<title>My JSP 'check.jsp' starting page</title>

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
	<%String str = request.getParameter("name");
	session.setAttribute("name", str);
	if(!(request.getParameter("yzm").toString().toUpperCase().equals(session.getAttribute("rand")))){	
		
		request.setAttribute("yzm", "验证码错误");
		RequestDispatcher rd=request.getRequestDispatcher("houtai/log.jsp");
		rd.forward(request, response);}
		if (str == null || str.length() == 0) { //判断昵称是否为空或者不存在  
		request.setAttribute("yhm", "用户名出错");
		RequestDispatcher rd1=request.getRequestDispatcher("houtai/log.jsp");
		rd1.forward(request, response);
			//response.sendRedirect("ChatIndex.jsp");
		} else {
			
			response.sendRedirect("houtai/show.jsp");//跳到chat
		}
		
	%>
</body>
</html>
