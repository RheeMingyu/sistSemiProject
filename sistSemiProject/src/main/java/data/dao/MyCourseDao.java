package data.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.MyCourseDto;
import data.dto.TempSaveDto;
import mysql.db.DBConnect;

public class MyCourseDao {
	DBConnect db = new DBConnect();

	// 나만의 코스에 추가한 관광지들을 나만의 코스 테이블에 insert하는 메소드
	public void insertMyCourse(MyCourseDto myCourseDto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO MyCourse (id, tour_seq, name, day, turn, intro, mainphoto) VALUES (?,?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myCourseDto.getId());
			pstmt.setString(2, myCourseDto.getTour_seq());
			pstmt.setString(3, myCourseDto.getName());
			pstmt.setString(4, myCourseDto.getDay());
			pstmt.setString(5, myCourseDto.getTurn());
			pstmt.setString(6, myCourseDto.getIntro());
			pstmt.setString(7, myCourseDto.getMainPhoto());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
	
		

	// 코스이름 유무 체크
	public int isNameCheck(String cname) {
		int isName = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from MyCourse where name=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cname);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				/*
				 * if(rs.getInt(1)==1) isid=1;
				 */
				isName = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return isName;
	}
}
