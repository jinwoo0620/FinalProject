package com.kh.homeArt.goods.model.vo;

public class Goods {
   private int goodsId;//상품코드
   private String goodsTitle;//상품명
   private int goodsPrice;//상품가격
   private String goodsCompany;//제조회사
   private String goodsInfo;//상세설명
   private int goodsStock;//재고
   private String goodsSort;//종류
   private String status;//상태
   private String adminId;//관리자아이디
   
   public Goods() {};

   public Goods(int goodsId, String goodsTitle, int goodsPrice, String goodsCompany, String goodsInfo, int goodsStock,
         String goodsSort, String status, String adminId) {
      super();
      this.goodsId = goodsId;
      this.goodsTitle = goodsTitle;
      this.goodsPrice = goodsPrice;
      this.goodsCompany = goodsCompany;
      this.goodsInfo = goodsInfo;
      this.goodsStock = goodsStock;
      this.goodsSort = goodsSort;
      this.status = status;
      this.adminId = adminId;
   }

   public int getGoodsId() {
      return goodsId;
   }

   public void setGoodsId(int goodsId) {
      this.goodsId = goodsId;
   }

   public String getGoodsTitle() {
      return goodsTitle;
   }

   public void setGoodsTitle(String goodsTitle) {
      this.goodsTitle = goodsTitle;
   }

   public int getGoodsPrice() {
      return goodsPrice;
   }

   public void setGoodsPrice(int goodsPrice) {
      this.goodsPrice = goodsPrice;
   }

   public String getGoodsCompany() {
      return goodsCompany;
   }

   public void setGoodsCompany(String goodsCompany) {
      this.goodsCompany = goodsCompany;
   }

   public String getGoodsInfo() {
      return goodsInfo;
   }

   public void setGoodsInfo(String goodsInfo) {
      this.goodsInfo = goodsInfo;
   }

   public int getGoodsStock() {
      return goodsStock;
   }

   public void setGoodsStock(int goodsStock) {
      this.goodsStock = goodsStock;
   }

   public String getGoodsSort() {
      return goodsSort;
   }

   public void setGoodsSort(String goodsSort) {
      this.goodsSort = goodsSort;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public String getAdminId() {
      return adminId;
   }

   public void setAdminId(String adminId) {
      this.adminId = adminId;
   }

   @Override
   public String toString() {
      return "Goods [goodsId=" + goodsId + ", goodsTitle=" + goodsTitle + ", goodsPrice=" + goodsPrice
            + ", goodsCompany=" + goodsCompany + ", goodsInfo=" + goodsInfo + ", goodsStock=" + goodsStock
            + ", goodsSort=" + goodsSort + ", status=" + status + ", adminId=" + adminId + "]";
   }
   
   
}