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
<title>My JSP '4.jsp' starting page</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0;
}

a {
	text-decoration: none;
}

#r1-1 {
	position: relative;
	width: 100%;
	height: 227px;
	background-image: url(/h/img/08.jpg);
}

#r1-2 {
	width: 120px;
	position: absolute;
	right: 110px;
	bottom: 0px;
}

#r1-3 {
	width: 120px;
	position: absolute;
	right: 320px;
	bottom: 0px;
}

#r1-4 {
	width: 120px;
	position: absolute;
	right: 530px;
	bottom: 0px;
}

#r1-5 {
	width: 140px;
	position: absolute;
	right: 740px;
	bottom: 0px;
}

#r1-6 {
	width: 98%;
	margin-left: 10px;
	height: 20px;
	background-color: #0000FF;
	border-radius: 15%;
}

#r1-7 {
	width: 98%;
}

table tr td,th {
	border: 1px solid gray;
	width: 130px;
	height: 50px;
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
	<div id="r1-1">
		<div id="r1-2">
			<img src="/h/img/10.png"><a href="houtai/houtailog.jsp"
				target="_top"><h15>注销</h15></a>
		</div>
		<div id="r1-3">
			<img src="/h/img/12.png"><a href="#"><h15>帮助</h15></a>
		</div>
		<div id="r1-4">
			<img src="/h/img/11.png"><a href="#"><h15>用户</h15></a>
		</div>
		<div id="r1-5">
			<img src="/h/img/09.png"><a href="zhu.jsp" target="_top"><h15>首页</h15></a>
		</div>
	</div>
	<div id="r1-6"></div>
	<div id="r1-7">

		<%!int pageSize = 10;
	int pageCount;
	int showPage;%>

		<%
			if (request.getAttribute("showPage") == null) {
				showPage = 1;
			}//初次进入默认为第一页
			else {
				showPage = Integer.parseInt(request.getAttribute("showPage")
						.toString());
			}
			if (request.getAttribute("bean_ls") != null) {//取值
				List<newsbean> bean_ls = (List<newsbean>) request
						.getAttribute("bean_ls");
				List<newsbean> allbean_ls = (List<newsbean>) request
						.getAttribute("allbean_ls");
				int recordCount = allbean_ls.size();
				int recordCount1 = bean_ls.size();
				pageCount = (recordCount % pageSize == 0) ? (recordCount / pageSize)
						: (recordCount / pageSize + 1);
				for (newsbean bean : bean_ls) {
		%>
		<center>
			<table>
				<tr>
					<td>第<%=bean.getId()%>条
					</td>
					<td>
						<%
							if (bean.getTitle() == null) {
									} else {
										out.print(bean.getTitle());
									}
						%>
					</td>
					<td>
						<%
							if (bean.getNeirong() == null) {
									} else if (bean.getNeirong().length() < 12) {
										out.print(bean.getNeirong());
									} else {
										out.print(bean.getNeirong().substring(0, 10) + "...");
									}
						%>
					</td>

					<td>
						<%
							if (bean.getTime() == null) {
									} else {
										out.print(bean.getTime().substring(0, 10));
									}
						%>

					</td>
					<td><a href="xiugai?ID=<%=bean.getId()%>&type=delete">删除</a></td>
					<td><a href="newstiqu3?ID=<%=bean.getId()%>&type=modify">修改</a></td>
					<td><a href="newstiqu3?type=chakan&ID=<%=bean.getId()%>">查看</a></td>
				</tr>

			</table>
			<hr>
			<%
				}
			%>
			<br> 第<%=showPage%>页（共<%=pageCount%>页） <br> <a
				href="newstiqu?startid=0%>">首页</a> <a
				href="newstiqu?startid=<%=((showPage - 1) == 0) ? 0 : (showPage - 2) * pageSize%>">上一页</a>
			<%
				//根据pageCount的值显示每一页的数字并附加上相应的超链接
					for (int i = 1; i <= pageCount; i++) {
			%>
			<a href="newstiqu?startid=<%=(i - 1) * pageSize%>"><%=i%></a>
			<%
				}
			%>
			<a
				href="newstiqu?startid=<%=(showPage) * pageSize > (recordCount ) ? (showPage - 1)
						* pageSize
						: (showPage) * pageSize%>">下一页</a>
			<a href="newstiqu?startid=<%=(pageCount - 1) * pageSize%>">末页</a>
			<form action="newstiqu" method="post">
				跳转到第<input type="text" name="showPage" size="5">
				<!-- 输入框的大小 -->
				页 <input type="submit" name="submit" value="跳转">
			</form>
			<a href="/h/zhu.jsp " target="_top">返回首页</a>
			<%
				}
			%>
		</center>
	</div>
</body>
</html>
