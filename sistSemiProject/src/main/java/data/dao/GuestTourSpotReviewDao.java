package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.GuestReviewDto;
import mysql.db.DBConnect;

public class GuestTourSpotReviewDao {

DBConnect db=new DBConnect();
	
	//insert
	public void insertGuestReview(GuestReviewDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into GuestReview values(null,?,?,?,?,?,now(),?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTour_seq());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getPhoto());
			pstmt.setString(5, dto.getTitle());
			pstmt.setString(6, dto.getViewcount());
			pstmt.setString(7, dto.getLikes());
			pstmt.setString(8, dto.getContent());
			pstmt.setString(9, dto.getStars());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public int getTotalCount()
	{
		int total=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from GuestReview";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				total=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return total;
		
	}
	
	public List<GuestReviewDto> getPagingList(int startNum,int perPage)
	{
		List<GuestReviewDto> list = new ArrayList<GuestReviewDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from GuestReview limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, perPage);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
			GuestReviewDto dto=new GuestReviewDto();
			
			dto.setCom_seq(rs.getString("com_seq"));
			dto.setNickname(rs.getString("nickname"));
			dto.setPass(rs.getString("pass"));
			dto.setTitle(rs.getString("title"));
			dto.setPhoto(rs.getString("photo"));
			dto.setContent(rs.getString("content"));
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
	
	
	public ArrayList<GuestReviewDto> getAllGuestReviews()
	{
		ArrayList<GuestReviewDto> list=new ArrayList<GuestReviewDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from GuestReview order by com_seq desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				GuestReviewDto dto=new GuestReviewDto();
				
				dto.setCom_seq(rs.getString("com_seq"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPass(rs.getString("pass"));
				dto.setPhoto(rs.getString("photo"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		return list;
		
	}
	
	public GuestReviewDto getGuestReview(String com_seq)
	{
		GuestReviewDto dto=new GuestReviewDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from GuestReview where com_seq=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, com_seq);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setCom_seq(rs.getString("com_seq"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setPhoto(rs.getString("photo"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
		
	}
	
	public int getMaxCom_seq() {
		
		int max=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select max(com_seq) max from GuestReview";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				max=rs.getInt("max");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return max;
		
	}

	public boolean getCheckPass(String com_seq, String pass)
{
		boolean check=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from GuestReview where com_seq=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, com_seq);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())	
			{
				if(rs.getInt(1)==1)  //��й�ȣ�� Ʋ�� ���� 0
					check=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return check;
		
}
	
	public void deleteGuestReview(String com_seq)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from GuestReview where com_seq=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, com_seq);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}

	public void updateGuestTourSpotReview(GuestReviewDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update GuestReview set title=?, content=?, photo=? where com_seq=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setString(3, dto.getContent());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public void updateLikes(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update GuestReview set likes=likes+1 where com_seq=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sql);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public GuestReviewDto getData(String num)
	{
		GuestReviewDto dto=new GuestReviewDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from GuestReview where com_seq=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setCom_seq(rs.getString("com_seq"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setPhoto(rs.getString("photo"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	
	}
	
}
