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

public class newstiqu extends HttpServlet {

	private static final boolean debug = true;

	public newstiqu() {
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
		int startid ;//分页提取
		int sum = 10;
		int showPage;
		if (request.getParameter("startid") == null) {
			startid = 0;
			}
			else {
				startid = Integer.parseInt(request.getParameter("startid"));
			}
		if (request.getParameter("showPage") == null) {// 显示第几页
			showPage = (startid / 10 == 0) ? 1 : startid / 10 + 1;
		} else {
			showPage = Integer.parseInt(request.getParameter("showPage"));
			startid =(showPage-1)*10;
		}		
			try {
				bean_ls = news.queryListbystartid(startid, sum);
				allbean_ls = news.queryListbyid(1000);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("showPage", showPage);
			request.setAttribute("allbean_ls", allbean_ls);
  		    request.setAttribute("bean_ls", bean_ls);
			request.getRequestDispatcher("houtai/right.jsp")
					.forward(request, response);
		} 	
	public void init() throws ServletException {
		// Put your code here
	}

}
