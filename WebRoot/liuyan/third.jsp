
<%@ page language="java" import="java.util.*"
	 contentType="text/html; charset=utf-8"%>
<%@ page  import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'third.jsp' starting page</title>

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
		Connection con;
		PreparedStatement sql;
		ResultSet res;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			out.print("12313");
		}
		try{String uri="jdbc:mysql://127.0.0.1/liuyan? characterEncoding=utf-8";
		String user="root";
		String password="1234";
		con=DriverManager.getConnection(uri,user,password);
		sql=con.prepareStatement("insert into liuyan(yhm,yx,sj,zt,neirong)value(?,?,?,?,?)");
		sql.setString(1, request.getParameter("yhm"));
		sql.setString(2, request.getParameter("yx"));
		sql.setString(3, request.getParameter("sj"));
		sql.setString(4, request.getParameter("zt"));
	    sql.setString(5, request.getParameter("neirong"));
		sql.executeUpdate();
		sql.cancel();
		con.close();
		}
		catch (Exception e) {	
			out.print(e);}
			response.sendRedirect("first.jsp");
	%>
</body>
</html>
