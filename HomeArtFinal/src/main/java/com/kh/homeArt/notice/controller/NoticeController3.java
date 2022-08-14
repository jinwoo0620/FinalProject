package com.kh.homeArt.notice.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.homeArt.notice.model.exception.NoticeException;
import com.kh.homeArt.notice.model.service.NoticeService3;
import com.kh.homeArt.notice.model.vo.Notice3;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Pagination;
import com.kh.homeArt.notice.model.vo.Reply3;
import com.kh.homeArt.member.model.vo.Member;


@Controller
public class NoticeController3 {
	
	
	@Autowired
	private NoticeService3 nService3;
	
	@RequestMapping("nlist3.no")
	public ModelAndView noticeList3(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		
		int currentPage = 1;
		
		if(page != null) {
		
			currentPage = page; 	
		}
		
		int listCount = nService3.getListCount3();
		
		
		
	
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Notice3> list3 = nService3.getNoticeList3(pi); 
	
		
		if(list3 != null) {
			
			
			mv.addObject("list3", list3);
			mv.addObject("pi", pi);
			mv.setViewName("noticeListView3");
		} else {
			throw new NoticeException("게시글 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("ninsertView3.no")
	public String noticeInsertForm3() {
		return"noticeInsertForm3";
	}
	
	@RequestMapping("ninsert3.no")
	public String insertnotice3(@ModelAttribute Notice3 n, HttpServletRequest request) {
	
		
		int result = nService3.insertNotice3(n);
		
		
		
		if(result > 0) {
			return "redirect:nlist3.no";
		}else {
			throw new NoticeException("게시글 등록에 실패하였습니다.");
		}
		
	}

	
	@RequestMapping("ndetail3.no")
	public ModelAndView noticeDetail3(@RequestParam("nId") int nId, @RequestParam("page") int page, ModelAndView mv) {
		
		Notice3 notice3 = nService3.selectNotice3(nId);
		
		
		if(notice3 != null) {
			mv.addObject("notice3", notice3).addObject("page", page).setViewName("noticeDetailView3");
			
		} else {
			throw new NoticeException("공지사항 상세보기에 실패하였습니다.");
		}
			return mv;
		
	}
	
	@RequestMapping("nupView3.no")
	public String noticeUpdateForm3(@ModelAttribute Notice3 n, @RequestParam("page") int page, Model model) {
		model.addAttribute("notice3", n).addAttribute("page", page);
		return "noticeUpdateForm3";
		
	}
	
	@RequestMapping("nupdate3.no")
	public String updatenotice3(@ModelAttribute Notice3 n, @RequestParam("page") int page, 
							  HttpServletRequest request, Model model) {
		
		
		int result = nService3.updateNotice3(n);
		
		
		
		if(result > 0) {
			
			
			model.addAttribute("nId", n.getNoticeNo3());
			model.addAttribute("page", page);
			return "redirect:ndetail3.no";
			
		} else {
			throw new NoticeException("게시글 수정에 실패하였습니다.");
		}
		
		
		
	}
	

	@RequestMapping("ndelete3.no")
	public String deletenotice3(@RequestParam("nId") int nId, HttpServletRequest request) {
		
		
		
		int result = nService3.deleteNotice3(nId);
		
		if(result > 0) {
			return "redirect:nlist3.no";
		} else {
			throw new NoticeException("게시글 삭제에 실패하였습니다.");
		}
		
		
	}
	
	@RequestMapping("addReply3.no")
	@ResponseBody
	public String addReply3(@ModelAttribute Reply3 r, HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getId();
		r.setMemberId3(id);
		
		int result = nService3.insertReply3(r);
		
		
		if(result > 0){
			return "success";
		} else {
			throw new NoticeException("댓글 등록에 실패하였습니다.");
		}
		
		
	}
	
	
	
	
	@RequestMapping(value = "rList3.no")
	public void getReplyList3(@RequestParam("nId") int nId, HttpServletResponse response) {
		ArrayList<Reply3> list3 = nService3.selectReplyList3(nId);
	
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(list3, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
