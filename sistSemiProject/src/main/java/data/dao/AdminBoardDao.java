package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.MemberDto;
import data.dto.AdminBoardDto;
import mysql.db.DBConnect;

public class AdminBoardDao {
		   
		   DBConnect db = new DBConnect();
		   
		   //list로 출력 , 조휘수 기준으로 내림차순.
		   public List<AdminBoardDto> getAllBoard() {
		      List<AdminBoardDto> list = new ArrayList<AdminBoardDto>();
		      
		      Connection conn=db.getConnection();
		      PreparedStatement pstmt =null;
		      ResultSet rs= null;
		      
		      String sql = "select * from adminboard order by num desc";
		      
		      try {
		         pstmt=conn.prepareStatement(sql);
		         rs=pstmt.executeQuery();
		         
		         while(rs.next()) {
		            
		            AdminBoardDto dto = new AdminBoardDto();
		            dto.setNum(rs.getString("num"));
		            dto.setId(rs.getString("id"));
		            dto.setSubject(rs.getString("subject"));
		            dto.setContent(rs.getString("content"));
		            dto.setReadcnt(rs.getInt("readcnt"));
		            dto.setWriteday(rs.getTimestamp("writeday"));
		            
		            list.add(dto);
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         db.dbClose(rs,pstmt,conn);
		      }
		      return list;
		   }
		   
		   
		   //insert
		   //id는 insert 안하는데 ? 표해야하나, null값 처리해야하나?
		   //작성자는 
		   public void insertBoard(AdminBoardDto dto) {
		      Connection conn = db.getConnection();
		      PreparedStatement pstmt =null;
		      
		      String sql = "insert into adminboard (id, subject, content, readcnt, writeday) values(?,?,?,0,now())";
		      
		      try {
		         pstmt=conn.prepareStatement(sql);
		         
		         pstmt.setString(1, dto.getId());
		         pstmt.setString(2, dto.getSubject());
		         pstmt.setString(3, dto.getContent());
		         pstmt.execute();
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         db.dbClose(pstmt, conn);
		      }
		   }
		   
		   //전체 데이터 개수
		      public int getTotalCount() {
		         int total = 0;
		         
		         Connection conn = db.getConnection();
		         PreparedStatement pstmt = null;
		         ResultSet rs = null;
		         
		         String sql = "select count(*) from adminboard";
		         
		         try {
		            pstmt = conn.prepareStatement(sql);
		            rs = pstmt.executeQuery();
		            
		            if(rs.next()) {
		               total = rs.getInt(1);
		            }
		         } catch (SQLException e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		         }finally {
		            db.dbClose(rs, pstmt, conn);
		         }
		         
		         return total;
		      }
		      
		      
		    //paging_List
		          public List<AdminBoardDto> getPagingList(int start, int perPage){
		             List<AdminBoardDto> list = new ArrayList<AdminBoardDto>();
		             
		             Connection conn = db.getConnection();
		             PreparedStatement pstmt = null;
		             ResultSet rs = null;
		             
		             String sql ="select * from adminboard limit ?,?";
		             
		             try {
		                pstmt = conn.prepareStatement(sql);
		                pstmt.setInt(1, start);
		                pstmt.setInt(2, perPage);
		                
		                rs = pstmt.executeQuery();
		                
		                while(rs.next()) {                
		                   AdminBoardDto dto = new AdminBoardDto();
		                   
		                      dto.setNum(rs.getString("num"));
		                      dto.setId(rs.getString("id"));
		                      dto.setSubject(rs.getString("subject"));
		                      dto.setContent(rs.getString("content"));
		                      dto.setReadcnt(rs.getInt("readcnt"));
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
		   
		   //delete
		   
		   
		   
		   //update
		   
		   
		   
		   //조회수 올리는 로직
		   
		          
		          
		          //id값 하나 가져오기 
		          //input type hidden 때문에 하는것.
		          public AdminBoardDto getData(String id) {
		             AdminBoardDto dto = new AdminBoardDto();
		             
		             Connection conn = db.getConnection();
		             PreparedStatement pstmt = null;
		             ResultSet rs= null;
		             
		             String sql = "select * from adminboard where id=?";
		             
		             try {
		                pstmt=conn.prepareStatement(sql);
		                pstmt.setString(1, id);
		                rs=pstmt.executeQuery();
		                
		                if(rs.next()) {
		                   dto.setId(rs.getString("id"));
		                   dto.setSubject(rs.getString("subject"));
		                   dto.setContent(rs.getString("content"));
		                   dto.setReadcnt(rs.getInt("readcnt"));
		                   dto.setWriteday(rs.getTimestamp("writeday"));
		                }
		             } catch (SQLException e) {
		                e.printStackTrace();
		             } finally {
		                db.dbClose(rs, pstmt,conn);
		             }
		             return dto;
		          }
		   
		          
		         //id값에 해당하는 dto반환 시키기
		       //문의사항 클릭시 값 불러오기 위한 Dao
		         public AdminBoardDto getDto(String num) {
		            AdminBoardDto dto = new AdminBoardDto();
		            
		            Connection conn = db.getConnection();
		            PreparedStatement pstmt =null;
		            ResultSet rs = null;
		            
		            String sql = "select * from adminboard where num=?";
		            
		            try {
		               pstmt=conn.prepareStatement(sql);
		               pstmt.setString(1, num);
		               rs=pstmt.executeQuery();
		               
		               if(rs.next()) {
		                  dto.setNum(rs.getString("num"));
		                   dto.setId(rs.getString("id"));
		                   dto.setSubject(rs.getString("subject"));
		                   dto.setContent(rs.getString("content"));
		                   dto.setReadcnt(rs.getInt("readcnt"));
		                   dto.setWriteday(rs.getTimestamp("writeday"));
		               }
		            } catch (SQLException e) {
		               e.printStackTrace();
		            } finally {
		               db.dbClose(rs,pstmt,conn);
		            }
		            
		            return dto;
		         }
	
}
