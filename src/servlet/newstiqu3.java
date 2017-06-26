package servlet;

import bean.*;

import java.util.*;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.swing.DebugGraphics;

import newsbean.liuyan;
import newsbean.news;

import java.sql.*;
import java.util.ArrayList;

public class newstiqu3 extends HttpServlet {

	private static final boolean debug = true;

	public newstiqu3() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		List<newsbean> bean_ls = new ArrayList<newsbean>();
		List<newsbean> allbean_ls = new ArrayList<newsbean>();
		newsbean bean = new newsbean();
		int startid ;
		int sum = 10;
		int showPage;
		//提取一个
	if (request.getParameter("ID") != null) {
			int ID = Integer.parseInt(request.getParameter("ID"));
			bean.setId(ID);
			try {
				bean = news.query(ID);
				request.setAttribute("bean", bean);
			} catch (SQLException e) {
			}
			request.setAttribute("bean", bean);
			if (request.getParameter("type").toString().equals("chakan")) {
				request.getRequestDispatcher("body4.jsp").forward(request,
						response);
			}
			else {
				request.getRequestDispatcher("newsadd.jsp").forward(request,
						response);
			} 
			}
			
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
