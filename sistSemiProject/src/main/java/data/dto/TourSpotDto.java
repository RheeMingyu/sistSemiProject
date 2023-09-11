package data.dto;

import java.sql.Timestamp;

public class TourSpotDto {
	private String seq; //시퀀스
	private String name; //이름
	private String hp; //전화번호
	private String addr; //주소
	private String photo; //사진
	private String intro; //소개
	private String area; //지역
	private String theme; //테마
	private String main_cat; //대분류
	private String sub_cat; //소분류
	private String note; //비고
	private int price; //가격
	private Timestamp writeday; //등록일
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getMain_cat() {
		return main_cat;
	}
	public void setMain_cat(String main_cat) {
		this.main_cat = main_cat;
	}
	public String getSub_cat() {
		return sub_cat;
	}
	public void setSub_cat(String sub_cat) {
		this.sub_cat = sub_cat;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int i) {
		this.price = i;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
	
}
