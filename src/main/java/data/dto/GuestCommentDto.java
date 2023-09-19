package data.dto;

import java.sql.Timestamp;

public class GuestCommentDto {

	
	private String com_seq;
	private String writer;
	private String pass;
	private String guestcomment;
	private Timestamp writeday;
	
	public String getCom_seq() {
		return com_seq;
	}
	public void setCom_seq(String com_seq) {
		this.com_seq = com_seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getGuestcomment() {
		return guestcomment;
	}
	public void setGuestcomment(String guestcomment) {
		this.guestcomment = guestcomment;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
	
}
