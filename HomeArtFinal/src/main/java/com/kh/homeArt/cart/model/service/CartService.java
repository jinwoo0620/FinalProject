package com.kh.homeArt.cart.model.service;

import java.util.ArrayList;
import java.util.List;


import com.kh.homeArt.cart.model.vo.Cart;
import com.kh.homeArt.goods.model.vo.Goods;
import com.kh.homeArt.goods.model.vo.GoodsAtt;


public interface CartService {

   int insertCart(Cart cart);


   ArrayList<Cart> selectTextList(String userId);


   ArrayList<GoodsAtt> selectImgList(String memberId);


   int deleteCart(int cId);


   int checkCart(int goodsId);


   

}