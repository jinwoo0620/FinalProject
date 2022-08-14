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
import com.kh.homeArt.notice.model.service.NoticeService4;
import com.kh.homeArt.notice.model.vo.Notice4;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Pagination;
import com.kh.homeArt.notice.model.vo.Reply4;
import com.kh.homeArt.member.model.vo.Member;


@Controller
public class NoticeController4 {
	
	
	@Autowired
	private NoticeService4 nService4;
	
	@RequestMapping("nlist4.no")
	public ModelAndView noticeList4(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		
		int currentPage = 1;
		
		if(page != null) {
		
			currentPage = page; 	
		}
		
		int listCount = nService4.getListCount4();
		
		
		
	
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Notice4> list4 = nService4.getNoticeList4(pi); 
	
		
		if(list4 != null) {
			
			
			mv.addObject("list4", list4);
			mv.addObject("pi", pi);
			mv.setViewName("noticeListView4");
		} else {
			throw new NoticeException("게시글 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("ninsertView4.no")
	public String noticeInsertForm4() {
		return"noticeInsertForm4";
	}
	
	@RequestMapping("ninsert4.no")
	public String insertnotice4(@ModelAttribute Notice4 n, HttpServletRequest request) {
	
		
		int result = nService4.insertNotice4(n);
		
		
		
		if(result > 0) {
			return "redirect:nlist4.no";
		}else {
			throw new NoticeException("게시글 등록에 실패하였습니다.");
		}
		
	}

	
	@RequestMapping("ndetail4.no")
	public ModelAndView noticeDetail4(@RequestParam("nId") int nId, @RequestParam("page") int page, ModelAndView mv) {
		
		Notice4 notice4 = nService4.selectNotice4(nId);
		
		
		if(notice4 != null) {
			mv.addObject("notice4", notice4).addObject("page", page).setViewName("noticeDetailView4");
			
		} else {
			throw new NoticeException("공지사항 상세보기에 실패하였습니다.");
		}
			return mv;
		
	}
	
	@RequestMapping("nupView4.no")
	public String noticeUpdateForm4(@ModelAttribute Notice4 n, @RequestParam("page") int page, Model model) {
		model.addAttribute("notice4", n).addAttribute("page", page);
		return "noticeUpdateForm4";
		
	}
	
	@RequestMapping("nupdate4.no")
	public String updatenotice4(@ModelAttribute Notice4 n, @RequestParam("page") int page, 
							  HttpServletRequest request, Model model) {
		
		
		int result = nService4.updateNotice4(n);
		
		
		
		if(result > 0) {
			
			
			model.addAttribute("nId", n.getNoticeNo4());
			model.addAttribute("page", page);
			return "redirect:ndetail4.no";
			
		} else {
			throw new NoticeException("게시글 수정에 실패하였습니다.");
		}
		
		
		
	}
	

	@RequestMapping("ndelete4.no")
	public String deletenotice4(@RequestParam("nId") int nId, HttpServletRequest request) {
		
		
		
		int result = nService4.deleteNotice4(nId);
		
		if(result > 0) {
			return "redirect:nlist4.no";
		} else {
			throw new NoticeException("게시글 삭제에 실패하였습니다.");
		}
		
		
	}
	
	@RequestMapping("addReply4.no")
	@ResponseBody
	public String addReply4(@ModelAttribute Reply4 r, HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getId();
		r.setMemberId4(id);
		
		int result = nService4.insertReply4(r);
		
		
		if(result > 0){
			return "success";
		} else {
			throw new NoticeException("댓글 등록에 실패하였습니다.");
		}
		
		
	}
	
	
	
	
	@RequestMapping(value = "rList4.no")
	public void getReplyList4(@RequestParam("nId") int nId, HttpServletResponse response) {
		ArrayList<Reply4> list4 = nService4.selectReplyList4(nId);
	
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(list4, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
