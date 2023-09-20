package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.TourReviewDto;
import mysql.db.DBConnect;

public class TourSpotReviewDao {

   DBConnect db=new DBConnect();

   //insert (login)

   public void insertTourReview(TourReviewDto dto)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;

      String sql="insert into TourReview values(null,?,?,?,?,now(),?,NULL,?,?)";


      try {
         pstmt=conn.prepareStatement(sql);

         pstmt.setString(1, dto.getTour_seq());
         pstmt.setString(2, dto.getId());
         pstmt.setString(3, dto.getPhoto());
         pstmt.setString(4, dto.getTitle());
         pstmt.setString(5, dto.getViewcount());
         pstmt.setString(6, dto.getContent());
         pstmt.setString(7, dto.getStars());
         

         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }   

   }
   
/*   public void insertLogoutTourReview(TourReviewDto dto)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;

      String sql="insert into TourReview(id, photo, title, writeday, content) values(?,?,?,now(),?)";


      try {
         pstmt=conn.prepareStatement(sql);

         pstmt.setString(1, dto.getId());
         pstmt.setString(2, dto.getPhoto());
         pstmt.setString(3, dto.getTitle());
         pstmt.setString(4, dto.getContent());
      

         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }   

   } */

   public void updateViewCount(String num)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="update TourReview set viewcount=viewcount+1 where com_seq=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1,num);
         
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
      
   }
   
   public TourReviewDto getData(String num)
   {
      TourReviewDto dto=new TourReviewDto();

      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;

      String sql="select * from TourReview where com_seq=?";

      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, num);
         rs=pstmt.executeQuery();

         if(rs.next())
         {   
            dto.setCom_seq(rs.getString("com_seq"));
            dto.setTour_seq(rs.getString("tour_seq"));
            dto.setId(rs.getString("id"));
            dto.setPhoto(rs.getString("photo"));
            dto.setTitle(rs.getString("title"));
            dto.setViewcount(rs.getString("viewcount"));
            dto.setLikes(rs.getString("likes"));
            dto.setContent(rs.getString("content"));
            dto.setWriteday(rs.getTimestamp("writeday"));
            dto.setStars(rs.getString("stars"));
      
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      return dto;
      

   }

   public void updatelikes(String num)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;

      String sql="update TourReview set likes=likes+1 where com_seq=?";

      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, num);

         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   public List<TourReviewDto> getList(int start, int perpage)
   {
      List<TourReviewDto> list=new Vector<TourReviewDto>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from TourReview order by com_seq desc limit ?,?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setInt(1, start);
         pstmt.setInt(2, perpage);
         
         rs=pstmt.executeQuery();
         
         while(rs.next())
         {
            TourReviewDto dto=new TourReviewDto();
            
            dto.setCom_seq(rs.getString("com_seq"));
            dto.setTour_seq(rs.getString("tour_seq"));
            dto.setId(rs.getString("id"));
            dto.setPhoto(rs.getString("photo"));
            dto.setTitle(rs.getString("title"));
            dto.setViewcount(rs.getString("viewcount"));
            dto.setLikes(rs.getString("likes"));
            dto.setContent(rs.getString("content"));
            dto.setWriteday(rs.getTimestamp("writeday"));
            dto.setStars(rs.getString("stars"));
      
            
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
   
   public int getTotalCount() {
      
      int n=0;
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select count(*) from TourReview";
      
      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         if(rs.next())
         {
            n=rs.getInt(1);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return n;
      
   }
   
   public String getId(String com_seq)
   {
      String id="";
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from TourReview where com_seq=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1,com_seq);
         rs=pstmt.executeQuery();
         
         if(rs.next())
         {
            id=rs.getString("id");
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      return id;
   }
   
   public ArrayList<TourReviewDto> getAllTourReviews()
   {
      ArrayList<TourReviewDto> list = new ArrayList<TourReviewDto>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from TourReview order by com_seq desc";
      
      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         while(rs.next()) 
         {
            TourReviewDto dto=new TourReviewDto();
            
            dto.setCom_seq(rs.getString("com_seq"));
            dto.setTour_seq(rs.getString("tour_seq"));
            dto.setId(rs.getString("id"));
            dto.setPhoto(rs.getString("photo"));
            dto.setTitle(rs.getString("title"));
            dto.setViewcount(rs.getString("viewcount"));
            dto.setLikes(rs.getString("likes"));
            dto.setContent(rs.getString("content"));
            dto.setWriteday(rs.getTimestamp("writeday"));
            dto.setStars(rs.getString("stars"));
            
            list.add(dto);
         }
         pstmt.execute();
      
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      return list;
   
   }
   
   
   public void deleteTourReview(String com_seq)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="delete from TourReview where com_seq=?";
      
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
   
   public void updateTourReview(TourReviewDto dto)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;

      String sql="update TourReview set title=?, content=?, stars=? where com_seq=?";


      try {
         pstmt=conn.prepareStatement(sql);

         pstmt.setString(1, dto.getTitle());
         pstmt.setString(2, dto.getContent());
         pstmt.setString(3, dto.getStars());
         pstmt.setString(4, dto.getCom_seq());
         
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }   

   }
}