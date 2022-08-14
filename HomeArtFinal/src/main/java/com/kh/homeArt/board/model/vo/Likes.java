package com.kh.homeArt.board.model.vo;

public class Likes {
   private String likedId;
   private int boardNo;
   
   public Likes() {}

   public Likes(String likedId, int boardNo) {
      super();
      this.likedId = likedId;
      this.boardNo = boardNo;
   }

   public String getLikedId() {
      return likedId;
   }

   public void setLikedId(String likedId) {
      this.likedId = likedId;
   }

   public int getBoardNo() {
      return boardNo;
   }

   public void setBoardNo(int boardNo) {
      this.boardNo = boardNo;
   }

   @Override
   public String toString() {
      return "Likes [likedId=" + likedId + ", boardNo=" + boardNo + "]";
   }
}