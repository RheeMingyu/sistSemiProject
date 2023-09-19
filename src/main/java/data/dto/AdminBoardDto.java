package data.dto;

import java.sql.Timestamp;

public class AdminBoardDto {
		   
		   private String num;
		   private String id;
		   private String subject;
		   private String content;
		   private int readcnt;
		   private Timestamp writeday;
		   
		   
		   public String getNum() {
		      return num;
		   }
		   public void setNum(String num) {
		      this.num = num;
		   }
		   public String getId() {
		      return id;
		   }
		   public void setId(String id) {
		      this.id = id;
		   }
		   public String getSubject() {
		      return subject;
		   }
		   public void setSubject(String subject) {
		      this.subject = subject;
		   }
		   public String getContent() {
		      return content;
		   }
		   public void setContent(String content) {
		      this.content = content;
		   }
		   public int getReadcnt() {
		      return readcnt;
		   }
		   public void setReadcnt(int readcnt) {
		      this.readcnt = readcnt;
		   }
		   public Timestamp getWriteday() {
		      return writeday;
		   }
		   public void setWriteday(Timestamp writeday) {
		      this.writeday = writeday;
		   }
		   
		   

		
	}