<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
	
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>驴友网</title>
</head> 
<body><jsp:include page="head.jsp" />
<%!int show1;%>
<%try{show1=Integer.parseInt(request.getParameter("show"));}
catch (Exception e) {
out.print("");}
if((request.getParameter("show"))==null){show1=1;}
switch(show1){
case 1: %><jsp:include page="body1.jsp" /><%;break;
case 2: %><jsp:include page="body2.jsp" /><%;break;
case 3: %><jsp:include page="body3.jsp" /><%;break;
case 4: %><jsp:include page="body4.jsp" /><%;break;
case 5: %><jsp:include page="body5.jsp" /><%;break;
case 6: %><jsp:include page="body6.jsp" /><%;break;
case 7: %><jsp:include page="body7.jsp" /><%;break;
case 8: %><jsp:include page="body8.jsp" /><%;break;
case 9: %><jsp:include page="body9.jsp" /><%;break;
case 10: %><jsp:include page="body10.jsp" /><%;break;
case 11: %><jsp:include page="body11.jsp" /><%;break;
case 12: %><jsp:include page="body12.jsp" /><%;break;
}%>
<jsp:include page="foot.jsp" />
</body>
</html>