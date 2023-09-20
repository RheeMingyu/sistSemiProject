package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.TempSaveDto;
import mysql.db.DBConnect;

public class TempSaveDao {
	
	DBConnect db = new DBConnect();
	
	//사용자가 나만의 코스에 추가한 관광지를 보여주기 위한 select 메소드
			public List<TempSaveDto> selectTemp() {
				List<TempSaveDto> list = new ArrayList<TempSaveDto>();
				
				Connection conn = db.getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from Temp";
				
				try {
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						TempSaveDto tempSaveDto = new TempSaveDto();
						tempSaveDto.setSeq(rs.getString("seq"));
						tempSaveDto.setTour_seq(rs.getString("tour_seq"));
						tempSaveDto.setName(rs.getString("name"));
						tempSaveDto.setIntro(rs.getString("intro"));
						tempSaveDto.setPhoto(rs.getString("photo"));
						
						list.add(tempSaveDto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbClose(rs, pstmt, conn);
				}
				
				return list;
			} 
			
			//사용자가 나만의 코스에 추가한 관광지 이름을 임시로 저장하기 위한 insert 메소드 
			public void insertTemp(TempSaveDto tempSaveDto) {
				Connection conn = db.getConnection();
				PreparedStatement pstmt = null;
				
				String sql = "INSERT INTO Temp (tour_seq, name, intro, photo) VALUES (?,?,?,?)";
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, tempSaveDto.getTour_seq());
					pstmt.setString(2, tempSaveDto.getName());
					pstmt.setString(3, tempSaveDto.getIntro());
					pstmt.setString(4, tempSaveDto.getPhoto());
					pstmt.execute();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbClose(pstmt, conn);
				}
			}
			
			//임시로 저장한 관광지 정보를 delete하는 메소드 
			public void deleteTemp() {
				Connection conn = db.getConnection();
				PreparedStatement pstmt = null;
				
				String sql = "delete from Temp";
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.execute();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbClose(pstmt, conn);
				}
			}
}
