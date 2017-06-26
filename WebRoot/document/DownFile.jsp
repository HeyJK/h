<%@page import="java.io.FileInputStream" %>
<%@page import="java.io.OutputStream"%>
<%@ page  	contentType="text/html; charset=utf-8" errorPage="MyError.jsp"  %>



<%
request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	if(request.getParameter("addr")==null){
		response.sendRedirect("index.jsp");
		return;
	}
    String fileName = request.getParameter("addr");
    byte b[]=fileName.getBytes("utf-8");
    fileName=new String(b);
    String filePath = request.getRealPath(fileName);//物理路径 
   //
   System.out.println(filePath);
   
   // String filePath = "e:\\";
 
    out.clear();
    response.reset();
    response.setContentType("application/x-download");
    response.addHeader("Content-Disposition", "attachment;filename=" + new String(fileName.replaceAll("uploads/", "").getBytes("gb2312"),"ISO-8859-1"));
    OutputStream os = response.getOutputStream();
    try {
        FileInputStream fis = new FileInputStream(filePath );//+ fileName
        try {
            byte[] buffer = new byte[1024 * 10];
            for (int read; (read = fis.read(buffer)) != -1;) {
                os.write(buffer, 0, read);
            }
        } finally {
            fis.close();
        }
    } finally {
        os.close();
    }
    response.reset();
%>
