<%@ page language="java" import="java.util.*"
	 contentType="text/html; charset=utf-8"%>
<%@ page  import="java.sql.*"%>
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
<base href="<%=basePath%>">
<title>My JSP 'show.jsp' starting page</title>
<style type="text/css">
table {
	table-layout: fixed;
	word-break: break-all;
}

table tr td,th {
	border: 1px solid gray;
	width: 180px;
	height: 50px;
}

td {
	white-space: nowrap;
	overflow: hidden;;
	text-overflow: ellipsis;
}
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
				rs = con.createStatement()
						.executeQuery("select * from liuyan order by ID desc");
				while (rs.next()) {
		%><table>
			<tr>
				<td>第<%=rs.getInt(1)%>条留言</td>
				<td><a href="delete.jsp?ID=<%=rs.getInt(1)%>">删除</a></td>
			</tr>

			<tr>
				<td>用户名</td>
				<td><%=rs.getString(2)%></td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<tr>
				<td>手机</td>
				<td><%=rs.getString(4)%></td>
			</tr>
			<tr>
				<td>主题</td>
				<td><%=rs.getString(5)%></td>
			</tr>
			<tr>
				<td>内容</td>
				<td><%=rs.getString(6)%></td>
			</tr>
			<tr>
				<td>时间</td>
				<td><%=rs.getString(7)%></td>
			</tr>
			<%}
		
					con.close();

				} catch (Exception e) {
					out.print(e);
				}
			%>
		</table>
</body>
</html>
