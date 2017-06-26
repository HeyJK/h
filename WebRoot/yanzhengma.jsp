<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %> 
<%@ page contentType="image/jpeg" import="java.awt.*,java.awt.image.*,javax.imageio.*"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>My JSP 'verify.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--<link rel="stylesheet" type="text/css" href="styles.css">-->

</head>
<body>
	<%! int Countline=20;
	Color getRandColor(int fc,int bc)//给定范围随机选颜色 
{ 
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}%>
	<%
 	response.setHeader("Pragma", "No-cache");//设置页面不缓冲 
 	response.setHeader("Cache-Control", "no-cache");
 	response.setDateHeader("Expires", 0);
 	int width = 60, height = 20;
 	BufferedImage image = new BufferedImage(width, height,
 			BufferedImage.TYPE_INT_RGB);
 	Graphics g = image.getGraphics();//获取图像上下文 
 	Graphics f = image.getGraphics();//获取图像上下文 
 	Random random = new Random();//生成随机对象 
 	f.setColor(getRandColor(120, 200));
 	f.fillRect(0, 0, width, height);
 	g.setFont(new Font("Times New Roman", Font.PLAIN, 18));//设置字体 
 	for (int i = 0; i < Countline; i++) {
 		int x = random.nextInt(60);
 		int y = random.nextInt(18);
 		int x1 = random.nextInt(18);
 		int y1 = random.nextInt(3);
 		g.drawLine(x, y, x + x1, y + y1);
 	}
 	//随机产生验证码 
 	String sRand = "";
 	for (int i = 0; i < 4; i++) {
 		String rand = String.valueOf((char) ('A' + random.nextInt(26)));
 		sRand += rand;
 		//将验证码显示到图像中 
 		g.setColor(new Color(20 + random.nextInt(110), 20 + random
 				.nextInt(110), 20 + random.nextInt(110)));
 		//设置显示随机数的颜色 
 		g.drawString(rand, 13 * i + 6, 16);
 	}
 	//将验证码存放到session中 
 	session.setAttribute("rand", sRand);
 	
 	//图像生效 
 	g.dispose();
 	//输出图像到页面 
 	ImageIO.write(image, "JPEG", response.getOutputStream());
 	out.clear();
 	out = pageContext.pushBody();
 %>

</body>
</html>
