package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.MemberCommentDto;
import mysql.db.DBConnect;

public class MemberCommentDao {

	
DBConnect db=new DBConnect();
	
	public void insertMemberComment(MemberCommentDto dto) 
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into MemberComment(con_seq,id,membercomment,writeday) values(?,?,?,now())";
	
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCom_seq());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getMembercomment());
			pstmt.setTimestamp(4, dto.getWriteday());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public List<MemberCommentDto> getAllMemberComments(String com_seq)
	{
		List<MemberCommentDto> list=new Vector<MemberCommentDto>();
		 
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from MemberComment where com_seq=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, com_seq);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				MemberCommentDto dto=new MemberCommentDto();
				dto.setCom_seq(rs.getString("com_seq"));
				dto.setId(rs.getString("id"));
				dto.setMembercomment(rs.getString("membercomment"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	
	
	public void deleteMemberComment(String com_seq)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from MemberComment where com_seq=?";
		
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
	
	public void updateMemberComment(MemberCommentDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update MemberComment set membercomment=? where com_seq=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMembercomment());
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
