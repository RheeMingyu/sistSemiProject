package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.LikesDto;
import mysql.db.DBConnect;

public class LikesDao {
   DBConnect db = new DBConnect();
   
   public void insertLike(LikesDto LikesDto) {
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      
      String sql = "insert into Likes (id, seq) values (?,?)";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, LikesDto.getId());
         pstmt.setInt(2, LikesDto.getSeq());
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   // 醫뗭븘 슂  쑀臾  泥댄겕
      public int isLikeCheck(String id, int seq) {
         int isLike = 0;

         Connection conn = db.getConnection();
         PreparedStatement pstmt = null;
         ResultSet rs = null;

         String sql = "select count(*) from Likes where id=? and seq=?";

         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setInt(2, seq);
            rs = pstmt.executeQuery();

            if (rs.next()) {
               /*
                * if(rs.getInt(1)==1) isid=1;
                */
               isLike = rs.getInt(1);
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } finally {
            db.dbClose(rs, pstmt, conn);
         }
         return isLike;
      }
      
      public void deleteLike(String id, int seq) {
         Connection conn = db.getConnection();
         PreparedStatement pstmt = null;
         
         String sql ="delete from Likes where id=? and seq=?";
         
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setInt(2, seq);
            pstmt.execute();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            db.dbClose(pstmt, conn);
         }
      }
}