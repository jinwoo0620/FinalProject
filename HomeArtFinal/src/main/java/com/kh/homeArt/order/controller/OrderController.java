package com.kh.homeArt.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.homeArt.order.model.exception.OrderException;
import com.kh.homeArt.order.model.service.OrderService;
import com.kh.homeArt.order.model.vo.Order;
import com.kh.homeArt.order.model.vo.OrderPageItem;

@Controller
public class OrderController {
   
   @Autowired
   private OrderService oService;

   
   @RequestMapping("list.od")
   public ModelAndView orderList(@RequestParam(value="cId") int[] cIdArr, @RequestParam(value="totalPrice") String totalPrice, ModelAndView mv) {
      
      for(int i =0; i < cIdArr.length; i++ ) {
         System.out.println("cIdArr : " + cIdArr[i]);
      }
      
      HashMap<String, Object> map = new HashMap<>();
      map.put("cId", cIdArr);
      System.out.println("totalPrice1 : " + totalPrice );
      
      ArrayList<OrderPageItem> list = oService.getListOrder(map);
      System.out.println("list: " + list);
      
      int totalPrice1 = Integer.parseInt(totalPrice);
      
      
      if(list != null) {
         mv.addObject("list", list);
         mv.addObject("cIdArr", cIdArr);
         mv.addObject("totalPrice", totalPrice1);
         mv.setViewName("order");
      } else {
         throw new OrderException("주문 입력 페이지 조회에 실패했습니다.");
      }
      
      return mv;
   }
   
   
   
//   @RequestMapping(value = "order.od")
//   @ResponseBody
//   public int pay(@RequestBody Order order, @RequestParam ("imp_uid") int imp_uid ) {
//      System.out.println("imp_uid");
//      
//      return null;
//   }
   
}