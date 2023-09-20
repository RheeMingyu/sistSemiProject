package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.GuestDto;
import mysql.db.DBConnect;

public class GuestDao {


		DBConnect db=new DBConnect();
		
		//insert
		public void insertGuest(GuestDto dto)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="insert into guest(nickname,pass,photo,writeday)values(?,?,?,now())";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getNickname());
				pstmt.setString(2, dto.getPass());
				pstmt.setString(3, dto.getPhoto());
				pstmt.setTimestamp(4, dto.getWriteday());
				
				pstmt.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
	
}
