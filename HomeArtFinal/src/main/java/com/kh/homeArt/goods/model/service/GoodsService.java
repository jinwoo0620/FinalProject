package com.kh.homeArt.goods.model.service;

import java.util.ArrayList;

import com.kh.homeArt.goods.model.vo.Goods;
import com.kh.homeArt.goods.model.vo.GoodsAtt;

public interface GoodsService {

   int insertGoodsText(Goods g);


   int insertGoodsImage(ArrayList<GoodsAtt> list);


   ArrayList<Goods> getGoodsList();


   ArrayList<GoodsAtt> getGoodsList1();


   Goods selectGoodsText(int gId);


   ArrayList<GoodsAtt> selectGoodsImage(int gId);


   int updateGoodsText(Goods g);


   int updateGoodsImage(ArrayList<GoodsAtt> list);


   int deleteGoodsText(int gId);


   //int deleteGoodsImage(int gId);

   

   

}