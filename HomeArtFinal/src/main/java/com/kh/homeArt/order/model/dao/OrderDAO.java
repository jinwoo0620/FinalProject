package com.kh.homeArt.order.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.order.model.service.OrderService;
import com.kh.homeArt.order.model.vo.OrderPageItem;

@Repository
public class OrderDAO {

   public ArrayList<OrderPageItem> getListOrder(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
      
      return (ArrayList)sqlSession.selectList("orderMapper.getListOrder", map);
   }
   
   

   
}