package data.dto;

import java.sql.Timestamp;

public class ContentBoardDto {

	   
	   private String id;
	   private String content;
	   private Timestamp writeday;
	   
	   public String getId() {
	      return id;
	   }
	   public void setId(String id) {
	      this.id = id;
	   }
	   public String getContent() {
	      return content;
	   }
	   public void setContent(String content) {
	      this.content = content;
	   }
	   public Timestamp getWriteday() {
	      return writeday;
	   }
	   public void setWriteday(Timestamp writeday) {
	      this.writeday = writeday;
	   }
	   
	   
	}
