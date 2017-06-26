package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import newsbean.news;
import bean.newsbean;

public class xiugai extends HttpServlet {

	public xiugai() {
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
		String title = request.getParameter("title");
		String neirong = request.getParameter("neirong");
		newsbean nb = new newsbean();
		if (request.getParameter("type").toString().equals("add")) {//实现添加
			if(request.getParameter("title")==null){response.sendRedirect("newsadd.jsp");}
			else {
				
			
			nb.setTitle(title);
			nb.setNeirong(neirong);
			try {	
				news.addnews(nb);
			} catch (Exception e) {
			}
			response.sendRedirect("newstiqu");}
		} else if (request.getParameter("type").toString().equals("delete")) {//实现删除
			int ID = Integer.parseInt(request.getParameter("ID"));
			nb.setId(ID);
			try {
				news.delete(nb);			
			} catch (Exception e) {
			}
			response.sendRedirect("newstiqu");
		} else if (request.getParameter("type").toString().equals("modify")) {//实现更新
			int ID = Integer.parseInt(request.getParameter("ID"));
			nb.setId(ID);	
			nb.setTitle(title);
			nb.setNeirong(neirong);
			try {
				news.modify(nb);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
			response.sendRedirect("newstiqu");
		}else if (request.getParameter("type").toString().equals("exit")){//退出
		response.sendRedirect("houtai/houtailog.jsp");}
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
