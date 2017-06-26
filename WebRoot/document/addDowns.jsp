<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"%>
	<%@ page import="java.io.*" %>
	<%@ page import="java.util.*" %>
	<%@ page import="javax.servlet.*" %>
	<%@ page import="javax.servlet.http.*" %>
	

<html>
  <head>
  
    
    <title>My JSP 'uploads.jsp' starting page</title>
    
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
    <p style="text-align:center;font-size:20pt;">文件上传</p>
<p>请选择要上传的文件：</p>
<%
if(request.getAttribute("virPath")==null){
 %>
<form method="post" action="../UpFile" enctype="multipart/form-data">
	<input type="file" name="File1"><br>
	<input type="submit" value="上传" name="sub">
</form>
<%
}else{
	%>	
 <form method="post" action="AddDown" name="ss">
	 请输入文件名:<input type="text" name="fName"><br>
	 已上传文件路径:<input type="text" name="fileUrl" readonly="readonly" value="<%=request.getAttribute("virPath").toString() %>"><br> 
	 已上传文件大小:<input type="text" name="fileSize" readonly="readonly" value="<%=request.getAttribute("fileSize").toString() %>"><br>
	<input type="submit" value="提交" name="submit">
</form>
	<%
}
 %>
  </body>
</html>
