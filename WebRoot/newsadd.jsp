<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,bean.*"%>
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


<title>My JSP 'newsadd.jsp' starting page</title>

<style type="text/css">
#n1-1 {
	background-color: #ffa;
	width: 100%;
	height: 150px;
	margin-top: 0;
	padding-top: 50px;
}

#n1-2 {
	background-color: #ade;
}

p {
	font-size: 25px;
}
</style>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="bianjiqi/third-party/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="bianjiqi/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="bianjiqi/umeditor.min.js"></script>
<script type="text/javascript" src="bianjiqi/lang/zh-cn/zh-cn.js"></script>
<link href="bianjiqi/themes/default/css/umeditor.css" type="text/css"
	rel="stylesheet">
<!--<link rel="stylesheet" type="text/css" href="styles.css">-->

</head>
<div id="n1"></div>
<center>
<% newsbean bean=(newsbean)request.getAttribute("bean");
	if(bean!=null){%>
		<form action="xiugai?ID=<%=bean.getId() %>&type=modify" method="post">
		<div id="n1-2">
			<p>标题</p>
			</h>
			<input type="text" name="title" style="height: 50px;width: 200px;"value="<%=bean.getTitle() %>">
		</div>
		<br>
		<script type="text/plain" id="neirong" name="neirong"
			style="width:1000px;height:240px;"><%=bean.getNeirong() %></script>
		<script type="text/javascript">
			var um = UM.getEditor('neirong');
		</script>
		<br>
		<div id="n1-1">
			<input type="submit" name="submit" value="提交"
				style="width: 150px;height: 50px;"> <input type="reset"
				name="reset" value="重置" style="width: 150px;height: 50px;">
		</div>
	</form>
	<%}else{%>
		<form action="xiugai?type=add" method="post">
		<div id="n1-2">
			<p>标题</p>
			</h>
			<input type="text" name="title" style="height: 50px;width: 200px;"value="">
		</div>
		<br>
		<script type="text/plain" id="neirong" name="neirong"
			style="width:1000px;height:240px;"></script>
		<script type="text/javascript">
			var um = UM.getEditor('neirong');
		</script>
		<br>
		<div id="n1-1">
			<input type="submit" name="submit" value="提交"
				style="width: 150px;height: 50px;"> <input type="reset"
				name="reset" value="重置" style="width: 150px;height: 50px;">
		</div>
	</form><%
	}
 %>
</center>
<body>
</body>
</html>
