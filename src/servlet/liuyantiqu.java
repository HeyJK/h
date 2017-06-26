package servlet;

import bean.*;

import java.util.*;
import java.io.*;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.swing.DebugGraphics;

import newsbean.liuyan;

import java.sql.*;
import java.util.ArrayList;

public class liuyantiqu extends HttpServlet {

	private static final boolean debug = true;

	public liuyantiqu() {
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
		int startid;
		int ID=5;		
		if (request.getParameter("startid") == null	||request.getAttribute("ID1")!=null) {
			startid = 0;
		
		} else {
			startid = Integer.parseInt(request.getParameter("startid")
					.toString());
		}
		List<newsbean> allbean_ls = new ArrayList<newsbean>();
		List<newsbean> bean_ls = new ArrayList<newsbean>();
		int showPage = 1;
		if (request.getParameter("showPage") == null) {// ÏÔÊ¾µÚ¼¸Ò³
			showPage = (startid / 5 == 0) ? 1 : startid / 5 + 1;
		} else {
			showPage = Integer.parseInt(request.getParameter("showPage"));
			startid=(showPage-1)*5;
		}
		try {
			bean_ls = liuyan.queryListbystartid(startid, ID);
			
			allbean_ls = liuyan.queryListbyid(1000);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		}
		request.setAttribute("showPage", showPage);
		request.setAttribute("allbean_ls", allbean_ls);
		request.setAttribute("bean_ls", bean_ls);
		request.getRequestDispatcher("liuyan/show.jsp").forward(request,
				response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
