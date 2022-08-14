package com.kh.homeArt.cart.model.vo;

import java.util.List;

import com.kh.homeArt.goods.model.vo.GoodsAtt;

public class Cart {
   private int cartId;
   private int goodsCount;
   private int goodsId;
   private String memberId;
   //cart를 위해 join하기 위해서 c
   //resultSet을 만들기 위해 vo를 만드는거야.
   //price같은것도... vo에서 갖고 온게 아니라 !!!
   
   //goods
   private String goodsTitle;
   private int goodsPrice;
   
   //goodsATT
   private String renameFileName;
   

public Cart() {}


public Cart(int cartId, int goodsCount, int goodsId, String memberId, String goodsTitle, int goodsPrice,
      String renameFileName) {
   super();
   this.cartId = cartId;
   this.goodsCount = goodsCount;
   this.goodsId = goodsId;
   this.memberId = memberId;
   this.goodsTitle = goodsTitle;
   this.goodsPrice = goodsPrice;
   this.renameFileName = renameFileName;
}


public int getCartId() {
   return cartId;
}


public void setCartId(int cartId) {
   this.cartId = cartId;
}


public int getGoodsCount() {
   return goodsCount;
}


public void setGoodsCount(int goodsCount) {
   this.goodsCount = goodsCount;
}


public int getGoodsId() {
   return goodsId;
}


public void setGoodsId(int goodsId) {
   this.goodsId = goodsId;
}


public String getMemberId() {
   return memberId;
}


public void setMemberId(String memberId) {
   this.memberId = memberId;
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


public String getRenameFileName() {
   return renameFileName;
}


public void setRenameFileName(String renameFileName) {
   this.renameFileName = renameFileName;
}


@Override
public String toString() {
   return "Cart [cartId=" + cartId + ", goodsCount=" + goodsCount + ", goodsId=" + goodsId + ", memberId=" + memberId
         + ", goodsTitle=" + goodsTitle + ", goodsPrice=" + goodsPrice + ", renameFileName=" + renameFileName + "]";
}




}