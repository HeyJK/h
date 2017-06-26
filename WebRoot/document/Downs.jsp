<%@page import="bean.FileInfo"%>
<%@ page language="java" import="java.util.*" %>
<%@ page  language="java" 	contentType="text/html; charset=utf-8"  %>
<%@ page language="java" import="java.sql.*"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head runat="server">
    <title>无标题页</title>
</head>
<body>

<%
		request.setCharacterEncoding("utf-8");
		 List<FileInfo> fileList= (List<FileInfo>)request.getAttribute("fileList");
		 %>
    <form id="form1" runat="server">
     <div class="SubMenu">
       <div style="text-align:center">
       <span style="font-size:20px">资源下载管理中心</span>
	<table cellspacing="0" border="1"  style="border-style:None;width:1024px;border-collapse:collapse; font-size:14px;" align="center">    
          <tr>
			<td style="width:5%">编号</td>
			<td style="width:20%">名称</td>
			<td style="width:30%">路径</td>
			<td style="width:10%">大小</td>
			<td style="width:20%">时间</td>
			<td style="width:13%">操作</td>
		<tr>
			                    
    
<%
	int count=0;
	Iterator it = fileList.iterator();
	while (it.hasNext()) {
		FileInfo file = (FileInfo) it.next();
%>
		<tr>
			<td style="width:10%"><%=file.getFileId() %></td>
			<td style="width:20%"><%=file.getFname() %></td>
			<td style="width:30%"><%=file.getFileUrl() %></td>
			<td style="width:10%"><%=file.getFileSize() %>B</td>
			<td style="width:20%"><%=file.getAdd_time() %></td>
		
			<td style="width:10%">
			<a href="document/DownFile.jsp?addr=<%=file.getFileUrl()  %>" target="_blank"><span >
	                  		下载                                                         
	                  </span></a>
			    <a href="#"    >
	                  <span >
	                  		 修改                                                          
	                  </span></a>
	              <a href="DelDowns?fileID=<%=file.getFileId() %>"    >
	                  <span >
	                     	删除                                                              
	                  </span></a>
	           </td>
		
			</tr>
             
  <%} %>
	</table>
</div>
             
        </div>
    
    </form>
</body>
</html>
