package data.dto;

import java.sql.Timestamp;

public class MemberDto {
   
   private String num;
   private String id;
   private String name;
   private String profile;
   private String pass;
   private String hp;
   private String email;
   private String age;
   private String gender;
   private String area;
   private String mbti;
   private Timestamp register_day;
   
   
   
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
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getProfile() {
      return profile;
   }
   public void setProfile(String profile) {
      this.profile = profile;
   }
   public String getPass() {
      return pass;
   }
   public void setPass(String pass) {
      this.pass = pass;
   }
   public String getHp() {
      return hp;
   }
   public void setHp(String hp) {
      this.hp = hp;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getAge() {
      return age;
   }
   public void setAge(String age) {
      this.age = age;
   }
   public String getGender() {
      return gender;
   }
   public void setGender(String gender) {
      this.gender = gender;
   }
   public String getArea() {
      return area;
   }
   public void setArea(String area) {
      this.area = area;
   }
   public String getMbti() {
      return mbti;
   }
   public void setMbti(String mbti) {
      this.mbti = mbti;
   }
   public Timestamp getRegister_day() {
      return register_day;
   }
   public void setRegister_day(Timestamp register_day) {
      this.register_day = register_day;
   }
   
}