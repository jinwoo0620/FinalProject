package com.kh.homeArt.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.homeArt.main.model.service.HomeService;
import com.kh.homeArt.main.model.vo.BoardInfo;
import com.kh.homeArt.main.model.vo.PurchaseInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   
   
   @Autowired
   HomeService homeService;
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/home.do", method = RequestMethod.GET)
   public String home(Model model) {
      //게시판 최신 10개 가져오기
      ArrayList<PurchaseInfo> purchaseList = homeService.getCurrentList(2);
      model.addAttribute("purchaseList", purchaseList);
      
      int rowCount = homeService.getRowCount();
      ArrayList<BoardInfo> boardList = homeService.getBoardList(rowCount);
      model.addAttribute("boardList", boardList);
      System.out.println("boardList : " + boardList);
      return "home";
   }
   

}