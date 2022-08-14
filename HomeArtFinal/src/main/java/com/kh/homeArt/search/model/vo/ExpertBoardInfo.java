package com.kh.homeArt.search.model.vo;

public class ExpertBoardInfo {
   private int expertProfileNo;
   private String expertTitle;
   private String expertInfo;
   private String area;
   private String field;
   private String workingDay;
   private String mReName;
   private String ebReName;
   private String career;
   private int page;
   
   public ExpertBoardInfo() {}

   public ExpertBoardInfo(int expertProfileNo, String expertTitle, String expertInfo, String area, String field,
         String workingDay, String mReName, String ebReName, String career, int page) {
      super();
      this.expertProfileNo = expertProfileNo;
      this.expertTitle = expertTitle;
      this.expertInfo = expertInfo;
      this.area = area;
      this.field = field;
      this.workingDay = workingDay;
      this.mReName = mReName;
      this.ebReName = ebReName;
      this.career = career;
      this.page = page;
   }

   public int getExpertProfileNo() {
      return expertProfileNo;
   }

   public void setExpertProfileNo(int expertProfileNo) {
      this.expertProfileNo = expertProfileNo;
   }

   public String getExpertTitle() {
      return expertTitle;
   }

   public void setExpertTitle(String expertTitle) {
      this.expertTitle = expertTitle;
   }

   public String getExpertInfo() {
      return expertInfo;
   }

   public void setExpertInfo(String expertInfo) {
      this.expertInfo = expertInfo;
   }

   public String getArea() {
      return area;
   }

   public void setArea(String area) {
      this.area = area;
   }

   public String getField() {
      return field;
   }

   public void setField(String field) {
      this.field = field;
   }

   public String getWorkingDay() {
      return workingDay;
   }

   public void setWorkingDay(String workingDay) {
      this.workingDay = workingDay;
   }

   public String getmReName() {
      return mReName;
   }

   public void setmReName(String mReName) {
      this.mReName = mReName;
   }

   public String getEbReName() {
      return ebReName;
   }

   public void setEbReName(String ebReName) {
      this.ebReName = ebReName;
   }

   public String getCareer() {
      return career;
   }

   public void setCareer(String career) {
      this.career = career;
   }

   public int getPage() {
      return page;
   }

   public void setPage(int page) {
      this.page = page;
   }

   @Override
   public String toString() {
      return "ExpertBoardInfo [expertProfileNo=" + expertProfileNo + ", expertTitle=" + expertTitle + ", expertInfo="
            + expertInfo + ", area=" + area + ", field=" + field + ", workingDay=" + workingDay + ", mReName="
            + mReName + ", ebReName=" + ebReName + ", career=" + career + ", page=" + page + "]";
   }
   
   
   
}