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

public class SearchDao_v2_new {

	DBConnect db=new DBConnect();
	
	public List<SearchResult> searchAllTablesColumns(String inputWords) { //주요 키워드 앞에는 '>'를 표기하라는 주의사항 필서
		
		List<SearchResult> results=new ArrayList<SearchResult>();
		
		String [] keyWordsDivided=inputWords.split(" ");
		
		StringJoiner sj=new StringJoiner("* "); //각 단어 중 하나라도 들어있으면 검색되게,와일드카드 조건

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
			
			String [] columnsArr=columns.split(",");
			
			while(rs.next())
			{
				for(String column:columnsArr)
				{
					String value=rs.getString(column);
						
					SearchResult sr=new SearchResult();
					sr.setTable(table);
					sr.setColumn(column);
					sr.setValue(value);
					
					results.add(sr);
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
	
	//디폴트가 관련도순, 통계테이블과 조인해서 등록일별로 최신순,선택횟수별로 인기순, 선택일자로 어제의인기검색어
	//테이블 정보로 카테고리로 출력값 구분가능
}
