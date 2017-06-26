<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" import="bean.*" %>
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
<style type="text/css">
body {
	background-color: #ffa;
}

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

a {
	text-decoration: none;
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
          <%!int pageSize = 5;
			int pageCount;
			int showPage;%>
			
	<%
	if(request.getAttribute("showPage")==null){showPage=1;}//初次进入默认为第一页
	else{showPage=Integer.parseInt(request.getAttribute("showPage").toString()); }
		if (request.getAttribute("bean_ls") != null) {//取值
			List<newsbean> bean_ls = (List<newsbean>) request
			.getAttribute("bean_ls");
			List<newsbean> allbean_ls = (List<newsbean>) request
					.getAttribute("allbean_ls");	
			int recordCount = allbean_ls.size();
			int recordCount1 = bean_ls.size();
	pageCount = (recordCount % pageSize == 0) ? (recordCount / pageSize) :(recordCount / pageSize + 1);
	 for (newsbean bean : bean_ls) { %>
	<center>
		<table>
			<tr>
				<td>第<%=bean.getId()%>条留言
				</td>
				<td>
					<%
						if (session.getAttribute("delete") != null) {
					%><a href="liuyansubmit?ID=<%=bean.getId()%>&type=delete">删除</a> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<td>用户名</td>
				<td>
					<%
						if (bean.getYhm() == null) {
								} else {
									out.print(bean.getYhm());
								}
					%>
				</td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td>
					<%
						if (bean.getYx() == null) {
								} else {
									out.print(bean.getYx());
								}
					%>
				</td>
			</tr>
			<tr>
				<td>手机</td>
				<td>
					<%
						if (bean.getSj() == null) {
								} else {
									out.print(bean.getSj());
								}
					%>
				</td>
			</tr>
			<tr>
				<td>主题</td>
				<td>
					<%
						if (bean.getTitle() == null) {
								} else {
									out.print(bean.getTitle());
								}
					%>
				</td>
			</tr>
			<tr>
				<td>内容</td>
				<td>
					<%
						if (bean.getNeirong() == null) {
								} else {
									out.print(bean.getNeirong());
								}
					%>
				</td>
			</tr>
			<tr>
				<td>时间</td>
				<td>
					<%
						if (bean.getTime() == null) {
								} else {
									out.print(bean.getTime());
								}								
		%>
				</td>
			</tr>
		</table>
		<hr>
		<%}%>
		<br> 第<%= showPage%>页（共<%=pageCount%>页） <br> <a
			href="liuyantiqu?startid=0%>">首页</a> <a
			href="liuyantiqu?startid=<%=(showPage - 1)*pageSize%>">上一页</a>
		<%
			//根据pageCount的值显示每一页的数字并附加上相应的超链接
				for (int i = 1; i <=pageCount; i++) {
		%>
		<a href="liuyantiqu?startid=<%=(i-1)*pageSize%>"><%=i%></a>
		<%
			}
		%>
		<a
			href="liuyantiqu?startid=<%=(showPage)*pageSize%>">下一页</a>
		<a
			href="liuyantiqu?startid=<%=(pageCount-1)*pageSize%>">末页</a>
		<form action="liuyantiqu" method="post">
			跳转到第<input type="text" name="showPage" size="5">
			<!-- 输入框的大小 -->
			页 <input type="submit" name="submit" value="跳转">
		</form>
		<a href="liuyan/manager.jsp">超级管理员登录</a> <a href="liuyan/exit.jsp">退出管理员</a> <a
			href="liuyan/liuyan.jsp">返回留言</a> <a href="/h/zhu.jsp "target="_top">返回首页</a>
		<%} %>
	</center>
</body>
</html>
