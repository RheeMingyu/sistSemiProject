package data.dao;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.StringJoiner;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import data.dto.SearchResult;
import mysql.db.DBConnect;

public class SearchDao_v3 {

	DBConnect db=new DBConnect();
	
	String [] tables= {"tourspot","mycourse","recomcourse","tourreview","guest"};
	
	/*public List<HashMap<String, String>> searchInputWordsInWholeTables_GPT(String inputWords, int startNum, int perPage) {
	    List<HashMap<String, String>> resultsList = new ArrayList<HashMap<String, String>>();
	    
	    String[] keyWordsDivided = inputWords.split(" ");
	    StringJoiner sj = new StringJoiner("* ");
	    
	    for (String keyWord : keyWordsDivided) {
	        sj.add(keyWord);
	    }
	    
	    // Combine all the relevant tables using SQL JOIN
	    String sql = "SELECT t1.table_name, t2.* " +
	                 "FROM (SELECT 'tourspot' AS table_name UNION " +
	                 "      SELECT 'mycourse' AS table_name UNION " +
	                 "      SELECT 'recomcourse' AS table_name UNION " +
	                 "      SELECT 'tourreview' AS table_name) AS t1 " +
	                 "LEFT JOIN (SELECT *, 'tourspot' AS table_name FROM tourspot " +
	                 "           UNION ALL " +
	                 "           SELECT *, 'mycourse' AS table_name FROM mycourse " +
	                 "           UNION ALL " +
	                 "           SELECT *, 'recomcourse' AS table_name FROM recomcourse " +
	                 "           UNION ALL " +
	                 "           SELECT *, 'tourreview' AS table_name FROM tourreview) AS t2 " +
	                 "ON t1.table_name = t2.table_name " +
	                 "WHERE MATCH(t2.columns) AGAINST(? IN BOOLEAN MODE) " +
	                 "LIMIT ?, ?";
	    
	    try {
	        Connection conn = db.getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setString(1, sj.toString());
	        pstmt.setInt(2, startNum);
	        pstmt.setInt(3, perPage);
	        
	        ResultSet rs = pstmt.executeQuery();
	        
	        // Process the combined result set
	        while (rs.next()) {
	            String tableName = rs.getString("table_name");
	            HashMap<String, String> map = new HashMap<String, String>();
	            
	            // Populate map with column names and values
	            ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
	            int columnCount = rsmd.getColumnCount();
	            
	            for (int i = 1; i <= columnCount; i++) {
	                String columnName = rsmd.getColumnName(i);
	                String columnValue = rs.getString(columnName);
	                map.put(columnName, columnValue);
	            }
	            
	            // Add the map to the resultsList
	            resultsList.add(map);
	        }
	        
	        // Close resources
	        db.dbClose(rs, pstmt, conn);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return resultsList;
	}*/
	
	/*public List<HashMap<String, HashMap<String, String>>> searchInputWordsInWholeTables(String inputWords,int startNum,int perPage) {
		
		List<HashMap<String, HashMap<String, String>>> resultsList=new ArrayList<HashMap<String,HashMap<String,String>>>();
		
		String [] keyWordsDivided=inputWords.split(" ");

		StringJoiner sj=new StringJoiner("* ");

		for(String keyWord:keyWordsDivided)
		{
			sj.add(keyWord);
		}
		
		for(String table:tables)
		{
			HashMap<String, HashMap<String, String>> mmap=new HashMap<String, HashMap<String,String>>();
			
			String columns=searchColumnNamesInEachTables(table);
			List<HashMap<String, String>> mapList=searchColumnsValuesInTable(table, columns, sj.toString()+"*", startNum, perPage);
			
			for(HashMap<String, String> map:mapList)
			{				
				mmap.put(table, map);
				resultsList.add(mmap);
			}
		}
		
		return resultsList;
	}*/
	
