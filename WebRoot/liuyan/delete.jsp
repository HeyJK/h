<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'show.jsp' starting page</title>
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
		ResultSet rs;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			out.print("没有导入驱动程序");
		}
		try {
			String uri = "jdbc:mysql://127.0.0.1/liuyan";
			String user = "root";
			String password = "1234";
			con = DriverManager.getConnection(uri, user, password);
			sql = con.prepareStatement("delete from liuyan where ID=?");//"?"是通配符，预处理
			sql.setInt(1,Integer.parseInt(request.getParameter("ID").toString()));//"1"代表通配符1个问号就是1
			sql.executeUpdate();
			sql.cancel();
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
		response.sendRedirect("show.jsp");
	%>
</body>
</html>
