package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.GuestCommentDto;
import mysql.db.DBConnect;

public class GuestCommentDao {

DBConnect db=new DBConnect();
	
	
	//insert
	public void insertGuestComment(GuestCommentDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into GuestComment(com_seq,writer,pass,guestcomment,writeday)";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCom_seq());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getGuestcomment());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	//list
	public List<GuestCommentDto> getAllGuestComments(String com_seq)
	{
		List<GuestCommentDto> list = new Vector<GuestCommentDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from GuestComment where com_seq=? order by com_seq";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, com_seq);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				GuestCommentDto dto=new GuestCommentDto();
				dto.setCom_seq(rs.getString("com_seq"));
				dto.setWriter(rs.getString("writer"));
				dto.setGuestcomment(rs.getString("guestcomment"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;

	}
	
	public String getContent(String com_seq)
	{
		String content="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select content from guestcomment where com_seq=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, com_seq);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				content=rs.getString("content");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.dbClose(rs, pstmt, conn);
		}
		
		return content;
	}
	
	public void deleteGuestComment(String com_seq)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from GuestComment where com_seq=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,com_seq);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public void updateGuestComment(GuestCommentDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update GuestComment set guestcomment=? where com_seq=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getGuestcomment());
			pstmt.setString(2, dto.getCom_seq());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
}
