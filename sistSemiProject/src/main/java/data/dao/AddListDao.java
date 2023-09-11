package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.AddListDto;
import mysql.db.DBConnect;

public class AddListDao {
   
   DBConnect db = new DBConnect();
   
   //전체조회 리스트
   public List<AddListDto> getList() {
      List<AddListDto> list = new ArrayList<AddListDto>();
      
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "select * from addlist order by writeday desc";
      
      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            AddListDto dto =new AddListDto();
            
            dto.setId(rs.getString("id"));
            dto.setContent(rs.getString("content"));
            dto.setWriteday(rs.getTimestamp("writeyday"));
            
            list.add(dto);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         db.dbClose(rs, pstmt,conn);
      }
      return list;
   }
   
   
   //DB에 insert하기.
   public void insertlist(AddListDto dto) {
      
      Connection conn = db.getConnection();
      PreparedStatement pstmt =null;
      
      String sql = "insert into addlist values(?,?,now())";
      
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
   
   //id값을 받아와서 그 아이디값에 맞는 사람만 리스트를 수정 삭제 할수있게 만들어는 로직 찾기.
   public AddListDto getData(String id) {
      AddListDto dto = new AddListDto();
      
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs= null;
      
      String sql = "select * from addlist where id=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            dto.setId(rs.getString("id"));
            dto.setContent(rs.getString("content"));
            dto.setWriteday(rs.getTimestamp("writeday"));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         db.dbClose(rs, pstmt,conn);
      }
      return dto;
   }
   
   //id에따른 list 삭제 로직
   public void deletelist(String id) {
      Connection conn=db.getConnection();
      PreparedStatement pstmt =null;
      
      String sql="delete from addlist where id=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1,id);
         pstmt.execute();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   // id값에 따른 내용 수정 로직
   public void updatelist(AddListDto dto) {
      Connection conn =db.getConnection();
      PreparedStatement pstmt =null;
      
      String sql = "update addlist set content=? where id=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, dto.getContent());
         pstmt.setString(2, dto.getId());
         
         pstmt.execute();
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         db.dbClose(pstmt, conn);
      }
   }   
}

   