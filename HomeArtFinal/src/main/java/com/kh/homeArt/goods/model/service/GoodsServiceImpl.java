package com.kh.homeArt.goods.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.homeArt.goods.model.dao.GoodsDAO;
import com.kh.homeArt.goods.model.vo.Goods;
import com.kh.homeArt.goods.model.vo.GoodsAtt;

@Service("gService")
public class GoodsServiceImpl implements GoodsService{

   @Autowired 
   GoodsDAO gDAO;
   
   @Autowired
   private SqlSessionTemplate sqlSession;

   @Override
   public int insertGoodsText(Goods g) {
      
      return gDAO.insertGoodsText(sqlSession, g);
   }

   

   @Override
   public int insertGoodsImage(ArrayList<GoodsAtt> list) {
      
      return gDAO.insertGoodsImage(sqlSession, list);
   }



   @Override
   public ArrayList<Goods> getGoodsList() {
      
      return gDAO.getGoodsList(sqlSession);
   }



   @Override
   public ArrayList<GoodsAtt> getGoodsList1() {
      
      return gDAO.getGoodsList1(sqlSession);
   }



   @Override
   public Goods selectGoodsText(int gId) {
      
      return gDAO.selectGoodsText(sqlSession, gId);
   }



   @Override
   public ArrayList<GoodsAtt> selectGoodsImage(int gId) {
      
      return gDAO.selectGoodsImage(sqlSession, gId);
   }



   @Override
   public int updateGoodsText(Goods g) {
      
      
      
      
      int result = gDAO.updateGoodsText(sqlSession, g);
      System.out.println("result(serviceImpl)" + result);
      return result;
   }



   @Override
   public int updateGoodsImage(ArrayList<GoodsAtt> list) {
      
      return gDAO.updateGoodsImage(sqlSession, list);
   }



   @Override
   public int deleteGoodsText(int gId) {
      System.out.println("serviceimpltext" + gId);
      return gDAO.deleteGoodsText(sqlSession, gId);
   }



//   @Override
//   public int deleteGoodsImage(int gId) {
//      
//      System.out.println("serviceimplimage" + gId);
//      return gDAO.deleteGoodsImage(sqlSession, gId);
//   }


   
}