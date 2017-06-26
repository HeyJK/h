package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.newsbean;

public class liuyanmangerlogo extends HttpServlet {

	private ServletRequest session;

	public liuyanmangerlogo() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();//在servlet中使用session
		String delete="delete";
		int startid=0;	
		String str = request.getParameter("zhanghao");
		if(!(request.getParameter("yzm").toString().toUpperCase().equals(session.getAttribute("rand")))){		
			request.setAttribute("yzm", "验证码错误");
			RequestDispatcher rd=request.getRequestDispatcher("liuyan/manager.jsp");
			rd.forward(request, response);}
			if (str == null || str.length() == 0) { //判断昵称是否为空或者不存在  
			request.setAttribute("zhanghao", "用户名出错");
			RequestDispatcher rd1=request.getRequestDispatcher("liuyan/manager.jsp");
			rd1.forward(request, response);
			}
		if (request.getParameter("type").toString().equals("delete")) {
			if (request.getParameter("zhanghao") != null&&request.getParameter("zhanghao").toString().equals("1234")) {						
				session.setAttribute("delete", delete);
				request.setAttribute("startid1", startid);
				System.out.print("liuyanmanger");
				request.getRequestDispatcher("liuyantiqu").forward(request,
						response); }
				else {
					response.sendRedirect("liuyan/manager.jsp");
				}
			}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
