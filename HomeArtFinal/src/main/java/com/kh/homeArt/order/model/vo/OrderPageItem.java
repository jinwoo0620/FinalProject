package com.kh.homeArt.order.model.vo;

import java.util.List;

import com.kh.homeArt.goods.model.vo.GoodsAtt;

public class OrderPageItem {
   
   
   private int goodsId;
   private int cartId;
   private String renameFileName;
   private int goodsCount;
   private int goodsPrice;
   private String goodsTitle;
   
   //객체에 저장해주기 위해서(form db)
   
   public OrderPageItem() {}

   public OrderPageItem(int goodsId, int cartId, String renameFileName, int goodsCount, int goodsPrice,
         String goodsTitle) {
      super();
      this.goodsId = goodsId;
      this.cartId = cartId;
      this.renameFileName = renameFileName;
      this.goodsCount = goodsCount;
      this.goodsPrice = goodsPrice;
      this.goodsTitle = goodsTitle;
   }

   public int getGoodsId() {
      return goodsId;
   }

   public void setGoodsId(int goodsId) {
      this.goodsId = goodsId;
   }

   public int getCartId() {
      return cartId;
   }

   public void setCartId(int cartId) {
      this.cartId = cartId;
   }

   public String getRenameFileName() {
      return renameFileName;
   }

   public void setRenameFileName(String renameFileName) {
      this.renameFileName = renameFileName;
   }

   public int getGoodsCount() {
      return goodsCount;
   }

   public void setGoodsCount(int goodsCount) {
      this.goodsCount = goodsCount;
   }

   public int getGoodsPrice() {
      return goodsPrice;
   }

   public void setGoodsPrice(int goodsPrice) {
      this.goodsPrice = goodsPrice;
   }

   public String getGoodsTitle() {
      return goodsTitle;
   }

   public void setGoodsTitle(String goodsTitle) {
      this.goodsTitle = goodsTitle;
   }

   @Override
   public String toString() {
      return "OrderPageItem [goodsId=" + goodsId + ", cartId=" + cartId + ", renameFileName=" + renameFileName
            + ", goodsCount=" + goodsCount + ", goodsPrice=" + goodsPrice + ", goodsTitle=" + goodsTitle + "]";
   }
   
   
}