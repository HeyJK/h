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

public class news {

	public static int addnews(newsbean nb) throws SQLException {// �������
		int result = 0;
		result = database.Update("insert into news(title,neirong)values(?,?)",
				new Object[] { nb.getTitle(), nb.getNeirong() });
		return result;
	}

	public static int delete(newsbean nb) throws SQLException {// ɾ������
		int result = 0;
		result = database.Update("delete from news where ID=?",
				new Object[] { nb.getId() });
		return result;
	}

	public static int modify(newsbean nb) throws SQLException {// �������ݿ�
		int result = 0;
		result = database.Update(
				"update news set title=?,neirong=? where ID=?", new Object[] {
						nb.getTitle(), nb.getNeirong(), nb.getId() });
		return result;
	}

	public static newsbean query(int ID) throws SQLException {// ��ѯһ������
		newsbean newsbean = new newsbean();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet res = null;
		conn = database.getConnection();
		pst = conn.prepareStatement("select * from news where ID=?");
		pst.setInt(1, ID);
		res = pst.executeQuery();
		while (res.next()) {
			newsbean = getInstance(res);
		}
		return newsbean;
	}

	public static List<newsbean> queryList(String sql, Object[] params)// ��ѯ����getInstance
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

	public static List<newsbean> queryListbyid(int ID) throws SQLException {// ��ѯ����������queryList
		List<newsbean> newsbean_ls = new ArrayList<newsbean>();
		newsbean_ls = queryList(
				"select * from news  order by ID desc limit 0,?",
				new Object[] { ID });
		return newsbean_ls;
	}

	public static List<newsbean> queryListbystartid(int startid, int ID)
			throws SQLException {// ��ѯ����������queryList��㲻ͬ
		List<newsbean> newsbean_ls = new ArrayList<newsbean>();
		newsbean_ls = queryList(
				"select * from news  limit ?,?",
				new Object[] { startid, ID });
		return newsbean_ls;

	}

	private static newsbean getInstance(ResultSet res) throws SQLException {// ���һ��
		newsbean newbean = new newsbean();
		newbean.setId(res.getInt("ID"));
		newbean.setTitle(res.getString("title"));
		newbean.setNeirong(res.getString("neirong"));
		newbean.setTime(res.getString("time"));
		return newbean;
	}
}