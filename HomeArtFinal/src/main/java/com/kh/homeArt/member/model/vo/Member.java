package com.kh.homeArt.member.model.vo;

import java.sql.Date;

public class Member {
   
   private String id;
   private String pwd;
   private String name;
   private String nickName;
   private String email;
   private String gender;
   private String phone;
   private String address;
   private Date enrollDate;
   private int power;
   private String mStatus;
   private String originalFileName;
   private String renameFileName;
   private String field;
   private String career;
   private String workingDay;
   private String workingTime;
   
   public Member() {}

   public Member(String id, String pwd, String name, String nickName, String email, String gender, String phone,
         String address, Date enrollDate, int power, String mStatus, String originalFileName, String renameFileName,
         String field, String career, String workingDay, String workingTime) {
      super();
      this.id = id;
      this.pwd = pwd;
      this.name = name;
      this.nickName = nickName;
      this.email = email;
      this.gender = gender;
      this.phone = phone;
      this.address = address;
      this.enrollDate = enrollDate;
      this.power = power;
      this.mStatus = mStatus;
      this.originalFileName = originalFileName;
      this.renameFileName = renameFileName;
      this.field = field;
      this.career = career;
      this.workingDay = workingDay;
      this.workingTime = workingTime;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPwd() {
      return pwd;
   }

   public void setPwd(String pwd) {
      this.pwd = pwd;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getNickName() {
      return nickName;
   }

   public void setNickName(String nickName) {
      this.nickName = nickName;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public Date getEnrollDate() {
      return enrollDate;
   }

   public void setEnrollDate(Date enrollDate) {
      this.enrollDate = enrollDate;
   }

   public int getPower() {
      return power;
   }

   public void setPower(int power) {
      this.power = power;
   }

   public String getmStatus() {
      return mStatus;
   }

   public void setmStatus(String mStatus) {
      this.mStatus = mStatus;
   }

   public String getOriginalFileName() {
      return originalFileName;
   }

   public void setOriginalFileName(String originalFileName) {
      this.originalFileName = originalFileName;
   }

   public String getRenameFileName() {
      return renameFileName;
   }

   public void setRenameFileName(String renameFileName) {
      this.renameFileName = renameFileName;
   }

   public String getField() {
      return field;
   }

   public void setField(String field) {
      this.field = field;
   }

   public String getCareer() {
      return career;
   }

   public void setCareer(String career) {
      this.career = career;
   }

   public String getWorkingDay() {
      return workingDay;
   }

   public void setWorkingDay(String workingDay) {
      this.workingDay = workingDay;
   }

   public String getWorkingTime() {
      return workingTime;
   }

   public void setWorkingTime(String workingTime) {
      this.workingTime = workingTime;
   }

   @Override
   public String toString() {
      return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickName=" + nickName + ", email=" + email
            + ", gender=" + gender + ", phone=" + phone + ", address=" + address + ", enrollDate=" + enrollDate
            + ", power=" + power + ", mStatus=" + mStatus + ", originalFileName=" + originalFileName
            + ", renameFileName=" + renameFileName + ", field=" + field + ", career=" + career + ", workingDay="
            + workingDay + ", workingTime=" + workingTime + "]";
   }
   
}