	public List<HashMap<String, HashMap<String, String>>> searchInputWordsInWholeTablesWithStatistics(String inputWords,int startNum,int perPage,int sort) {
		
		List<HashMap<String, HashMap<String, String>>> resultsList=new ArrayList<HashMap<String,HashMap<String,String>>>();
		
		String [] keyWordsDivided=inputWords.split(" ");

		StringJoiner sj=new StringJoiner("* ");

		for(String keyWord:keyWordsDivided)
		{
			sj.add(keyWord);
		}
		
		for(String table:tables)
		{
			HashMap<String, HashMap<String, String>> mmap=new HashMap<String, HashMap<String,String>>();
			List<HashMap<String, String>> mapList=null;
			
			String columns=searchColumnNamesInEachTables(table);
			if(sort==1) {mapList=searchColumnsValuesInTable(table, columns, sj.toString()+"*", startNum, perPage);}
			else if(sort==2) {mapList=searchColumnsValuesInTableOrderByLatest(table, columns, sj.toString()+"*", startNum, perPage);}
			else if(sort==3) {mapList=searchColumnsValuesInTableOrderByPopularity(table, columns, sj.toString()+"*", startNum, perPage);}
			else if(!Objects.nonNull(sort)) {return null;}
			
			for(HashMap<String, String> map:mapList)
			{				
				mmap.put(table, map);
				resultsList.add(mmap);
			}
		}
		
		return resultsList;
	}
	
	public List<HashMap<String, String>> searchInputWordsInTable(String inputWords,String table,int startNum,int perPage) {
		
		List<HashMap<String, String>> results=new ArrayList<HashMap<String,String>>();
		
		String [] keyWordsDivided=inputWords.split(" ");

		StringJoiner sj=new StringJoiner("* ");

		for(String keyWord:keyWordsDivided)
		{
			sj.add(keyWord);
		}

		String columns=searchColumnNamesInEachTables(table);
		results=searchColumnsValuesInTable(table, columns, sj.toString(), startNum, perPage);
			
		return results;
	}

