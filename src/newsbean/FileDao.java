package newsbean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comn.database;

import bean.FileInfo;

public class FileDao {

	public FileDao() {
		// TODO Auto-generated constructor stub
	}
	/*�½���Դ�ļ�*/ 
	public static int addFile(FileInfo file) throws SQLException{
		int result=0;
		result=database.Update("insert into download(fname,fileUrl,fileSize) values (?,?,?)", 
				new Object[]{file.getFname(),file.getFileUrl(),file.getFileSize()});
		System.out.print("add"+result);
		return result;
	}
/*ɾ����Դ�ļ�*/
	public static int deleteFile(FileInfo file) throws SQLException{
		int result=0;
		result=database.Update("delete from download where fileid=?", new Object[]{
				file.getFileId()
		});
		return result;
	}
/*�޸���Դ�ļ�*/
    public static int modifyFile(FileInfo file) throws SQLException{
    	int result=0;
    	result=database.Update("update download set fname=?,fileUrl=?,fileSize=? where fileid=?", new Object[]{
    			file.getFname(),
				file.getFileUrl(),
				file.getFileSize(),
				file.getFileId()
    	});
    	return result;
    }	
/*��ѯһ����Դ�ļ�*/	
	public static FileInfo queryFile(int file_id) throws SQLException{
		FileInfo file=new FileInfo();
				Connection conn=null;
				PreparedStatement pst=null;
				ResultSet res=null;
				conn=database.getConnection();
				pst=conn.prepareStatement("select * from download where fileid=?");
				pst.setInt(1,file_id);
				res=pst.executeQuery();
				while(res.next()){
					file=getInstance(res);
				}		
				return file;
	}

/*��ȡ��Դ�ļ��б�*/
    public static List<FileInfo> getFileList(String sql,Object[] params) throws SQLException{		 
		List<FileInfo> fileList=new ArrayList<FileInfo>();
		Connection conn= null;
		PreparedStatement pst=null;
		ResultSet res=null;
		try {
			conn = database.getConnection();
			pst = conn.prepareStatement(sql);		
			if(params != null) {
				for(int i=0;i<params.length;i++) {
					Object param =params[i];
					pst.setObject(i+1, param);
				}
			}
			res=pst.executeQuery();
			while(res.next()){
				fileList.add(getInstance(res));
			}
			
		} finally {
			database.databaseclose(conn, pst);
			}
		return fileList;
	}
    
    public static List<FileInfo> getFileByNum(int num) throws SQLException{
 	   List<FileInfo> fileList=new ArrayList<FileInfo>();
 	  fileList=getFileList("select * from download  order by Fileid desc limit 0,?",new Object[]{
 			 num
 	        });
 	    return fileList;
    } 

/*һ����Դ�ļ�ʵ��*/	
	public static FileInfo getInstance(ResultSet res) throws SQLException{
				FileInfo file=new FileInfo();
				file.setFileId(res.getInt("FileId"));
				file.setFname(res.getString("fname"));
				file.setFileUrl(res.getString("fileUrl"));
				file.setFileSize(res.getString("fileSize"));
				file.setAdd_time(res.getString("add_time"));
			    return file;
	}
}
