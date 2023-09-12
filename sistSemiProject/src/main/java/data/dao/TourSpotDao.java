package data.dao;

import java.sql.Connection;


import data.dto.TourSpotDto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mysql.db.DBConnect;

public class TourSpotDao {
   DBConnect db = new DBConnect();
 	
 	// seq를 받아서 이에 해당하는 관광지 정보 dto에 넣기
 			public TourSpotDto getdata(String seq) {
 				TourSpotDto tdto=new TourSpotDto();
 				
 					
 				Connection conn=db.getConnection();
 				PreparedStatement pstmt=null;
 				ResultSet rs=null;
 				
 				String sql="select * from tourspot where seq=?";
 				
 				try {
 					pstmt=conn.prepareStatement(sql);
 					pstmt.setString(1, seq);

 					rs=pstmt.executeQuery();
 					
 					if(rs.next()) {
 						
 						tdto.setSeq(rs.getString("seq"));
 						tdto.setName(rs.getString("name"));
 						tdto.setHp(rs.getString("hp"));
 						tdto.setAddr(rs.getString("addr"));
 						tdto.setPhoto(rs.getString("photo"));
 						tdto.setIntro(rs.getString("intro"));
 						tdto.setArea(rs.getString("area"));
 						tdto.setTheme(rs.getString("theme"));
 						tdto.setMain_cat(rs.getString("main_cat"));
 						tdto.setSub_cat(rs.getString("sub_cat"));
 						tdto.setNote(rs.getString("note"));
 						tdto.setPrice(rs.getInt("price"));
 						tdto.setWriteday(rs.getTimestamp("writeday"));
 						
 					}
 					
 				} catch (SQLException e) {
 					// TODO Auto-generated catch block
 					e.printStackTrace();
 				} db.dbClose(rs, pstmt, conn);

 				return tdto;
 			}
 			
 			
 			// seq를 받아서 이에 해당하는 관광지 정보 출력 (List)
 			public List<TourSpotDto> getAllData(String seq){
 				List<TourSpotDto> tlist=new ArrayList<TourSpotDto>();

 				Connection conn=db.getConnection();
 				PreparedStatement pstmt=null;
 				ResultSet rs=null;
 				
 				String sql="select * from TourSpot where seq=?";
 				
 				try {
 					pstmt=conn.prepareStatement(sql);
 					pstmt.setString(1, seq);
 					
 					rs=pstmt.executeQuery();
 					
 					while(rs.next()) {
 						TourSpotDto tdto=new TourSpotDto();
 						
 						tdto.setSeq(rs.getString("seq"));
 						tdto.setName(rs.getString("name"));
 						tdto.setHp(rs.getString("hp"));
 						tdto.setAddr(rs.getString("addr"));
 						tdto.setPhoto(rs.getString("photo"));
 						tdto.setIntro(rs.getString("intro"));
 						tdto.setArea(rs.getString("area"));
 						tdto.setTheme(rs.getString("theme"));
 						tdto.setMain_cat(rs.getString("main_cat"));
 						tdto.setSub_cat(rs.getString("sub_cat"));
 						tdto.setNote(rs.getString("note"));
 						tdto.setPrice(rs.getInt("price"));
 						tdto.setWriteday(rs.getTimestamp("writeday"));
 						
 						tlist.add(tdto);
 					}
 					
 					
 				} catch (SQLException e) {
 					// TODO Auto-generated catch block
 					e.printStackTrace();
 				} db.dbClose(rs, pstmt, conn);
 				
 				return tlist;
 			}

   
   //관광지 테이블에 있는 데이터를 select하는 메소드
   public List<TourSpotDto> selectTourSpot() {
      List<TourSpotDto> list = new ArrayList<TourSpotDto>();
      
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "select * from TourSpot";
      
      try {
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            TourSpotDto tourSpotDto = new TourSpotDto();
            tourSpotDto.setSeq(rs.getString("seq"));
            tourSpotDto.setName(rs.getString("name"));
            tourSpotDto.setHp(rs.getString("hp"));
            tourSpotDto.setAddr(rs.getString("addr"));
            tourSpotDto.setPhoto(rs.getString("photo"));
            tourSpotDto.setIntro(rs.getString("intro"));
            tourSpotDto.setArea(rs.getString("area"));
            tourSpotDto.setTheme(rs.getString("theme"));
            tourSpotDto.setMain_cat(rs.getString("main_cat"));
            tourSpotDto.setSub_cat(rs.getString("sub_cat"));
            tourSpotDto.setNote(rs.getString("note"));
            tourSpotDto.setPrice(rs.getInt("price"));
            tourSpotDto.setWriteday(rs.getTimestamp("writeday"));
            list.add(tourSpotDto);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      
      return list;
   }

}