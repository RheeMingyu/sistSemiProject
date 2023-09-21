package data.dao;

import java.sql.Connection;

import data.dto.TourReviewDto;
import data.dto.TourSpotDto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import mysql.db.DBConnect;

public class TourSpotDao {
	DBConnect db = new DBConnect();
	
	
	
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
	
	public int getTotalCount() {
		int total = 0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from TourSpot";
		
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
		public List<TourSpotDto> getPagingList(int start, int perPage){
			List<TourSpotDto> list = new ArrayList<TourSpotDto>();
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql ="select * from TourSpot limit ?,?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, perPage);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					TourSpotDto dto = new TourSpotDto();
					
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
		
		public TourSpotDto getdata(String seq) {
			TourSpotDto tdto=new TourSpotDto();
			
				
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from TourSpot where seq=?";
			
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
		
		public List<String> getSpotFromTheme(String main_cat){
            
            List<String> list=new ArrayList<String>();
            
            Connection conn=db.getConnection();
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            
            String sql="select name from TourSpot where main_cat=?";
            
            try {
               pstmt=conn.prepareStatement(sql);
               
               pstmt.setString(1, main_cat);
               rs=pstmt.executeQuery();
               
               while(rs.next())
               {
                  list.add(rs.getString(1));
               }
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
            return list;
         }
		
		
		// 2023.09.15 추가분 

		// 받아온 name값을 가지고 seq로 반환하기
		public String modifySeq(String op_val) {
			String seq = "";

			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select seq from TourSpot where name=?";

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, op_val);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					seq = rs.getString("seq");
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			return seq;
		}
	
		 public String getSeq(String name)
         {
            String seq="";
            
            Connection conn=db.getConnection();
            PreparedStatement pstmt=null;
            ResultSet rs = null;
            
            String sql = "select * from TourSpot where name=?";
            
            try {
               pstmt=conn.prepareStatement(sql);
               pstmt.setString(1, name);
               rs=pstmt.executeQuery();
               
               if(rs.next())
               {
                  seq=rs.getString("seq");
               }
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }finally {
               db.dbClose(rs, pstmt, conn);
            }
            return seq;
            
         }
		 
		 public String getPhoto(String name) {
			   
			   String photo="";
			   
			   Connection conn=db.getConnection();
			   PreparedStatement pstmt=null;
			   ResultSet rs=null;
			   
			   String sql="select * from TourSpot where name=?";
			   
			   try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, name);
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					photo=rs.getString("photo");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			   
			   return photo;
		   }
		 
		 public double getAverageStars(String name,String sort) {
			 
			 double avg=0;
			 int cnt=0;
			 
			 Connection conn=db.getConnection();
			 Statement stmt=null;
			 ResultSet rs=null;
			 
			 String table_sort=(sort.equals("1")?"TourReview":"GuestReview");
			 String seq=getSeq(name);
			 
			 String sql="select * from "+table_sort+" where tour_seq="+seq;
			 
			 try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				
				while(rs.next())
				{
					avg+=Double.parseDouble(rs.getString("stars")==null?"0":rs.getString("stars"));
					cnt++;
					System.out.println("짝:"+avg);
				}
				avg=(cnt==0?0:avg/cnt);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, stmt, conn);
			}
			return avg;
		 }

}
