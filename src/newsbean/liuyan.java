package newsbean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comn.database;
import com.mysql.jdbc.Statement;

import bean.newsbean;

public class liuyan {

	public static int addliuyan(newsbean nb) throws SQLException {// 添加新闻
		int result = 0;
		result = database.Update("insert into liuyan(yhm,yx,sj,title,neirong)value(?,?,?,?,?)",
				new Object[] { nb.getYhm(), nb.getYx(),nb.getSj(),nb.getTitle(),nb.getNeirong() });
		return result;
	}

	public static int delete(newsbean nb) throws SQLException {// 删除新闻
		int result = 0;
		result = database.Update("delete from liuyan where ID=?",
				new Object[] { nb.getId() });
		return result;
	}
	
	public static List<newsbean> queryList(String sql, Object[] params)//查询调用getInstance
			throws SQLException {
		Connection conn = null;
		List<newsbean> newsbean_ls = new ArrayList<newsbean>();
		PreparedStatement pst = null;
		ResultSet res = null;
		try {
			conn = database.getConnection();
			pst = conn.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					Object param = params[i];
					pst.setObject(i + 1, param);
					
				}
			}
			res = pst.executeQuery();
			while (res.next()) {
				newsbean_ls.add(getInstance(res));
			}
		} finally {
			database.databaseclose(conn, pst);
		}
		return newsbean_ls;
	}

	public static List<newsbean> queryListbyid(int ID) throws SQLException {//查询多少条调用queryList
		List<newsbean> newsbean_ls = new ArrayList<newsbean>();
		newsbean_ls = queryList(
				"select * from liuyan  order by ID desc limit 0,?",
				new Object[] { ID });
		return newsbean_ls;

	}
	public static List<newsbean> queryListbystartid(int startid,int ID) throws SQLException {//查询多少条调用queryList
		List<newsbean> newsbean_ls = new ArrayList<newsbean>();
		newsbean_ls = queryList(
				"select * from liuyan  order by ID desc limit ?,?",
				new Object[] {startid ,ID});
		return newsbean_ls;

	}
	private static newsbean getInstance(ResultSet res) throws SQLException {//获得一条
		newsbean newbean = new newsbean();
		newbean.setId(res.getInt("ID"));
		newbean.setYhm(res.getString("yhm"));
		newbean.setYx(res.getString("yx"));
		newbean.setSj(res.getString("sj"));
		newbean.setTitle(res.getString("title"));
		newbean.setNeirong(res.getString("neirong"));
		return newbean;
	}

}