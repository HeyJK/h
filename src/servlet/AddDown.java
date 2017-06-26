package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import newsbean.FileDao;
import bean.FileInfo;

import java.io.*;
import java.util.*;

public class AddDown extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddDown() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
    	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");
        String fName = request.getParameter("fName");
        String fileUrl=request.getParameter("fileUrl");
        String fileSize=request.getParameter("fileSize");    
       System.out.println(fName+fileUrl+fileSize);
       FileInfo news=new FileInfo();
       news.setFname(fName);
       news.setFileUrl(fileUrl);
       news.setFileSize(fileSize);
       try{
    	   FileDao.addFile(news);
       }catch(Exception e){}   
       response.sendRedirect("Downs");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
