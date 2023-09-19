package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import data.dto.ContentBoardDto;
import mysql.db.DBConnect;

public class ContentBoardDao {

	   DBConnect db = new DBConnect();
	   
	   //댓글 삽입
	   public void insertContent(ContentBoardDto dto) {
	      
	      Connection conn = db.getConnection();
	      PreparedStatement pstmt =null;
	      
	      String sql = "insert into contentboard values(?,?,now())";
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getId());
	         pstmt.setString(2, dto.getContent());
	         pstmt.execute();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         db.dbClose(pstmt, conn);
	      }
	   } 
}
