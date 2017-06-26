package servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FileInfo;
import newsbean.FileDao;

public class DelDowns extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelDowns() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=gb2312");
    	request.setCharacterEncoding("gb2312");
		 int fileID= 0;
		 try{
		    fileID=Integer.parseInt(request.getParameter("fileID"));		
			FileInfo file=FileDao.queryFile(fileID);
			FileDao.deleteFile(file);
		 }catch(Exception edd){
			 fileID= 0;
		 }
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
