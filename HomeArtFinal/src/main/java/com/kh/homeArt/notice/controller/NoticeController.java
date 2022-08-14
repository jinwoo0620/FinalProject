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
import com.kh.homeArt.notice.model.service.NoticeService;
import com.kh.homeArt.notice.model.vo.Notice;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Pagination;
import com.kh.homeArt.notice.model.vo.Reply;
import com.kh.homeArt.member.model.vo.Member;


@Controller
public class NoticeController {
	
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("nlist.no")
	public ModelAndView noticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		
		int currentPage = 1;
		
		if(page != null) {
		
			currentPage = page; 	
		}
		
		int listCount = nService.getListCount();
		
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Notice> list = nService.getNoticeList(pi); 
	
		
		if(list != null) {
			
			
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("noticeListView");
		} else {
			throw new NoticeException("게시글 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("ninsertView.no")
	public String noticeInsertForm() {
		return"noticeInsertForm";
	}
	
	@RequestMapping("ninsert.no")
	public String insertnotice(@ModelAttribute Notice n, HttpServletRequest request) {
	
		
		int result = nService.insertNotice(n);
		
		
		
		if(result > 0) {
			
							
			return "redirect:nlist.no";
		}else {
			throw new NoticeException("게시글 등록에 실패하였습니다.");
		}
		
	}

	












	@RequestMapping("ndetail.no")
	public ModelAndView noticeDetail(@RequestParam("nId") int nId, @RequestParam("page") int page, ModelAndView mv) {
		
		Notice notice = nService.selectNotice(nId);
		
		
		if(notice != null) {
			mv.addObject("notice", notice).addObject("page", page).setViewName("noticeDetailView");
			
		} else {
			throw new NoticeException("공지사항 상세보기에 실패하였습니다.");
		}
			return mv;
		
	}
	
	@RequestMapping("nupView.no")
	public String noticeUpdateForm(@ModelAttribute Notice n, @RequestParam("page") int page, Model model) {
		model.addAttribute("notice", n).addAttribute("page", page);
		return "noticeUpdateForm";
		
	}
	
	@RequestMapping("nupdate.no")
	public String updatenotice(@ModelAttribute Notice n, @RequestParam("page") int page, 
							  HttpServletRequest request, Model model) {
		
		
		int result = nService.updateNotice(n);
		
		
		
		if(result > 0) {
			
			
			model.addAttribute("nId", n.getNoticeNo());
			model.addAttribute("page", page);
			return "redirect:ndetail.no";
			
		} else {
			throw new NoticeException("게시글 수정에 실패하였습니다.");
		}
		
		
		
	}
	

	@RequestMapping("ndelete.no")
	public String deletenotice(@RequestParam("nId") int nId, HttpServletRequest request) {
		
		
		
		int result = nService.deleteNotice(nId);
		
		if(result > 0) {
			return "redirect:nlist.no";
		} else {
			throw new NoticeException("게시글 삭제에 실패하였습니다.");
		}
		
		
	}
	
	@RequestMapping("addReply.no")
	@ResponseBody
	public String addReply(@ModelAttribute Reply r, HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getId();
		r.setMemberId(id);
		
		int result = nService.insertReply(r);
		
		
		if(result > 0){
			return "success";
		} else {
			throw new NoticeException("댓글 등록에 실패하였습니다.");
		}
		
		
	}
	
	
	
	
	@RequestMapping(value = "rList.no")
	public void getReplyList(@RequestParam("nId") int nId, HttpServletResponse response) {
		ArrayList<Reply> list = nService.selectReplyList(nId);
	
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
