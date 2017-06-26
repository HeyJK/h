package com.comn;

import java.sql.*;

public class database {
	public static Connection getConnection() throws SQLException {// 链接数据库
		Connection connection = null;
		String uri = "jdbc:mysql://127.0.0.1/liuyan";
		String user = "root";
		String password = "0519";
		 System.out.println("Connection");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
		} catch (Exception e) {
			System.out.println("Connection失败");
		}
		connection = DriverManager.getConnection(uri, user, password);
		//System.out.println("Connection");
		return connection;
	}

	public static void databaseclose(Connection connection, PreparedStatement ps)
			throws SQLException {//关闭数据库
		if (ps != null) {
			ps.close();
		}
		if (connection != null) {
			connection.close();
		}
	}

	public static int Update(String sql, Object[] params) throws SQLException {// 更新数据库
		Connection connection = database.getConnection();
		int j = 0;
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					Object param = params[i];
					pst.setObject(i + 1, param);
          System.out.println("Update");
				}
			} System.out.println("Update1");
			j=pst.executeUpdate();
			System.out.println("Update2");
		} finally {
			if (connection != null) {
				connection.close();
			}
		} 
		return j;

	}
}
