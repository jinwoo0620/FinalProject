package com.kh.homeArt.goods.model.vo;

import java.sql.Date;

public class GoodsAtt {
   private int fileNo;
   private String originFileName;
   private String renameFileName;
   private String filePath;
   private int thumbNail;
   private Date uploadDate;
   private String imageStatus;
   private int goodsId;
   
   public GoodsAtt() {}

   public GoodsAtt(int fileNo, String originFileName, String renameFileName, String filePath, int thumbNail,
         Date uploadDate, String imageStatus, int goodsId) {
      super();
      this.fileNo = fileNo;
      this.originFileName = originFileName;
      this.renameFileName = renameFileName;
      this.filePath = filePath;
      this.thumbNail = thumbNail;
      this.uploadDate = uploadDate;
      this.imageStatus = imageStatus;
      this.goodsId = goodsId;
   }

   public int getFileNo() {
      return fileNo;
   }

   public void setFileNo(int fileNo) {
      this.fileNo = fileNo;
   }

   public String getOriginFileName() {
      return originFileName;
   }

   public void setOriginFileName(String originFileName) {
      this.originFileName = originFileName;
   }

   public String getRenameFileName() {
      return renameFileName;
   }

   public void setRenameFileName(String renameFileName) {
      this.renameFileName = renameFileName;
   }

   public String getFilePath() {
      return filePath;
   }

   public void setFilePath(String filePath) {
      this.filePath = filePath;
   }

   public int getThumbNail() {
      return thumbNail;
   }

   public void setThumbNail(int thumbNail) {
      this.thumbNail = thumbNail;
   }

   public Date getUploadDate() {
      return uploadDate;
   }

   public void setUploadDate(Date uploadDate) {
      this.uploadDate = uploadDate;
   }

   public String getImageStatus() {
      return imageStatus;
   }

   public void setImageStatus(String imageStatus) {
      this.imageStatus = imageStatus;
   }

   public int getGoodsId() {
      return goodsId;
   }

   public void setGoodsId(int goodsId) {
      this.goodsId = goodsId;
   }

   @Override
   public String toString() {
      return "GoodsAtt [fileNo=" + fileNo + ", originFileName=" + originFileName + ", renameFileName="
            + renameFileName + ", filePath=" + filePath + ", thumbNail=" + thumbNail + ", uploadDate=" + uploadDate
            + ", imageStatus=" + imageStatus + ", goodsId=" + goodsId + "]";
   }

   
   
   
   
}