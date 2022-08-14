package com.kh.homeArt.cart.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.cart.model.vo.Cart;
import com.kh.homeArt.goods.model.vo.Goods;
import com.kh.homeArt.goods.model.vo.GoodsAtt;




@Repository
public class CartDAO {

   public int insertCart(SqlSessionTemplate sqlSession, Cart cart) {
      
      return sqlSession.insert("cartMapper.insertCart", cart);
   }


   public ArrayList<Cart> selectTextList(SqlSessionTemplate sqlSession, String userId) {
      
      ArrayList<Cart> result =  (ArrayList)sqlSession.selectList("cartMapper.selectTextList", userId);
      
      //System.out.println("result1 : " + result);
      
      return result;
   }


   public ArrayList<GoodsAtt> selectImgList(SqlSessionTemplate sqlSession, String memberId) {
      
      ArrayList<GoodsAtt> result = (ArrayList)sqlSession.selectList("cartMapper.selectImgList", memberId);
   
      // System.out.println("result2 : " + result);
       
       return result;
   }


   public int deleteCart(SqlSessionTemplate sqlSession, int cId) {
      
      return sqlSession.delete("cartMapper.deleteCart", cId);
   }


   public int checkCart(SqlSessionTemplate sqlSession, int goodsId) {
      
      return sqlSession.selectOne("cartMapper.checkCart", goodsId);
   }
   
   

}