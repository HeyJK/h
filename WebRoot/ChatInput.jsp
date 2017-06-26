<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<html>
  <head>
   
    
    <title>My JSP 'ChatInput.jsp' starting page</title>
    
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
  <%out.print(session.getAttribute("name"));%>
  <form action="" method="post" name="form">
     <select name="biaoqing">
     <option value="高兴地说" >高兴地说</option>
     <option value="伤心地说" >伤心地说</option>
     <option value="快乐地说" >快乐地说</option>
     <option value="哭泣地说" >哭泣地说</option>
     </select>
     <select name="color">
     <option value="red" >红色</option>
     <option value="blue" >蓝色</option>
     <option value="green" >绿色</option>
     <option value="black" >黑色</option>
     </select>
      <input type="text" name="input">
     <input type="submit" value="发言">
     <a href="Exit.jsp" target="_top">退出</a>
     </form>
     
      <%
      	application.setAttribute("input", "");//为application里的input设置初值
      	 %>
   <%
     if(request.getParameter("input")!=null)//判断输入是否为空
    { String input=request.getParameter("input");
       String str1=request.getParameter("biaoqing");
       String str2=str1+input;
       application.setAttribute( "str2",str2);
       application.setAttribute("input", input); //把输入的相关数据放入input
      }  
 %>
 <%		
		String sayStr = "";
		sayStr = "来自" + request.getLocalAddr() + "的"; //来访者IP地址
		sayStr = sayStr + "<b>" + session.getAttribute("name").toString()+ "</b>";
		//来访者昵称
		String str2 = application.getAttribute("str2").toString();//表情和内容
		sayStr = sayStr + "于"+ Calendar.getInstance().getTime().toLocaleString(); //来访时间
		sayStr = "<font color='"+request.getParameter("color")+"'>" + sayStr + str2 + "</font>"; //红色显示
		//application.setAttribute("sayStr", sayStr);		
		String oldSay ="";
		try {int um=(Integer)(application.getAttribute("user_online"))+1;
			  oldSay = application.getAttribute("show").toString();			
		} 
		catch (Exception exx) {
		}
		//下面几句将来访信息保存到Application中	
		if (application.getAttribute("input").toString().length()==0) {
			application.setAttribute("show", oldSay);	
		    //application.setAttribute("input", "");
		    }
		else{	
		application.setAttribute("show", (sayStr + "<br>" + oldSay));
		}
		// '显示聊天内容
	%>
  </body>
</html>
