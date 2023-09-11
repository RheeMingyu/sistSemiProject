package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.CourseDto;
import data.dto.TourSpotDto;
import mysql.db.DBConnect;

public class RecomCourseDao {


	DBConnect db=new DBConnect();
	
	
	// 페이징을 위한 전체 개수 반환
	public int getTotalCount() {
		
		int total=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(DISTINCT name) from RecomCourse";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				total=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;
	}
	
	
	// 페이징을 위해 페지이제 보여질 글만 얻어오기
	public List<CourseDto> getPagingList(int startNum,int perPage){
		
		List<CourseDto> pagingList=new ArrayList<CourseDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from recomcourse order by seq desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, perPage);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CourseDto dto=new CourseDto();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTour_seq(rs.getString("tour_seq"));
				dto.setName(rs.getString("name"));
				dto.setDay(rs.getString("day"));
				dto.setTrun(rs.getString("turn"));
				dto.setIntro(rs.getString("intro"));
				
				pagingList.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return pagingList;
	}
	
	// 코스명,대표설명 불러오기 (중복제거)
	public List<CourseDto> getCourseName(){
		List<CourseDto> distinctlist=new ArrayList<CourseDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select DISTINCT name,intro from recomcourse";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CourseDto dto=new CourseDto();
				
				dto.setName(rs.getString("name"));
				dto.setIntro(rs.getString("intro"));
				
				distinctlist.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return distinctlist;
	}
	
	// 추천코스 name으로 분류하여 뽑아오기
	public List<CourseDto> getRecomCourseName(String name) {
		
		List<CourseDto> courseName=new ArrayList<CourseDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from recomcourse where name=? order by day,turn";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CourseDto dto=new CourseDto();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTour_seq(rs.getString("tour_seq"));
				dto.setName(rs.getString("name"));
				dto.setDay(rs.getString("day"));
				dto.setTrun(rs.getString("turn"));
				dto.setIntro(rs.getString("intro"));
				dto.setMainphoto(rs.getString("mainphoto"));
				
				courseName.add(dto);
			}
			
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} db.dbClose(rs, pstmt, conn);

		return courseName;
	}
	
	
	// 추천코스 전체 출력
		public List<CourseDto> getRecomCourse() {
			
			List<CourseDto> recomCourse=new ArrayList<CourseDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from recomcourse order by day,turn";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					CourseDto dto=new CourseDto();
					
					dto.setSeq(rs.getString("seq"));
					dto.setTour_seq(rs.getString("tour_seq"));
					dto.setName(rs.getString("name"));
					dto.setDay(rs.getString("day"));
					dto.setTrun(rs.getString("turn"));
					dto.setIntro(rs.getString("intro"));
					dto.setMainphoto(rs.getString("mainphoto"));
					
					recomCourse.add(dto);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} db.dbClose(rs, pstmt, conn);

			return recomCourse;
		}
		
	
	// RecomCourse의 name을 이용하여 seq값 반환하기
	public String getName(String name) {
		String seq="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select seq from recomcourse where name=? limit 1";
		
		try {
			pstmt=conn.prepareStatement(seq);
			
			pstmt.setString(1, name);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				seq=rs.getString("seq");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} db.dbClose(rs, pstmt, conn);
		return seq;
	}
	
	// RecomCourse의 seq값을 이용하여 name값 반환하기 
	public String getSeq(String seq) {
		String name="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select name from recomcourse where seq=?";
		
		try {
			pstmt=conn.prepareStatement(seq);
			
			pstmt.setString(1, seq);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				name=rs.getString("name");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} db.dbClose(rs, pstmt, conn);
		return name;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 코스명에 따른 관광지 불러오기 (join).. 전체출력
	
		// 메모
		// 여러개의 Dto를 불러와서 사용할때 (sql 쿼리문 예시로 join의 경우) List,ArrayList,Vector 가 아닌 HashMap을 이용한다고 생각하자. 
		// HashMap 에서 map.put() 에서 각 table의 컬럼 글씨가 같으면 모두 씹히고 가장 마지막것만 인식한다. 즉, join을 할 때에는 column 값이 겹치지 않게 하자.
//		public List<HashMap<String, String>> getCourseList(String name){
//			List<HashMap<String, String>> list=new ArrayList<HashMap<String,String>>();				
//			
//			Connection conn=db.getConnection();
//			PreparedStatement pstmt=null;
//			ResultSet rs=null;
//			
//			String sql="select t.name,t.hp,t.addr,t.photo,t.intro,t.area,t.theme,t.main_cat,t.sub_cat,t.note,t.price,t.writeday,\n"
//					+ "r.name 'recom_name',r.day,r.order,r.intro 'recom_intro' \n"
//					+ "from tourspot t,RecomCourse r \n"
//					+ "where t.seq=r.tour_seq and r.name=? order by r.day,r.order";
//			
//			try {
//				pstmt=conn.prepareStatement(sql);
//				
//				pstmt.setString(1, name);
//				
//				rs=pstmt.executeQuery();
//				
//				while(rs.next()) {
//					
//					HashMap<String, String> map=new HashMap<String, String>();
//					
//					map.put("name", rs.getString("name"));
//					map.put("hp", rs.getString("hp"));
//					map.put("addr", rs.getString("addr"));
//					map.put("photo", rs.getString("photo"));
//					map.put("intro", rs.getString("intro"));
//					map.put("area", rs.getString("area"));
//					map.put("theme", rs.getString("theme"));
//					map.put("main_cat", rs.getString("main_cat"));
//					map.put("sub_cat", rs.getString("sub_cat"));
//					map.put("note", rs.getString("note"));
//					map.put("price", rs.getString("price"));
//					map.put("writeday", rs.getString("writeday"));
//					map.put("recom_name", rs.getString("recom_name"));
//					map.put("order", rs.getString("order"));
//					map.put("recom_intro", rs.getString("recom_intro"));
//					
//					list.add(map);
//
//				}
//				
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} finally {
//				db.dbClose(rs, pstmt, conn);
//			}
//			return list;
//		}
	
}
