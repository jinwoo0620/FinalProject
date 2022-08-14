package com.kh.homeArt.expert.model.vo;

public class Expert {
   private int expertProfileNo;
   private String expertTitle;
   private String expertInfo;
   private String area;
   private String employeeCount;
   private int hireCount;
   private int career;
   private String workingDay;
   private String workingTime;
   private String detailDescription;
   private String businessLicense;
   private String field;
   private String originalFileName;
   private String renameFileName;
   private String expertBoardStatus;
   private String expertId;
   
   public Expert() {}

   public Expert(int expertProfileNo, String expertTitle, String expertInfo, String area, String employeeCount,
         int hireCount, int career, String workingDay, String workingTime, String detailDescription,
         String businessLicense, String field, String originalFileName, String renameFileName,
         String expertBoardStatus, String expertId) {
      super();
      this.expertProfileNo = expertProfileNo;
      this.expertTitle = expertTitle;
      this.expertInfo = expertInfo;
      this.area = area;
      this.employeeCount = employeeCount;
      this.hireCount = hireCount;
      this.career = career;
      this.workingDay = workingDay;
      this.workingTime = workingTime;
      this.detailDescription = detailDescription;
      this.businessLicense = businessLicense;
      this.field = field;
      this.originalFileName = originalFileName;
      this.renameFileName = renameFileName;
      this.expertBoardStatus = expertBoardStatus;
      this.expertId = expertId;
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

   public String getEmployeeCount() {
      return employeeCount;
   }

   public void setEmployeeCount(String employeeCount) {
      this.employeeCount = employeeCount;
   }

   public int getHireCount() {
      return hireCount;
   }

   public void setHireCount(int hireCount) {
      this.hireCount = hireCount;
   }

   public int getCareer() {
      return career;
   }

   public void setCareer(int career) {
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

   public String getDetailDescription() {
      return detailDescription;
   }

   public void setDetailDescription(String detailDescription) {
      this.detailDescription = detailDescription;
   }

   public String getBusinessLicense() {
      return businessLicense;
   }

   public void setBusinessLicense(String businessLicense) {
      this.businessLicense = businessLicense;
   }

   public String getField() {
      return field;
   }

   public void setField(String field) {
      this.field = field;
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

   public String getExpertBoardStatus() {
      return expertBoardStatus;
   }

   public void setExpertBoardStatus(String expertBoardStatus) {
      this.expertBoardStatus = expertBoardStatus;
   }

   public String getExpertId() {
      return expertId;
   }

   public void setExpertId(String expertId) {
      this.expertId = expertId;
   }

   @Override
   public String toString() {
      return "Expert [expertProfileNo=" + expertProfileNo + ", expertTitle=" + expertTitle + ", expertInfo="
            + expertInfo + ", area=" + area + ", employeeCount=" + employeeCount + ", hireCount=" + hireCount
            + ", career=" + career + ", workingDay=" + workingDay + ", workingTime=" + workingTime
            + ", detailDescription=" + detailDescription + ", businessLicense=" + businessLicense + ", field="
            + field + ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName
            + ", expertBoardStatus=" + expertBoardStatus + ", expertId=" + expertId + "]";
   }
}