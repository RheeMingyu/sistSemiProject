package data.dto;

import java.sql.Timestamp;

public class StatisticsDto {
	private String tour_seq;
	private String id;
	private int selected_cnt;
	private Timestamp selected_date;
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
