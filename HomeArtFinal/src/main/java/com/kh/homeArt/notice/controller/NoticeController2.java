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
import com.kh.homeArt.notice.model.service.NoticeService2;
import com.kh.homeArt.notice.model.vo.Notice2;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Pagination;
import com.kh.homeArt.notice.model.vo.Reply2;
import com.kh.homeArt.member.model.vo.Member;


@Controller
public class NoticeController2 {
	
	
	@Autowired
	private NoticeService2 nService2;
	
	@RequestMapping("nlist2.no")
	public ModelAndView noticeList2(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		
		int currentPage = 1;
		
		if(page != null) {
		
			currentPage = page; 	
		}
		
		int listCount = nService2.getListCount2();
		
		
		
	
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Notice2> list2 = nService2.getNoticeList2(pi); 
	
		
		if(list2 != null) {
			
			
			mv.addObject("list2", list2);
			mv.addObject("pi", pi);
			mv.setViewName("noticeListView2");
		} else {
			throw new NoticeException("게시글 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("ninsertView2.no")
	public String noticeInsertForm2() {
		return"noticeInsertForm2";
	}
	
	@RequestMapping("ninsert2.no")
	public String insertnotice2(@ModelAttribute Notice2 n, HttpServletRequest request) {
	
		
		int result = nService2.insertNotice2(n);
		
		
		
		if(result > 0) {
			return "redirect:nlist2.no";
		}else {
			throw new NoticeException("게시글 등록에 실패하였습니다.");
		}
		
	}

	
	@RequestMapping("ndetail2.no")
	public ModelAndView noticeDetail2(@RequestParam("nId") int nId, @RequestParam("page") int page, ModelAndView mv) {
		
		Notice2 notice2 = nService2.selectNotice2(nId);
		
		
		if(notice2 != null) {
			mv.addObject("notice2", notice2).addObject("page", page).setViewName("noticeDetailView2");
			
		} else {
			throw new NoticeException("공지사항 상세보기에 실패하였습니다.");
		}
			return mv;
		
	}
	
	@RequestMapping("nupView2.no")
	public String noticeUpdateForm2(@ModelAttribute Notice2 n, @RequestParam("page") int page, Model model) {
		model.addAttribute("notice2", n).addAttribute("page", page);
		return "noticeUpdateForm2";
		
	}
	
	@RequestMapping("nupdate2.no")
	public String updatenotice2(@ModelAttribute Notice2 n, @RequestParam("page") int page, 
							  HttpServletRequest request, Model model) {
		
		
		int result = nService2.updateNotice2(n);
		
		
		
		if(result > 0) {
			
			
			model.addAttribute("nId", n.getNoticeNo2());
			model.addAttribute("page", page);
			return "redirect:ndetail2.no";
			
		} else {
			throw new NoticeException("게시글 수정에 실패하였습니다.");
		}
		
		
		
	}
	

	@RequestMapping("ndelete2.no")
	public String deletenotice2(@RequestParam("nId") int nId, HttpServletRequest request) {
		
		
		
		int result = nService2.deleteNotice2(nId);
		
		if(result > 0) {
			return "redirect:nlist2.no";
		} else {
			throw new NoticeException("게시글 삭제에 실패하였습니다.");
		}
		
		
	}
	
	@RequestMapping("addReply2.no")
	@ResponseBody
	public String addReply2(@ModelAttribute Reply2 r, HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getId();
		r.setMemberId2(id);
		
		int result = nService2.insertReply2(r);
		
		
		if(result > 0){
			return "success";
		} else {
			throw new NoticeException("댓글 등록에 실패하였습니다.");
		}
		
		
	}
	
	
	
	
	@RequestMapping(value = "rList2.no")
	public void getReplyList2(@RequestParam("nId") int nId, HttpServletResponse response) {
		ArrayList<Reply2> list2 = nService2.selectReplyList2(nId);
	
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(list2, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
