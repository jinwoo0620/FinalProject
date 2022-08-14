package com.kh.homeArt.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.homeArt.order.model.dao.OrderDAO;
import com.kh.homeArt.order.model.vo.OrderPageItem;

@Service("oService")
public class OrderServiceImpl implements OrderService{

   @Autowired
   private OrderDAO oDAO;
   
   @Autowired
   private SqlSessionTemplate sqlSession;

   @Override
   public ArrayList<OrderPageItem> getListOrder(HashMap<String, Object> map) {
      
      return oDAO.getListOrder(sqlSession, map);
   }
}