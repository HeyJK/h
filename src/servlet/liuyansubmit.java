package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import newsbean.liuyan;
import newsbean.news;
import bean.newsbean;

public class liuyansubmit extends HttpServlet {

	public liuyansubmit() {
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
		String yhm = request.getParameter("yhm");
		String yx = request.getParameter("yx");
		String sj = request.getParameter("sj");
		String title = request.getParameter("title");
		String neirong = request.getParameter("neirong");
		newsbean nb = new newsbean();	
		if (request.getParameter("type").toString().equals("add")) {
			try {
				nb.setYhm(yhm);
				nb.setYx(yx);
				nb.setSj(sj);
				nb.setTitle(title);
				nb.setNeirong(neirong);
				liuyan.addliuyan(nb);
			} catch (Exception e) {
			}
			response.sendRedirect("liuyan/liuyan.jsp");
		} 
		if (request.getParameter("type").toString().equals("delete")) {
			try {int id=Integer.parseInt(request.getParameter("ID")) ;
			nb.setId(id);
				liuyan.delete(nb);
			} catch (Exception e) {
				// TODO: handle exception
			}response.sendRedirect("liuyantiqu");
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
