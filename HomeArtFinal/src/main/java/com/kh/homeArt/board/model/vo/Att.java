package com.kh.homeArt.board.model.vo;

public class Att {
   private int fileId;
   private String originName;
   private String changeName;
   private String filePath;
   private int fileLevel;
   private int boardNo;
   private String memberId;
   
   public Att() {}

   public Att(int fileId, String originName, String changeName, String filePath, int fileLevel, int boardNo,
         String memberId) {
      super();
      this.fileId = fileId;
      this.originName = originName;
      this.changeName = changeName;
      this.filePath = filePath;
      this.fileLevel = fileLevel;
      this.boardNo = boardNo;
      this.memberId = memberId;
   }

   public int getFileId() {
      return fileId;
   }

   public void setFileId(int fileId) {
      this.fileId = fileId;
   }

   public String getOriginName() {
      return originName;
   }

   public void setOriginName(String originName) {
      this.originName = originName;
   }

   public String getChangeName() {
      return changeName;
   }

   public void setChangeName(String changeName) {
      this.changeName = changeName;
   }

   public String getFilePath() {
      return filePath;
   }

   public void setFilePath(String filePath) {
      this.filePath = filePath;
   }

   public int getFileLevel() {
      return fileLevel;
   }

   public void setFileLevel(int fileLevel) {
      this.fileLevel = fileLevel;
   }

   public int getBoardNo() {
      return boardNo;
   }

   public void setBoardNo(int boardNo) {
      this.boardNo = boardNo;
   }

   public String getMemberId() {
      return memberId;
   }

   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }

   @Override
   public String toString() {
      return "Att [fileId=" + fileId + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
            + filePath + ", fileLevel=" + fileLevel + ", boardNo=" + boardNo + ", memberId=" + memberId + "]";
   }
}