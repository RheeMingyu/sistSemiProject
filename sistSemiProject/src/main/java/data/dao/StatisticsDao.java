package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.StatisticsDto;
import mysql.db.DBConnect;

public class StatisticsDao {
	DBConnect db = new DBConnect();
	
	public void insertStatistics(StatisticsDto statisticsdto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into Statistics (tour_seq, id, selected_cnt, selected_date) values(?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, statisticsdto.getTour_seq());
			pstmt.setString(2, statisticsdto.getId());
			pstmt.setInt(3, 1);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void updateStatistics(String tour_seq, String id) {
		StatisticsDto statisticsDto = new StatisticsDto();
		
		Connection conn= db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql ="update Statistics set selected_cnt=?, selected_date=now() where tour_seq=? and id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, statisticsDto.getSelected_cnt());
			pstmt.setString(2, tour_seq);
			pstmt.setString(3, id);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	

	// 사용자id와 관광지이름 중복 유무 체크
	public int isDataCheck(String tour_seq, String id) {
		int isData = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from MyCourse where tour_seq=? and id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tour_seq);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				/*
				 * if(rs.getInt(1)==1) isid=1;
				 */
				isData = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return isData;
	}
}
