package servlet;

import bean.*;

import java.util.*;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.swing.DebugGraphics;

import newsbean.news;

import java.sql.*;
import java.util.ArrayList;

public class newstiqu2 extends HttpServlet {

	private static final boolean debug = true;

	public newstiqu2() {
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
		int startid;
		int ID;
		if(request.getParameter("startid")==null){
			 startid = 0;}
		else {
			 startid =Integer.parseInt( request.getParameter("startid"));
		}if(request.getParameter("ID")==null){
			 ID = 10;}
		else {
			ID =Integer.parseInt( request.getParameter("ID"));}
			try {
				bean_ls = news.queryListbystartid(startid, ID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("bean_ls", bean_ls);
			request.getRequestDispatcher("body3.jsp")
					.forward(request, response);
		}	
	public void init() throws ServletException {
		// Put your code here
	}

}
