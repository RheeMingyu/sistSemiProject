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

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import data.dto.SearchResult;
import mysql.db.DBConnect;

public class SearchDao_v3 {
	
	DBConnect db=new DBConnect();
	
	//String [] tables= {"tourspot","mycourse","recomcourse","tourreview","guestreview","comment"};
	
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
	
	public List<HashMap<String, HashMap<String, String>>> searchInputWordsInWholeTablesWithStatistics(String inputWords,List<String> tables,int startNum,int perPage,int sort) {
		
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
			//else if(sort.equals("")) {return null;}
			
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
					+"where table_schema='semi' and table_name=?";
			
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, table);
			rs=pstmt.executeQuery();
				
			while(rs.next())
			{
				String cn=rs.getString("column_name");
				if(!cn.equals("tour_seq")&&!cn.equals("writeday")&&!cn.equals("stars")&&!cn.equals("viewcount")&&!cn.equals("pass")&&
					!cn.equals("price")&&!cn.equals("day")&&!cn.equals("turn")&&!cn.equals("likes")&&!cn.equals("seq")&&!cn.equals("com_seq"))
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
	
	public List<HashMap<String, String>> searchColumnsValuesInTable(String table,String columns,String keyWords,int startNum,int perPage) {
		
		List<HashMap<String, String>> results=new ArrayList<HashMap<String,String>>();
		String [] columnsArr=columns.split(",");
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String seqName="";
		if(table.equals("TourSpot")) {seqName="seq";}
		else {seqName="tour_seq";}

		StringJoiner sj=new StringJoiner(",t.");
		for(String column:columnsArr){sj.add(column);}
		
		String sql="";
		if(table.equals("TourReview")) {
			sql="select t.*,c.id,c.membercomment from "+table+" t JOIN Statistics s ON t."+seqName+"=s.tour_seq JOIN MemberComment c ON t.com_seq=c.com_seq"
				+" where MATCH(t."+sj.toString()+",c.id,c.membercomment) AGAINST(? IN BOOLEAN MODE) limit ?,?";
		}
		else if(table.equals("GuestReview")) {
			sql="select t.*,c.writer,c.guestcomment from "+table+" t JOIN Statistics s ON t."+seqName+"=s.tour_seq JOIN GuestComment c ON t.com_seq=c.com_seq"
				+" where MATCH(t."+sj.toString()+",c.writer,c.guestcomment) AGAINST(? IN BOOLEAN MODE) limit ?,?";
		}
		else {
			sql="select t.* from "+table+" t JOIN Statistics s ON t."+seqName
				+"=s.tour_seq where MATCH(t."+sj.toString()+") AGAINST(? IN BOOLEAN MODE) limit ?,?";
		}

		try {
			pstmt=conn.prepareStatement(sql);
			
			//pstmt.setString(1, "%"+keyWord+"%");
			pstmt.setString(1, keyWords);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			
			keyWords=keyWords.substring(0, keyWords.length()-1);
			String [] keyWordsDivided=keyWords.split("\\* ");
			
			while(rs.next())
			{
				HashMap<String, String> map=new HashMap<String, String>();
				
				for(String column:columnsArr)
				{
					String columnValue=rs.getString(column);
					StringBuilder result=new StringBuilder(columnValue);
					
					int minForPrevAbrv=Integer.MAX_VALUE;
					int maxForEndAbrv=0;
					
					for(String keyWord:keyWordsDivided)
					{
						columnValue=result.toString();
						if(columnValue.contains(keyWord))
						{
							StringBuilder keyWordResult=new StringBuilder();
							int index=-1;
							
							while((index=columnValue.indexOf(keyWord, index+1))>=0)
							{
								//int forPrevAbrv=Math.max(0, index-10);
								//int forEndAbrv=Math.min(columnValue.length(), index+keyWord.length());
								
								//minForPrevAbrv=Math.min(minForPrevAbrv, forPrevAbrv);
								//maxForEndAbrv=Math.max(maxForEndAbrv, forEndAbrv);
								
								keyWordResult.append(columnValue.substring(0, index));
								keyWordResult.append("<b style='background-color:yellow'>"+keyWord+"</b>");
								columnValue=columnValue.substring(index+keyWord.length());
							}
							keyWordResult.append(columnValue);
							System.out.println(column+":"+keyWordResult.toString());
							result.replace(0, result.length(), keyWordResult.toString());
							
							maxForEndAbrv=Math.max(maxForEndAbrv, result.lastIndexOf(keyWord)+keyWord.length()+14);
							minForPrevAbrv=Math.min(minForPrevAbrv, result.indexOf(keyWord)-45);
						}
						
					}
					if(result.toString().contains("<b style='background-color:yellow'>"))
					{
						System.out.println(minForPrevAbrv);
						map.put(column, (minForPrevAbrv<0?"":"...")+result.toString().substring(Math.max(0, minForPrevAbrv), Math.min(result.toString().length(), maxForEndAbrv))+(maxForEndAbrv>result.toString().length()?"":"..."));
					} else {map.put(column, (result.toString().length()>20?result.toString().substring(0, 20)+"...":result.toString()));}
					//map.put(column, result.toString());
				}
				results.add(map);				
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
	
	public List<HashMap<String, String>> searchColumnsValuesInTableOrderByPopularity(String table,String columns,String keyWords,int startNum,int perPage) {
		
		List<HashMap<String, String>> results=new ArrayList<HashMap<String,String>>();
		String [] columnsArr=columns.split(",");
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String seqName="";
		if(table.equals("TourSpot")) {seqName="seq";}
		else {seqName="tour_seq";}
		
		StringJoiner sj=new StringJoiner(",t.");
		for(String column:columnsArr){sj.add(column);}
		
		String sql="";
		if(table.equals("TourReview")) {
			sql="select t.*,c.id,c.membercomment from "+table+" t JOIN Statistics s ON t."+seqName+"=s.tour_seq JOIN MemberComment c ON t.com_seq=c.com_seq"
				+" where MATCH(t."+sj.toString()+",c.id,c.membercomment) AGAINST(? IN BOOLEAN MODE) order by s.selected_cnt desc limit ?,?";
		}
		else if(table.equals("GuestReview")) {
			sql="select t.*,c.writer,c.guestcomment from "+table+" t JOIN Statistics s ON t."+seqName+"=s.tour_seq JOIN GuestComment c ON t.com_seq=c.com_seq"
				+" where MATCH(t."+sj.toString()+",c.writer,c.guestcomment) AGAINST(? IN BOOLEAN MODE) order by s.selected_cnt desc limit ?,?";
		}
		else {
			sql="select t.* from "+table+" t JOIN Statistics s ON t."+seqName
				+"=s.tour_seq where MATCH(t."+sj.toString()+") AGAINST(? IN BOOLEAN MODE) order by s.selected_cnt desc limit ?,?";
		}
		//String sql="select * from "+table+" where name like ?";
		try {
			pstmt=conn.prepareStatement(sql);

			//pstmt.setString(1, "%"+keyWord+"%");
			pstmt.setString(1, keyWords);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			
			keyWords=keyWords.substring(0, keyWords.length()-1);
			String [] keyWordsDivided=keyWords.split("\\* ");
			
			while(rs.next())
			{
				HashMap<String, String> map=new HashMap<String, String>();
				
				for(String column:columnsArr)
				{
					String columnValue=rs.getString(column);
					StringBuilder result=new StringBuilder(columnValue);
					
					int minForPrevAbrv=Integer.MAX_VALUE;
					int maxForEndAbrv=0;
					
					for(String keyWord:keyWordsDivided)
					{
						columnValue=result.toString();
						if(columnValue.contains(keyWord))
						{
							StringBuilder keyWordResult=new StringBuilder();
							int index=-1;
							
							while((index=columnValue.indexOf(keyWord, index+1))>=0)
							{								
								keyWordResult.append(columnValue.substring(0, index));
								keyWordResult.append("<b style='background-color:yellow'>"+keyWord+"</b>");
								columnValue=columnValue.substring(index+keyWord.length());
							}
							keyWordResult.append(columnValue);
							System.out.println(column+":"+keyWordResult.toString());
							result.replace(0, result.length(), keyWordResult.toString());
							
							maxForEndAbrv=Math.max(maxForEndAbrv, result.lastIndexOf(keyWord)+keyWord.length()+14);
							minForPrevAbrv=Math.min(minForPrevAbrv, result.indexOf(keyWord)-45);
						}
						
					}
					if(result.toString().contains("<b style='background-color:yellow'>"))
					{
						map.put(column, (minForPrevAbrv<0?"":"...")+result.toString().substring(Math.max(0, minForPrevAbrv), Math.min(result.toString().length(), maxForEndAbrv))+(maxForEndAbrv>result.toString().length()?"":"..."));
					} else {map.put(column, (result.toString().length()>20?result.toString().substring(0, 20)+"...":result.toString()));}
					//map.put(column, result.toString());
				}
				results.add(map);				
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
	
	public List<HashMap<String, String>> searchColumnsValuesInTableOrderByLatest(String table,String columns,String keyWords,int startNum,int perPage) {
		
		List<HashMap<String, String>> results=new ArrayList<HashMap<String,String>>();
		String [] columnsArr=columns.split(",");
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String seqName="";
		if(table.equals("TourSpot")) {seqName="seq";}
		else {seqName="tour_seq";}
		
		StringJoiner sj=new StringJoiner(",t.");
		for(String column:columnsArr){sj.add(column);}
		
		String sql="";
		if(table.equals("TourReview")) {
			sql="select t.*,c.id,c.membercomment from "+table+" t JOIN Statistics s ON t."+seqName+"=s.tour_seq JOIN MemberComment c ON t.com_seq=c.com_seq"
				+" where MATCH(t."+sj.toString()+",c.id,c.membercomment) AGAINST(? IN BOOLEAN MODE) order by s.selected_date desc limit ?,?";
		}
		else if(table.equals("GuestReview")) {
			sql="select t.*,c.writer,c.guestcomment from "+table+" t JOIN Statistics s ON t."+seqName+"=s.tour_seq JOIN GuestComment c ON t.com_seq=c.com_seq"
				+" where MATCH(t."+sj.toString()+",c.writer,c.guestcomment) AGAINST(? IN BOOLEAN MODE) order by s.selected_date desc limit ?,?";
		}
		else {
			sql="select t.* from "+table+" t JOIN Statistics s ON t."+seqName
				+"=s.tour_seq where MATCH(t."+sj.toString()+") AGAINST(? IN BOOLEAN MODE) order by s.selected_date desc limit ?,?";
		}
		//String sql="select * from "+table+" where name like ?";
		try {
			pstmt=conn.prepareStatement(sql);

			//pstmt.setString(1, "%"+keyWord+"%");
			pstmt.setString(1, keyWords);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			
			keyWords=keyWords.substring(0, keyWords.length()-1);
			String [] keyWordsDivided=keyWords.split("\\* ");
			
			while(rs.next())
			{
				HashMap<String, String> map=new HashMap<String, String>();
				
				for(String column:columnsArr)
				{
					String columnValue=rs.getString(column);
					StringBuilder result=new StringBuilder(columnValue);
					
					int minForPrevAbrv=Integer.MAX_VALUE;
					int maxForEndAbrv=0;
					
					for(String keyWord:keyWordsDivided)
					{
						columnValue=result.toString();
						if(columnValue.contains(keyWord))
						{
							StringBuilder keyWordResult=new StringBuilder();
							int index=-1;
							
							while((index=columnValue.indexOf(keyWord, index+1))>=0)
							{
								keyWordResult.append(columnValue.substring(0, index));
								keyWordResult.append("<b style='background-color:yellow'>"+keyWord+"</b>");
								columnValue=columnValue.substring(index+keyWord.length());
							}
							keyWordResult.append(columnValue);
							System.out.println(column+":"+keyWordResult.toString());
							result.replace(0, result.length(), keyWordResult.toString());
							
							maxForEndAbrv=Math.max(maxForEndAbrv, result.lastIndexOf(keyWord)+keyWord.length()+14);
							minForPrevAbrv=Math.min(minForPrevAbrv, result.indexOf(keyWord)-45);
						}
					}
					if(result.toString().contains("<b style='background-color:yellow'>"))
					{
						map.put(column, (minForPrevAbrv<0?"":"...")+result.toString().substring(Math.max(0, minForPrevAbrv), Math.min(result.toString().length(), maxForEndAbrv))+(maxForEndAbrv>result.toString().length()?"":"..."));
					} else {map.put(column, (result.toString().length()>20?result.toString().substring(0, 20)+"...":result.toString()));}
					//map.put(column, result.toString());
				}
				results.add(map);				
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

	public int getTotalCount(String inputWords,List<String> tables) {
		
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
			StringJoiner js=new StringJoiner(",");
			
			/*for(String column:columnsArr)
			{
				sj.add(column);
			}*/
		
			String sql="select count(*) from "+table+" where MATCH("+columns+") AGAINST(? IN BOOLEAN MODE)";
			//String sql="select count(*) from "+table+" where name like ?";
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
}
