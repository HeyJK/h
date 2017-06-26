package servlet;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpFile extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpFile() {
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

	doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
    	PrintWriter out=response.getWriter();
    	
    	int MAX_SIZE=102400*102400;
    	String rootPath;
       	DataInputStream in=null;
       	FileOutputStream fileOut=null;
       	String remoteAddr=request.getRemoteAddr();
       	String serverName=request.getServerName();
       	String realPath=request.getRealPath("/");
       	realPath=realPath.substring(0,realPath.lastIndexOf("\\"));
       	rootPath=realPath+"\\uploads\\";
       	out.println("上传文件保存目录为"+rootPath);
       	out.println("虚拟路径为"+"/uploads/");
       	String contentType=request.getContentType();//
    try{
       	if(contentType.indexOf("multipart/form-data")>=0){
       		in=new DataInputStream(request.getInputStream());
       		int formDataLength=request.getContentLength();
       		System.out.println("上传的文件字数"+formDataLength);
       		if(formDataLength>MAX_SIZE){
    	   		out.println("<P>上传的文件字数不可以超过"+MAX_SIZE+"</P>");
    	   		return;
       		}
       		byte dataBytes[]=new byte[formDataLength];
       		int byteRead=0;
       		int totalBytesRead=0;
       		while(totalBytesRead<formDataLength){
       			byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
       			totalBytesRead+=byteRead;
       		}
       		String file=new String(dataBytes);
       		/*System.out.println("A:"+file.substring(100,350)+"\n--AAA--\n"
       							+file.substring(file.length()-350,file.length()-100));*/
       		String saveFile=file.substring(file.indexOf("filename=\"")+10);
       		//System.out.println("上传的文件名字:"+saveFile+saveFile.indexOf("\n"));
       		saveFile=saveFile.substring(0, saveFile.indexOf("\n"));
       		//System.out.println("上传的文件名字:"+saveFile+(saveFile.lastIndexOf("\\")+1)+","+(saveFile.indexOf("\"")));
       		saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
       		saveFile=saveFile.substring(0,saveFile.lastIndexOf("."))+new Random().nextInt(1000)+saveFile.substring(saveFile.lastIndexOf("."));
       		//System.out.println("上传的文件名字:"+saveFile);
       		//System.out.println("contentType:"+contentType);
       		int lastIndex=contentType.lastIndexOf("=");
       		String boundary=contentType.substring(lastIndex+1,contentType.length());
       		//System.out.println("B:"+boundary);
       		String fileName=rootPath+saveFile;
       		//System.out.println("服务器的文件名字fileName:"+fileName);
       		int pos;
       		pos=file.indexOf("\n",0)+1;//file.indexOf("filename=\"");
       		pos=file.indexOf("\n",pos)+1;
       		pos=file.indexOf("\n",pos)+1;
       		pos=file.indexOf("\n",pos)+1;
       		int boundaryLocation=file.indexOf(boundary,pos)-4;
       		//System.out.println("boundaryLocation:"+boundaryLocation);
       		//System.out.println("boundaryLocation String:"+file.substring(boundaryLocation-4,boundaryLocation+8));
       		
       		int startPos=((file.substring(0,pos)).getBytes()).length;
       		int endPos=formDataLength-((file.substring(boundaryLocation,file.length())).getBytes()).length;
       		File checkFile=new File(fileName);
       		if(checkFile.exists()){
       			out.println("<p>"+saveFile+"文件已经存在.</p>");
       		}
       		
       		File fileDir=new File(rootPath);
       		if(!fileDir.exists()){
       			fileDir.mkdirs();
       		}
       		fileOut=new FileOutputStream(fileName);
       		fileOut.write(dataBytes,startPos,(endPos-startPos));
       		System.out.println("写入文件 String:"+startPos+","+(endPos-startPos));
       		String result=new String(dataBytes,startPos,(endPos-startPos));
       		/*System.out.println("写入文件 String:"+result.substring(0,10)+"\n--BBB--\n"
       							+result.substring(result.length()-10,result.length()-1));
       		System.out.println("未写入文件 String:"+new String(dataBytes,0,startPos)+"\n--BBB--\n"
       							+new String(dataBytes,endPos-100,formDataLength-endPos+100));
       		*/
       		fileOut.close();
       		out.println("<p><font color=red size=5>"+saveFile+"文件成功上传.</font></p>");
       		request.setAttribute("fileSize", formDataLength);
       		request.setAttribute("virPath", "/uploads/"+saveFile);
       		request.getRequestDispatcher("document/addDowns.jsp").forward(request, response);
       		}
       	else{
       		String content=request.getContentType();
       		out.println("<p>上传的数据类型不是multipart/form-data</p>");
       	}
     }catch(Exception ex){
       	System.out.println(ex.getMessage());   		 
       	throw new ServletException(ex.getMessage());
      }
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
