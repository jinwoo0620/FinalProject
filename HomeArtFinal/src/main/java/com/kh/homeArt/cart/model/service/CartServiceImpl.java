package com.kh.homeArt.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.homeArt.cart.model.dao.CartDAO;
import com.kh.homeArt.cart.model.vo.Cart;
import com.kh.homeArt.goods.model.vo.GoodsAtt;

@Service("cService")
public class CartServiceImpl implements CartService {
   
   @Autowired(required=false)
   private CartDAO cDAO;
   
   @Autowired
   private SqlSessionTemplate sqlSession;

   @Override
   public int insertCart(Cart cart) {
      
      int result = cDAO.insertCart(sqlSession, cart);
      
      return result;
      
   }


   @Override
   public ArrayList<Cart> selectTextList(String userId) {
      
      return cDAO.selectTextList(sqlSession, userId);
   }


   @Override
   public ArrayList<GoodsAtt> selectImgList(String memberId) {
      
      return cDAO.selectImgList(sqlSession, memberId);
   }


   @Override
   public int deleteCart(int cId) {
      
      return cDAO.deleteCart(sqlSession, cId);
   }


   @Override
   public int checkCart(int goodsId) {
      
      return cDAO.checkCart(sqlSession, goodsId);
   }
   
   

   

   

   
}