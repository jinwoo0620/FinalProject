package com.kh.homeArt.goods.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.goods.model.vo.Goods;
import com.kh.homeArt.goods.model.vo.GoodsAtt;

@Repository("gDAO")
public class GoodsDAO {

   public int insertGoodsText(SqlSessionTemplate sqlSession, Goods g) {
      
      return sqlSession.insert("goodsMapper.insertGoodsText", g);
   }

   

   public int insertGoodsImage(SqlSessionTemplate sqlSession, ArrayList<GoodsAtt> list) {
      
      int result = 0;
      
      for(int i= 0; i<list.size(); i++) {
         result += sqlSession.insert("goodsMapper.insertGoodsImage", list.get(i));
         //result값이 int니까 +=
      }
      
      return result;
   }



   public ArrayList<Goods> getGoodsList(SqlSessionTemplate sqlSession) {
      
      return (ArrayList)sqlSession.selectList("goodsMapper.getGoodsList");
   }



   public ArrayList<GoodsAtt> getGoodsList1(SqlSessionTemplate sqlSession) {
      
      return (ArrayList)sqlSession.selectList("goodsMapper.getGoodsList1");
   }



   public Goods selectGoodsText(SqlSessionTemplate sqlSession, int gId) {
      
      return sqlSession.selectOne("goodsMapper.selectGoodsText", gId);
   }



   public ArrayList<GoodsAtt> selectGoodsImage(SqlSessionTemplate sqlSession, int gId) {
      
      return (ArrayList)sqlSession.selectList("goodsMapper.selectGoodsImage", gId);
   }



   public int updateGoodsText(SqlSessionTemplate sqlSession, Goods g) {
      
      
      
      int result = sqlSession.update("goodsMapper.updateGoodsText", g);
      
      //System.out.println("result(dao)" + result);
      //System.out.println("g(dao)" + g);
      return result;
   }



   public int updateGoodsImage(SqlSessionTemplate sqlSession, ArrayList<GoodsAtt> list) {
      
      int result = 0;
      
      for(int i= 0; i<list.size(); i++) {
         result += sqlSession.insert("goodsMapper.updateGoodsImage", list.get(i));
      }
      
      //System.out.println("result(updategoodsImg)(dao)" + result);
      //System.out.println("list(dao)" + list);
      
      return result;
      
   }



   public int deleteGoodsText(SqlSessionTemplate sqlSession, int gId) {
      System.out.println("daotext" + gId);
      return sqlSession.delete("goodsMapper.deleteGoodsText", gId);
   }



//   public int deleteGoodsImage(SqlSessionTemplate sqlSession, int gId) {
//      
//      System.out.println("daoimage" + gId);
//      return sqlSession.delete("goodsMapper.deleteGoodsImage", gId);
//   }

   
}