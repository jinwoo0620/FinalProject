package com.kh.homeArt.cart.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.kh.homeArt.cart.model.exception.CartException;
import com.kh.homeArt.cart.model.service.CartService;
import com.kh.homeArt.cart.model.vo.Cart;
import com.kh.homeArt.goods.model.service.GoodsService;
import com.kh.homeArt.goods.model.vo.GoodsAtt;
import com.kh.homeArt.member.model.vo.Member;

@Controller
public class CartController {
   
   @Autowired
   private CartService cService;
   
   @Autowired
   private GoodsService gService;
   
   @RequestMapping("insert.ca")
   public String insertCart(Cart cart, HttpSession session, Model model) {
      
      //System.out.println(cart);
      
      
      //@ModelAttribute는 submit된 form의 내용을 저장해서 전달받거나, 다시 뷰로 넘겨서 출력하기 위해 사용되는 오브젝트
      
      //로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
      String userId = ((Member)session.getAttribute("loginUser")).getId();
      //System.out.println(userId);
      
      
      
      if(userId == null) {
               
               return "redirect:loginView.me";
            
      } else {
         
         cart.setMemberId(userId);
         
         int result = cService.insertCart(cart);
         
         
            if(result>0) {
               return "redirect:list.ca";
            } else {
               throw new CartException("장바구니 조회에 실패하였습니다.");
            }
         
      }
      
      
   }
   
   @RequestMapping("list.ca")
   public ModelAndView cartListPage(@ModelAttribute Cart cart, ModelAndView mv, HttpSession session) {
      
      String userId = ((Member)session.getAttribute("loginUser")).getId();
      
      Cart cartVO = new Cart();
      //cartVO.setMemberId(userId);
      //System.out.println("cartVO : " + cartVO);
      
      
      //장바구니 텍스트 불러오기
      ArrayList<Cart> cartTextList = cService.selectTextList(userId);
      
      ArrayList<GoodsAtt> cartImgList = null;
      
      for(int i = 0; i< cartTextList.size(); i++) {
          cartImgList = cService.selectImgList(cartTextList.get(i).getMemberId());
          //System.out.println(cartTextList.get(i).getMemberId());
      }
      
      
      
      //System.out.println("textList : " + cartTextList);
      //System.out.println("imgList : " + cartImgList);
      //System.out.println("getGoodsId" + cart.getGoodsId());
      
      
      
      if(cartTextList != null && cartImgList != null) {
         mv.addObject("textList", cartTextList);
         mv.addObject("imgList", cartImgList);
         mv.setViewName("cart");
      } else {
         
         throw new CartException("장바구니 목록 불러오기에 실패했습니다.");
      }
      
      
      return mv;
   }
   
   
   @RequestMapping("delete.ca")
   public String deleteBoard(@RequestParam("cId") int cId) {
      
      
      
      System.out.println("cId : " +  cId);
      
      int result = cService.deleteCart(cId);
      
      
      if(result > 0) {
         return "redirect:list.ca";
      } else {
         throw new CartException("장바구니 삭제에 실패하였습니다.");
      }
      
   }
   
   
   @RequestMapping("dulplcheck.ca")
   public void checkCart(@RequestParam("goodsId") int goodsId, HttpServletResponse response) {
      
      int result = cService.checkCart(goodsId);
      
      try {
         
         PrintWriter pw = response.getWriter();
         pw.print(result);
         
      } catch (IOException e) {
         
         e.printStackTrace();
      }
   }
   
}

   
   
