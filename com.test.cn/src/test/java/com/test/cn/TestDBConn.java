package com.test.cn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestDBConn {
	public static void main(String[] args) {
		ResultSet rs = null;
	    Statement stmt = null;
	    Connection conn = null;
	    try {
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	        conn = DriverManager.getConnection(dbURL, "scott", "accp");
	        System.out.println("连接成功"+ conn);
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	                rs = null;
	            }
	            if (stmt != null) {
	                stmt.close();
	                stmt = null;
	            }
	            if (conn != null) {
	                conn.close();
	                conn = null;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
}
