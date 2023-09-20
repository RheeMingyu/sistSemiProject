package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

import data.dto.SearchResult;
import mysql.db.DBConnect;

public class SearchDao_v2 {

	DBConnect db=new DBConnect();
	
	public List<SearchResult> searchAllTablesColumns(String inputWords,int startNum,int perPage) {
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		String [] keyWordsDivided=inputWords.split(" ");
		
		//StringJoiner sj=new StringJoiner(" +"); //각 단어 모두가 들어있어야 검색되게
		StringJoiner sj=new StringJoiner("* ");

		for(String keyWord:keyWordsDivided)
		{
			sj.add(keyWord);
		}
		
		List<String> tables=new ArrayList<String>();
		tables.add("TourSpot");
		tables.add("RecomCourse");
		tables.add("MyCourse");
		tables.add("TourReview");
		
		for(String table:tables)
		{
			String columns=searchColumnNamesInEachTables(table);
			results.addAll(searchTableColumn(table, columns, sj.toString(), startNum, perPage));
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
				if(!cn.equals("tour_seq")||!cn.equals("photo")||!cn.equals("writeday")||!cn.equals("stars")||!cn.equals("viewcount")||
					!cn.equals("price")||!cn.equals("day")||!cn.equals("order")||!cn.equals("likes")||!cn.equals("seq"))
					{columns+=cn+",";}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		columns=(columns.length()<=0?"":columns.substring(0, columns.length()-1));
		
		return columns;
	}
	
	public List<SearchResult> searchTableColumn(String table,String columns,String keyWord,int startNum,int perPage) {
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select "+columns+" from "+table+" where MATCH("+columns+") AGAINST(? IN BOOLEAN MODE) limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, keyWord);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			
			String [] columnsArr=columns.split(",");
			
			while(rs.next())
			{
				for(String column:columnsArr)
				{
					String value=rs.getString(column);
					
					if(value!=null&&value.toLowerCase().contains(keyWord.toLowerCase()))
					{
						SearchResult sr=new SearchResult();
						sr.setTable(table);
						sr.setColumn(column);
						sr.setValue(value);
						
						results.add(sr);
					}
				}
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
	
	public List<SearchResult> searchAllTablesColumnsOrderByLatest(String inputWords,int startNum,int perPage) {
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		String [] keyWordsDivided=inputWords.split(" ");
		
		//StringJoiner sj=new StringJoiner(" +"); //각 단어 모두가 들어있어야 검색되게
		StringJoiner sj=new StringJoiner("* ");

		for(String keyWord:keyWordsDivided)
		{
			sj.add(keyWord);
		}
		
		List<String> tables=new ArrayList<String>();
		tables.add("TourSpot");
		tables.add("RecomCourse");
		tables.add("MyCourse");
		tables.add("TourReview");
		
		for(String table:tables)
		{
			String columns=searchColumnNamesInEachTables(table);
			results.addAll(searchTableColumnOrderByLatest(table, columns, sj.toString(), startNum, perPage));
		}
			
		return results;
	}
	
	public List<SearchResult> searchTableColumnOrderByLatest(String table,String columns,String keyWord,int startNum,int perPage) {
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select "+columns+" from "+table+"AS t JOIN statistics AS s"+
				(table.equals("tourspot")?"ON t.seq=s.tour_seq":"ON t.tour_seq=s.tour.seq")+
				" where MATCH("+columns+") AGAINST(? IN BOOLEAN MODE)"+
				" order by s.selected_date limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, keyWord);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			
			String [] columnsArr=columns.split(",");
			
			while(rs.next())
			{
				for(String column:columnsArr)
				{
					String value=rs.getString(column);
					
					if(value!=null&&value.toLowerCase().contains(keyWord.toLowerCase()))
					{
						SearchResult sr=new SearchResult();
						sr.setTable(table);
						sr.setColumn(column);
						sr.setValue(value);
						
						results.add(sr);
					}
				}
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
	
	public List<SearchResult> searchAllTablesColumnsOrderByPopularity(String inputWords,int startNum,int perPage) {
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		String [] keyWordsDivided=inputWords.split(" ");
		
		//StringJoiner sj=new StringJoiner(" +"); //각 단어 모두가 들어있어야 검색되게
		StringJoiner sj=new StringJoiner("* ");

		for(String keyWord:keyWordsDivided)
		{
			sj.add(keyWord);
		}
		
		List<String> tables=new ArrayList<String>();
		tables.add("TourSpot");
		tables.add("RecomCourse");
		tables.add("MyCourse");
		tables.add("TourReview");
		
		for(String table:tables)
		{
			String columns=searchColumnNamesInEachTables(table);
			results.addAll(searchTableColumnOrderByLatest(table, columns, sj.toString(), startNum, perPage));
		}
			
		return results;
	}
	
	public List<SearchResult> searchTableColumnOrderByPopularity(String table,String columns,String keyWord,int startNum,int perPage) {
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select "+columns+" from "+table+"AS t JOIN statistics AS s"+
				(table.equals("tourspot")?"ON t.seq=s.tour_seq":"ON t.tour_seq=s.tour.seq")+
				" where MATCH("+columns+") AGAINST(? IN BOOLEAN MODE)"+
				" order by s.selected_cnt limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, keyWord);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			
			String [] columnsArr=columns.split(",");
			
			while(rs.next())
			{
				for(String column:columnsArr)
				{
					String value=rs.getString(column);
					
					if(value!=null&&value.toLowerCase().contains(keyWord.toLowerCase()))
					{
						SearchResult sr=new SearchResult();
						sr.setTable(table);
						sr.setColumn(column);
						sr.setValue(value);
						
						results.add(sr);
					}
				}
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
	
	public int getTotalcount(String inputWords) {
		
		int total=0;
		
		String [] keyWordsDivided=inputWords.split(" ");

		StringJoiner sj=new StringJoiner("* ");

		for(String keyWord:keyWordsDivided)
		{
			sj.add(keyWord);
		}
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<String> tables=new ArrayList<String>();
		tables.add("TourSpot");
		tables.add("RecomCourse");
		tables.add("MyCourse");
		tables.add("TourReview");
		
		for(String table:tables)
		{
			String columns=searchColumnNamesInEachTables(table);
		
			String sql="select count(*) from "+table+" where MATCH("+columns+") AGAINST(? IN BOOLEAN MODE)";
	
			try {
				pstmt=conn.prepareStatement(sql);
	
				pstmt.setString(1, sj.toString());
				rs=pstmt.executeQuery();
				
				if(rs.next())
					total=Integer.parseInt(rs.getString(1));
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
		}
		return total;
	}
	
	//photo컬럼 있는 테이블에서 photo값 뽑기(searchboard 출력값에 사진 출력)
}
