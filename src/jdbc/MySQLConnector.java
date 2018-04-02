package jdbc;


import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MySQLConnector {

	private String dbURL = "jdbc:mysql://localhost:3307/member";
	private String dbUSER = "root";
	private String dbPASSWORD = "123456";
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	public MySQLConnector() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			System.out.println("라이브러리를 찾지 못하였습니다 : "+ e);
		}try {
			DriverManager.getConnection(dbURL, dbUSER, dbPASSWORD);
		}catch(Exception e) {
			System.out.println("MySQL 연결에 실패하였습니다.");
			System.out.println("1. URL 정보를 다시 확인하세요.");
			System.out.println("2. USER 정보를 다시 확인하세요.");
			System.out.println("3. PASSWORD 정보를 다시 확인하세요.");
		}
	}
	
	public Connection getConnection() {
		return conn;
	}
	
	public ResultSet select(String query, Connection conn) {
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			System.out.println("MySQL 연결정보를 불러올 수 없습니다. : " + e );
		}
		try {
			rs = stmt.executeQuery(query);
		}catch (SQLException e) {
			System.out.println("MySQL query문이 올바르지 않습니다.");
		}
		
		return rs;
		
	}
	
	public boolean insert(String query, Connection conn) {
		try {
			stmt = conn.createStatement();
		}catch (SQLException e) {
			System.out.println("MySQL 연결정보를 불러올 수 없습니다");
		}
		Boolean resultValue = null;
		try {
			resultValue = stmt.execute(query);
		}catch (Exception e) {
			System.out.println("MySQL query문이 올바르지 않습니다.");
		}
		
		return resultValue;
	}
	
}




