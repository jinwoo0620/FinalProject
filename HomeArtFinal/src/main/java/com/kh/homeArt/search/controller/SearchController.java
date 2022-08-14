package com.kh.homeArt.search.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.main.model.vo.BoardInfo;
import com.kh.homeArt.main.model.vo.PurchaseInfo;
import com.kh.homeArt.search.model.service.SearchService;
import com.kh.homeArt.search.model.vo.ExpertBoardInfo;


@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;

	@RequestMapping("search.se")
	public String getSearchResult(@RequestParam("title") String title, Model m) {
		System.out.println("content : " + title);
		
		ArrayList<PurchaseInfo> purchaseList = searchService.getPurchaseList(title);
		ArrayList<BoardInfo> boardList = searchService.getBoardList(title);
		ArrayList<ExpertBoardInfo> expertList = searchService.getExpertList(title);
		
		int expertListSize = expertList.size();
	      
	      for(int i=0;i<expertListSize;i++) {
	         int page = i / 4;
	         expertList.get(i).setPage(page + 1);
	      }
		
		
		
		m.addAttribute("purchaseList", purchaseList);
		m.addAttribute("boardList", boardList);
		m.addAttribute("expertList", expertList);
		
		System.out.println("purchaseList d: " + purchaseList);
		System.out.println("boardList d: " + boardList);
		System.out.println("expertList d:" + expertList);
		
		return "searchResult";
	}
}
