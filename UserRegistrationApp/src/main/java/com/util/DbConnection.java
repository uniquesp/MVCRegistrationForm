package com.util;

import java.sql.*;

public class DbConnection {

	private static Connection connection = null;
	private static final String DB_Driver = "com.mysql.jdbc.Driver";
	private static final String DB_USERNAME = "root";
	private static final String DB_PASSWORD = "";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/user_registration";

	public static Connection createConnection() {
		try {
			if (connection == null || connection.isClosed()) {
				Class.forName(DB_Driver);
				connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static void closeConnection() throws SQLException {
		if (connection != null && !connection.isClosed()) {
			connection.close();
		}
	}
}

