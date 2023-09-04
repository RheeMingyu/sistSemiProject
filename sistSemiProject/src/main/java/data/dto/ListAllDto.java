package data.dto;

import java.sql.Timestamp;

public class ListAllDto { //겹치는 컬럼명은 중복 사용하면 되므로 생략

	private String seq;
	private String name;
	private String hp;
	private String addr;
	private String photo;
	private String intro;
	private String area;
	private String theme;
	private String main_cat;
	private String sub_cat;
	private String note;
	private int price;
	private Timestamp writeday;
	
	private String tour_seq;
	private String id;
	private String title;
	private int viewcount;
	private int likes;
	private String content;
	private String comment;
	private int stars;
	
	private String day;
	private String order;
	
	private int selected_cnt;
	private Timestamp selected_date;
	
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
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public String getTour_seq() {
		return tour_seq;
	}
	public void setTour_seq(String tour_seq) {
		this.tour_seq = tour_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public int getSelected_cnt() {
		return selected_cnt;
	}
	public void setSelected_cnt(int selected_cnt) {
		this.selected_cnt = selected_cnt;
	}
	public Timestamp getSelected_date() {
		return selected_date;
	}
	public void setSelected_date(Timestamp selected_date) {
		this.selected_date = selected_date;
	}
	
}
