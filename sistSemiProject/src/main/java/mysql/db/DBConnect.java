package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {

	static final String MYSQL_URL="jdbc:mysql://semi.ctenjxtdwkfn.ap-northeast-2.rds.amazonaws.com:3306/semi?serverTimezone=Asia/Seoul";
	
	String driver="com.mysql.cj.jdbc.Driver";
	
	public DBConnect() {
		try {
			Class.forName(driver);
			System.out.println("MySQL 드라이버 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("MySQL 드라이버 실패");
		}
	}
	
	public Connection getConnection() {
		
		Connection conn=null;
		
		try {
			conn=DriverManager.getConnection(MYSQL_URL, "admin2", "inkel357011");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("MySQL 연결실패: url,계정,비밀번호 확인 바랍니다"+e.getMessage());
		}
		
		return conn;
	}
	
	public void dbClose(ResultSet rs,Statement stmt,Connection conn) {
		
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dbClose(Statement stmt,Connection conn) {
		
		try {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn) {
		
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dbClose(PreparedStatement pstmt,Connection conn) {
		
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
