package data.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.MyCourseDto;
import data.dto.TourSpotDto;
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
   public int isNameCheck(String cname, String id) {
      int isName = 0;

      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      String sql = "select count(*) from MyCourse where name=?, id=?";

      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, cname);
         pstmt.setString(2, id);
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
   
   //myPage에 나만의 코스 출력
   public List<MyCourseDto> myCourseList(String id, String name) {
      List<MyCourseDto> list = new ArrayList<MyCourseDto>();
      
      
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql ="select * from MyCourse where id=? and name=? order by turn";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         pstmt.setString(2, name);
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            MyCourseDto myCourseDto = new MyCourseDto();
            myCourseDto.setSeq(rs.getString("seq"));
            myCourseDto.setId(rs.getString("id"));
            myCourseDto.setTour_seq(rs.getString("tour_seq"));
            myCourseDto.setName(rs.getString("name"));
            myCourseDto.setDay(rs.getString("day"));
            myCourseDto.setTurn(rs.getString("turn"));
            myCourseDto.setIntro(rs.getString("intro"));
            myCourseDto.setMainPhoto(rs.getString("mainPhoto"));
            
            list.add(myCourseDto);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      
      return list;
   }
   
   //나만의 코스 이름 중복제거해서 가져오기
   public List<String> selectName(String id) {
      List<String> list = new ArrayList<String>();
      
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "select DISTINCT name from MyCourse where id=? order by turn";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            String name = rs.getString(1);
            
            list.add(name);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      return list;
      
   }
   
   //마이페이지 나만의코스 눌렀을때 선택한 관광지 출력하는 메소드
   public List<HashMap<String, String>> selectMyTourSpot(String id, String name){
      List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
      
      Connection conn =db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql ="select m.day, t.name, t.addr, t.photo from MyCourse m, TourSpot t where m.tour_seq=t.seq and m.id=? and m.name=? order by m.turn";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         pstmt.setString(2, name);
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            HashMap<String, String> map = new HashMap<String, String>();
            
            map.put("day", rs.getString("day"));
            map.put("name", rs.getString("name"));
            map.put("addr", rs.getString("addr"));
            map.put("photo", rs.getString("photo"));
            
            list.add(map);
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