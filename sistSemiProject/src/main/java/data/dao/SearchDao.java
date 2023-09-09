package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.SearchResult;
import mysql.db.DBConnect;

public class SearchDao {

	DBConnect db=new DBConnect();
	
	public List<SearchResult> searchAllTablesColumns(String inputWords) {
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		String [] keyWords=inputWords.split(" ");
		
		List<String> tables=new ArrayList<String>();
		tables.add("TourReview");
		tables.add("TourSpot");
		tables.add("RecomCourse");
		tables.add("MyCourse");
		
		List<String> columns=searchAllColumnNames(tables);
		
		for(String table:tables)
		{
			for(String column:columns)
			{
				results.addAll(searchTableColumn(table, column, keyWords));
			}
		}
			
		return results;
	}

	public List<String> searchAllColumnNames(List<String> tables) {
		
		List<String> list=new ArrayList<String>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		for(String table:tables)
		{
			String sql="select column_name from information_schema.columns "
						+"where table_schema='semi' and table_name=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, table);
				rs=pstmt.executeQuery();
				
				while(rs.next())
					list.add(rs.getString("column_name"));
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public List<SearchResult> searchTableColumn(String table,String column,String [] keyWords) {
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		for(String keyWord:keyWords)
		{
			String sql="select * from "+table+" where "+column+" like ?";
			
			try {
				pstmt=conn.prepareStatement(sql);

				pstmt.setString(1, "%"+keyWord+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next())
				{
					String value=rs.getString(column);
					
					SearchResult sr=new SearchResult();
					sr.setTable(table);
					sr.setColumn(column);
					sr.setValue(value);
					
					results.add(sr);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
		}
		
		return results;
	}
}
