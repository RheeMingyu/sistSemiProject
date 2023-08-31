package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

import data.dto.SearchResult;
import mysql.db.DBConnect;

public class SearchDao_v2 {

	DBConnect db=new DBConnect();
	
	public List<SearchResult> searchAllTablesColumns(String inputWords) {
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		String [] keyWordsDivided=inputWords.split(" ");
		
		StringJoiner sj=new StringJoiner("+");

		for(String keyWord:keyWordsDivided)
		{
			sj.add(keyWord);
		}
		
		List<String> tables=new ArrayList<String>();
		tables.add("TourReview");
		tables.add("TourSpot");
		tables.add("RecomCourse");
		tables.add("MyCourse");
		
		for(String table:tables)
		{
			String columns=searchColumnNamesInEachTables(table);
			results.addAll(searchTableColumn(table, columns, sj.toString()));
		}
			
		return results;
	}

	public String searchColumnNamesInEachTables(String table) {
		
		String columns="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select column_name from information_schema.columns "
					+"where table_schema='semipjt' and table_name=?";
			
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, table);
			rs=pstmt.executeQuery();
				
			while(rs.next())
			{
				String cn=rs.getString("column_name");
				if(!cn.equals("tour_seq")||!cn.equals("photo")||!cn.equals("viewcount")||!cn.equals("likes")||!cn.equals("seq"))
					columns+=cn+",";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		columns=columns.substring(0, columns.length()-1);
		
		return columns;
	}
	
	public List<SearchResult> searchTableColumn(String table,String columns,String keyWord) {
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from "+table+" where MATCH("+columns+") AGAINST(? IN BOOLEAN MODE)";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, keyWord);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				String value=rs.getString(columns);
					
				SearchResult sr=new SearchResult();
				sr.setTable(table);
				sr.setColumn(columns);
				sr.setValue(value);
				
				results.add(sr);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		
		return results;
	}
}
