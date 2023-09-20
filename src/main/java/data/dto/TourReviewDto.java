package data.dto;

import java.sql.Timestamp;

public class TourReviewDto {

   private String com_seq;
   private String tour_seq;
   private String id;
   private String photo;
   private String title;
   private Timestamp writeday;
   private String viewcount;
   private String likes;
   private String content;
   private String comment;
   private String stars;
   
   
   public String getCom_seq() {
      return com_seq;
   }
   public void setCom_seq(String com_seq) {
      this.com_seq = com_seq;
   }
   public String getTour_seq() {
      return tour_seq;
   }
   public void setTour_seq(String tour_seq) {
      this.tour_seq = tour_seq;
   }
   public String getId() {
      return id !=null ? id:"";
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPhoto() {
      return photo;
   }
   public void setPhoto(String photo) {
      this.photo = photo;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public Timestamp getWriteday() {
      return writeday;
   }
   public void setWriteday(Timestamp writeday) {
      this.writeday = writeday;
   }
   public String getViewcount() {
      return viewcount;
   }
   public void setViewcount(String viewcount) {
      this.viewcount = viewcount;
   }
   public String getLikes() {
      return likes;
   }
   public void setLikes(String likes) {
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
   public String getStars() {
      return stars;
   }
   public void setStars(String stars) {
      this.stars = stars;
   }
   
   
   
}