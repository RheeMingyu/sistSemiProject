package data.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DBConnect;

public class PopularSearchesDao {

	DBConnect db=new DBConnect();
	
	public List<String> popularAmongAge(String ageRange) {
		
		List<String> results=new ArrayList<String>();
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		int ageInt=Integer.parseInt(ageRange);
		String range_code=(ageInt==60?">=60":" between "+ageInt+" and "+(ageInt+9));
		
		//String sql="select t.name from TourSpot t,Statistics s,Member m"
		//			+" where t.seq=s.tour_seq and s.id=m.id and m.age"+range_code
		//			+" order by s.selected_cnt desc limit 0,9";
		String sql="select t.name from TourSpot t, JOIN Statistics s ON t.seq=s.tour_seq JOIN Member m ON s.id=m.id"
					+" where m.age"+range_code+" order by s.selected_cnt desc limit 0,9";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				results.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return results;
	}
	
	public List<String> popularAmongMbti(String mbti) {
		
		List<String> results=new ArrayList<String>();
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		//String sql="select t.name from TourSpot t,Statistics s,Member m"
		//			+" where t.seq=s.tour_seq and m.id=s.id and m.mbti="+mbti
		//			+" order by s.selected_cnt desc limit 0,9";
		String sql="select t.name from TourSpot t JOIN Statistics s ON t.seq=s.tour_seq JOIN Member m ON m.id=s.id"
					+" where m.mbti="+mbti+" order by s.selected_cnt desc limit 0,9";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				results.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return results;
	}
	
	public List<String> popularAmongGender(String gender) {
		
		List<String> results=new ArrayList<String>();
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		//String sql="select t.name from TourSpot t,Statistics s,Member m"
		//			+" where t.seq=s.tour_seq and s.id=m.id and m.gender="+gender
		//			+" order by s.selected_cnt desc limit 0,9";
		String sql="select t.name from TourSpot t JOIN Statistics s ON t.seq=s.tour_seq JOIN Member m ON m.id=s.id"
					+" where m.gender="+gender+" order by s.selected_cnt desc limit 0,9";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				results.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return results;
	}
	
	public List<String> popularAmongArea(String area) {
		
		List<String> results=new ArrayList<String>();
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		//String sql="select t.name from TourSpot t,Statistics s,Member m"
		//			+" where t.seq=s.tour_seq and s.id=m.id and m.area="+area
		//			+" order by s.selected_cnt desc limit 0,9";
		String sql="select t.name from TourSpot t JOIN Statistics s ON t.seq=s.tour_seq JOIN Member m ON m.id=s.id"
					+" where m.area="+area+" order by s.selected_cnt desc limit 0,9";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				results.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return results;
	}
}
