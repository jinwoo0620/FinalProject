package com.kh.homeArt.order.model.vo;

public class OrderItem {
   
   public int orderId;
   public int goodsId;
   public int goodsPrice;
   public int goodsCount;
   
   //DB 테이블 존재 하지 않는 데이터
   //총가격(적용된 가격 * 주문 수량)
   private int totalOrderPrice;
   
   public OrderItem() {}

   public OrderItem(int orderId, int goodsId, int goodsPrice, int goodsCount, int totalOrderPrice) {
      super();
      this.orderId = orderId;
      this.goodsId = goodsId;
      this.goodsPrice = goodsPrice;
      this.goodsCount = goodsCount;
      this.totalOrderPrice = totalOrderPrice;
   }

   public int getOrderId() {
      return orderId;
   }

   public void setOrderId(int orderId) {
      this.orderId = orderId;
   }

   public int getGoodsId() {
      return goodsId;
   }

   public void setGoodsId(int goodsId) {
      this.goodsId = goodsId;
   }

   public int getGoodsPrice() {
      return goodsPrice;
   }

   public void setGoodsPrice(int goodsPrice) {
      this.goodsPrice = goodsPrice;
   }

   public int getGoodsCount() {
      return goodsCount;
   }

   public void setGoodsCount(int goodsCount) {
      this.goodsCount = goodsCount;
   }

   public int getTotalOrderPrice() {
      return totalOrderPrice;
   }

   public void setTotalOrderPrice(int totalOrderPrice) {
      this.totalOrderPrice = totalOrderPrice;
   }

   @Override
   public String toString() {
      return "OrderItem [orderId=" + orderId + ", goodsId=" + goodsId + ", goodsPrice=" + goodsPrice + ", goodsCount="
            + goodsCount + ", totalOrderPrice=" + totalOrderPrice + "]";
   }

   
   //주문 작업에 필요로 한 데이터를 세팅해주는 메소드를 추가
   public void initSaleTotal() {
      this.totalOrderPrice = this.goodsPrice;
   }
   
}