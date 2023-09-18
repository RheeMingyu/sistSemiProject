package data.dto;

import java.sql.Timestamp;

public class MemberCommentDto {

	private String com_seq;
	private String id;
	private String membercomment;
	private Timestamp writeday;
	
	public String getCom_seq() {
		return com_seq;
	}
	public void setCom_seq(String com_seq) {
		this.com_seq = com_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMembercomment() {
		return membercomment;
	}
	public void setMembercomment(String membercomment) {
		this.membercomment = membercomment;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
	
	
	
	
}
