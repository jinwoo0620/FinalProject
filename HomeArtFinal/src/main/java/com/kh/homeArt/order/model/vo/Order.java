package com.kh.homeArt.order.model.vo;

import java.sql.Date;
import java.util.List;

public class Order {
   private int orderId;
   private int orderGoodsQty;
   private String memberId;
   private String addressee;
   private String address;
   private String address2;
   private String orderState;
   private List<OrderItem> orders;
   private int deliveryCost;
   private Date orderDate;
   
   //DB테이블 존재하지 않는 데이터
   //판매가(모든 상품 비용)
   private int totalPrice;
   
   //최종 판매 비용
   private int totalFinalPrice;
   
   public Order() {}

   
   
   public Order(int orderId, int orderGoodsQty, String memberId, String addressee, String address, String address2,
         String orderState, List<OrderItem> orders, int deliveryCost, Date orderDate, int totalPrice,
         int totalFinalPrice) {
      super();
      this.orderId = orderId;
      this.orderGoodsQty = orderGoodsQty;
      this.memberId = memberId;
      this.addressee = addressee;
      this.address = address;
      this.address2 = address2;
      this.orderState = orderState;
      this.orders = orders;
      this.deliveryCost = deliveryCost;
      this.orderDate = orderDate;
      this.totalPrice = totalPrice;
      this.totalFinalPrice = totalFinalPrice;
   }

   

   public int getOrderId() {
      return orderId;
   }



   public void setOrderId(int orderId) {
      this.orderId = orderId;
   }



   public int getOrderGoodsQty() {
      return orderGoodsQty;
   }



   public void setOrderGoodsQty(int orderGoodsQty) {
      this.orderGoodsQty = orderGoodsQty;
   }



   public String getMemberId() {
      return memberId;
   }



   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }



   public String getAddressee() {
      return addressee;
   }



   public void setAddressee(String addressee) {
      this.addressee = addressee;
   }



   public String getAddress() {
      return address;
   }



   public void setAddress(String address) {
      this.address = address;
   }



   public String getAddress2() {
      return address2;
   }



   public void setAddress2(String address2) {
      this.address2 = address2;
   }



   public String getOrderState() {
      return orderState;
   }



   public void setOrderState(String orderState) {
      this.orderState = orderState;
   }



   public List<OrderItem> getOrders() {
      return orders;
   }



   public void setOrders(List<OrderItem> orders) {
      this.orders = orders;
   }



   public int getDeliveryCost() {
      return deliveryCost;
   }



   public void setDeliveryCost(int deliveryCost) {
      this.deliveryCost = deliveryCost;
   }



   public Date getOrderDate() {
      return orderDate;
   }



   public void setOrderDate(Date orderDate) {
      this.orderDate = orderDate;
   }



   public int getTotalPrice() {
      return totalPrice;
   }



   public void setTotalPrice(int totalPrice) {
      this.totalPrice = totalPrice;
   }



   public int getTotalFinalPrice() {
      return totalFinalPrice;
   }



   public void setTotalFinalPrice(int totalFinalPrice) {
      this.totalFinalPrice = totalFinalPrice;
   }

   
   

   @Override
   public String toString() {
      return "Order [orderId=" + orderId + ", orderGoodsQty=" + orderGoodsQty + ", memberId=" + memberId
            + ", addressee=" + addressee + ", address=" + address + ", address2=" + address2 + ", orderState="
            + orderState + ", orders=" + orders + ", deliveryCost=" + deliveryCost + ", orderDate=" + orderDate
            + ", totalPrice=" + totalPrice + ", totalFinalPrice=" + totalFinalPrice + "]";
   }



   public void getOrderPriceInfo() {
      //상품비용
      for(OrderItem order:orders) {
            totalPrice += order.getTotalOrderPrice();
      }
      
      //배송비용
      if(totalPrice >= 30000) {
         deliveryCost = 0;
      } else {
         deliveryCost = 3000; 
      }
      
      //최종비용(상품비용 * 배송비)
      totalFinalPrice = totalPrice + deliveryCost;
   }
}