	public String searchColumnNamesInEachTables(String table) {
		
		//String [] columnsArr=null;
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
				if(!cn.equals("tour_seq")||!cn.equals("writeday")||!cn.equals("stars")||!cn.equals("viewcount")||
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
		//columnsArr=columns.split(",");
		
		return columns;
	}
	
	public List<HashMap<String, String>> searchColumnsValuesInTable(String table,String columns,String keyWord,int startNum,int perPage) {
		
		List<HashMap<String, String>> results=new ArrayList<HashMap<String,String>>();
		String [] columnsArr=columns.split(",");
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String seqName="";
		if(table.equals(tables[0])) {seqName="seq";}
		else {seqName="tour_seq";}
		
		/*StringJoiner sj=new StringJoiner(",t.");
		for(String column:columnsArr)
		{
			sj.add(column);
		}*/
		
		String sql="select t.* from "+table+" t,statistics s where t."+seqName
					+"=s.tour_seq and MATCH("+columns+") AGAINST(? IN BOOLEAN MODE) limit ?,?";
		/*String sql="select t.*,s.selected_cnt,s.selected_date from "+table+" t"
					+" JOIN statistics s ON t."+seqName+"=s.tour_seq"
					+" where MATCH(t."+sj.toString()+") AGAINST(? IN BOOLEAN MODE) limit ?,?";*/

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, keyWord);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{				
				for(String column:columnsArr)
				{
					HashMap<String, String> map=new HashMap<String, String>();
					String [] splitted_string=null;
					
					if(keyWord.contains(rs.getString(column)))
					{
						splitted_string=rs.getString(column).split(keyWord);
						
						if(splitted_string.length==3) {map.put(column, splitted_string[0]+"<b style='background-colo:yellow'>"+keyWord+"</b>"+splitted_string[2]);}
						else if(splitted_string.length==2&&splitted_string[0].equals(keyWord)) {map.put(column, "<b style='background-colo:yellow'>"+keyWord+"</b>"+splitted_string[1]);}
						else {map.put(column, splitted_string[0]+"<b style='background-color:yellow'>"+keyWord+"</b>");}
					}
					else {map.put(column, rs.getString(column));}
					
					results.add(map);
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
	
	public List<HashMap<String, String>> searchColumnsValuesInTableOrderByPopularity(String table,String columns,String keyWord,int startNum,int perPage) {
		
		List<HashMap<String, String>> results=new ArrayList<HashMap<String,String>>();
		String [] columnsArr=columns.split(",");
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String seqName="";
		if(table.equals(tables[0])) {seqName="seq";}
		else {seqName="tour_seq";}
		
		String sql="select t.* from "+table+" t,statistics s where t."+seqName
					+"=s.tour_seq and MATCH("+columns+") AGAINST(? IN BOOLEAN MODE)"
					+" order by s.selected_cnt desc limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, keyWord);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{				
				for(String column:columnsArr)
				{
					HashMap<String, String> map=new HashMap<String, String>();
					String [] splitted_string=null;
					
					if(keyWord.contains(rs.getString(column)))
					{
						splitted_string=rs.getString(column).split(keyWord);
						
						if(splitted_string.length==3) {map.put(column, splitted_string[0]+"<b style='background-colo:yellow'>"+keyWord+"</b>"+splitted_string[2]);}
						else if(splitted_string.length==2&&splitted_string[0].equals(keyWord)) {map.put(column, "<b style='background-colo:yellow'>"+keyWord+"</b>"+splitted_string[1]);}
						else {map.put(column, splitted_string[0]+"<b style='background-color:yellow'>"+keyWord+"</b>");}
					}
					else {map.put(column, rs.getString(column));}
					
					results.add(map);
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
	
	public List<HashMap<String, String>> searchColumnsValuesInTableOrderByLatest(String table,String columns,String keyWord,int startNum,int perPage) {
		
		List<HashMap<String, String>> results=new ArrayList<HashMap<String,String>>();
		String [] columnsArr=columns.split(",");
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String seqName="";
		if(table.equals(tables[0])) {seqName="seq";}
		else {seqName="tour_seq";}
		
		String sql="select t.* from "+table+" t,statistics s where t."+seqName
					+"=s.tour_seq and MATCH("+columns+") AGAINST(? IN BOOLEAN MODE)"
					+" order by s.selected_date desc limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, keyWord);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{				
				for(String column:columnsArr)
				{
					HashMap<String, String> map=new HashMap<String, String>();
					String [] splitted_string=null;
					
					if(keyWord.contains(rs.getString(column)))
					{
						splitted_string=rs.getString(column).split(keyWord);
						
						if(splitted_string.length==3) {map.put(column, splitted_string[0]+"<b style='background-colo:yellow'>"+keyWord+"</b>"+splitted_string[2]);}
						else if(splitted_string.length==2&&splitted_string[0].equals(keyWord)) {map.put(column, "<b style='background-colo:yellow'>"+keyWord+"</b>"+splitted_string[1]);}
						else {map.put(column, splitted_string[0]+"<b style='background-color:yellow'>"+keyWord+"</b>");}
					}
					else {map.put(column, rs.getString(column));}
					
					results.add(map);
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
		
		for(String table:tables)
		{
			int totalIndividual=0;
			String columns=searchColumnNamesInEachTables(table);
			//StringJoiner js=new StringJoiner(",");
			
			/*for(String column:columnsArr)
			{
				sj.add(column);
			}*/
		
			String sql="select count(*) from "+table+" where MATCH("+columns+") AGAINST(? IN BOOLEAN MODE)";
	
			try {
				pstmt=conn.prepareStatement(sql);
	
				pstmt.setString(1, sj.toString());
				rs=pstmt.executeQuery();
				
				if(rs.next())
					totalIndividual=Integer.parseInt(rs.getString(1));
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			total+=totalIndividual;
		}
		return total;
	}
	
	//photo컬럼 있는 테이블에서 photo값 뽑기(searchboard 출력값에 사진 출력)
}
