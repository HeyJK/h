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
		RequestDispatcher rd=request.getRequestDispatcher("ChatIndex.jsp");
		rd.forward(request, response);}
		if (str == null || str.length() == 0) { //判断昵称是否为空或者不存在  
		request.setAttribute("yhm", "用户名出错");
		RequestDispatcher rd1=request.getRequestDispatcher("ChatIndex.jsp");
		rd1.forward(request, response);
			//response.sendRedirect("ChatIndex.jsp");
		} else {
			application.setAttribute("str2", "");//内容设置为空
			String sayStr = "";
			sayStr = "来自" + request.getLocalAddr() + "的"; //来访者IP地址
			sayStr = sayStr+"<b>"+session.getAttribute("name").toString()+"</b>";
			//来访者昵称
			String str2 = application.getAttribute("str2").toString();//表情和内容
			sayStr = sayStr + "于"+ Calendar.getInstance().getTime().toLocaleString()+ "大驾光临"; //来访时间
			sayStr = "<font color='red'>" + sayStr + str2 + "</font>";
			String oldSay="";
			try {
			  oldSay = application.getAttribute("show").toString();			
		} 
		catch (Exception exx) {
		}
			application.setAttribute("show", (sayStr + "<br>" + oldSay));//显示第一句话
			int num = (Integer) application.getAttribute("user_online");
			num++;//登录成功把人数加一
			application.setAttribute("user_online", num);
			response.sendRedirect("chat.jsp");//跳到chat
		}
		
	%>
</body>
</html>
