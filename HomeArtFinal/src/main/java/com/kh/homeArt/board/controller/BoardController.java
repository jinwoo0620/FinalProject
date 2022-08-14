package com.kh.homeArt.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.homeArt.board.model.exception.BoardException;
import com.kh.homeArt.board.model.service.BoardService;
import com.kh.homeArt.board.model.vo.Att;
import com.kh.homeArt.board.model.vo.Board;
import com.kh.homeArt.board.model.vo.Likes;
import com.kh.homeArt.board.model.vo.Reply;
import com.kh.homeArt.member.model.vo.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping("communityList.bo")
	public ModelAndView communityList(ModelAndView mv) {
		
		ArrayList bList = bService.getCommunityList();
		ArrayList iList = bService.getImageList();
		if(bList != null && iList != null) {
			mv.addObject("bList", bList);
			mv.addObject("iList", iList);
			mv.setViewName("communityList");
		} else {
			throw new BoardException("커뮤니티 게시판 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("communityDetail.bo")
	public ModelAndView communityDetail(@RequestParam("bId") String bId, ModelAndView mv) {
		Board board = bService.selectCommunity(bId);
		ArrayList<Att> att = bService.selectImages(bId);
		if(board != null && att != null) {
			mv.addObject("board", board).addObject("att", att).setViewName("communityDetail");
		} else {
			throw new BoardException("게시글 상세보기에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("communityInsertForm.bo")
	public String communityInsertForm() {
		return "communityInsertForm";
	}
	
	@RequestMapping("communityInsert.bo")
	public String communityInsert(@ModelAttribute Board b, 
									@RequestParam("uploadFile1") MultipartFile uploadFile1,
									@RequestParam("uploadFile2") MultipartFile uploadFile2,
									HttpServletRequest request) {
		
		// 게시글 내용 BOARD테이블에 등록
		int resultB = bService.insertCommunity(b);
		
		// 파일 정보 ATT테이블에 등록
		Att att1 = new Att();
		ArrayList<Att> list = new ArrayList<Att>();
		
		if(uploadFile1 != null && !uploadFile1.isEmpty()) {
			String changeName = saveFile(uploadFile1, request);
			
			att1.setOriginName(uploadFile1.getOriginalFilename());
			att1.setChangeName(changeName);
			att1.setFileLevel(0);
			
			list.add(att1);
		} 
		Att att2 = new Att();
		
		if(uploadFile2 != null && !uploadFile2.isEmpty()) {
			String changeName = saveFile(uploadFile2, request);
			
			att2.setOriginName(uploadFile2.getOriginalFilename());
			att2.setChangeName(changeName);
			att2.setFileLevel(1);
			
			list.add(att2);
		}
		
		int resultI = bService.insertImages(list);
		
		if(resultB+resultI > 2) {
			return "redirect:communityList.bo";
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다.");
		}
	}
	
	private String saveFile(MultipartFile uploadFile1, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		if(! folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originName = uploadFile1.getOriginalFilename();
		String changeName = sdf.format(new Date(System.currentTimeMillis())) + originName.substring(originName.lastIndexOf("."));
		
		String filePath = folder + "\\" + changeName;
		try {
			uploadFile1.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	@RequestMapping("communityUpdateForm.bo")
	public String communityUpdateForm(@ModelAttribute Board b, @RequestParam(value="uploadFile1", required=false) String uploadFile1,
								  @RequestParam(value="uploadFile2", required=false) String uploadFile2, Model model, 
								  @RequestParam(value="fileId1", required=false) Integer fileId1, 
								  @RequestParam(value="fileId2", required=false) Integer fileId2) {
		
		model.addAttribute("b", b).addAttribute("uploadFile1", uploadFile1).addAttribute("uploadFile2", uploadFile2).addAttribute("fileId1", fileId1).addAttribute("fileId2", fileId2);
		
		return "communityUpdateForm";
	}
	
	@RequestMapping("communityUpdate.bo")
	public String updateCommunity(@ModelAttribute Board b, @RequestParam("uploadFile1") MultipartFile uploadFile1, 
													   @RequestParam("uploadFile2") MultipartFile uploadFile2, 
													   HttpServletRequest request,
													   Model model, HttpSession session,
													   @RequestParam(value="fileId1", required=false) Integer fileId1,
													   @RequestParam(value="fileId2", required=false) Integer fileId2) {
		int result1 = bService.updateCommunity(b);
		
		Att att1 = new Att();
		ArrayList<Att> list = new ArrayList<Att>();
		
		if(uploadFile1 != null && !uploadFile1.isEmpty()) {
			deleteFile(att1.getChangeName(), request);
			
			String changeName = saveFile(uploadFile1, request);
			att1.setFileId(fileId1);
			att1.setOriginName(uploadFile1.getOriginalFilename());
			att1.setChangeName(changeName);
			att1.setFileLevel(0);
			att1.setBoardNo(b.getBoardNo());
			
			list.add(att1);
			
		}
		
		Att att2 = new Att();
		if(uploadFile2 != null && !uploadFile2.isEmpty()) {
			deleteFile(att2.getChangeName(), request);
			
			String changeName = saveFile(uploadFile2, request);
			att2.setFileId(fileId2);
			att2.setOriginName(uploadFile2.getOriginalFilename());
			att2.setChangeName(changeName);
			att2.setFileLevel(1);
			att2.setBoardNo(b.getBoardNo());
			
			list.add(att2);
			
		}
		
		int result2 = bService.updateImages(list);
		
		if(result1 + result2 > 2) {
			return "redirect:communityDetail.bo?bId=" + b.getBoardNo();
		} else {
			throw new BoardException("게시글 수정에 실패하였습니다.");
		}
		
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
		
	}
	
	@RequestMapping("communityDelete.bo")
	public String deleteComunity(@RequestParam("bId") int bId) {
		
		int result = bService.deleteCommunity(bId);
		
		if(result > 0) {
			return "redirect:communityList.bo";
		} else {
			throw new BoardException("게시글 삭제에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("replyCount.bo")
	public int replyCount(@RequestParam("bId") int bId, @ModelAttribute Reply r, HttpSession session) {
		int result = bService.replyCount(bId);
		
		return result;
	}
	
	@RequestMapping("insertReply.bo")
	@ResponseBody
	public String insertReply(@ModelAttribute Reply r, HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getId();
		r.setMemberId(id);
		
		int result = bService.insertReply(r);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BoardException("댓글 등록에 실패했습니다.");
		}
	}
	 
	@RequestMapping("replyList.bo")
	public void replyList(@RequestParam("bId") int bId, HttpServletResponse response) {
		ArrayList<Reply> list = bService.selectReplyList(bId);
		
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
	
	@RequestMapping("deleteReply.bo")
	public String deleteReply(@RequestParam("rId") int rId, HttpServletRequest request) {
		int result = bService.deleteReply(rId);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BoardException("댓글 삭제에 실패했습니다.");
		}
	}
	
	@RequestMapping("likesCount.bo")
	public int likesCount(@RequestParam("bId") int bId) {
		int result = bService.likesCount(bId);
		
		return result;
	}
	
//	@RequestMapping("likesYN.bo")
//	public String likesYN(@ModelAttribute Likes l) {
//		System.out.println("아이디 : " + l.getLikedId());
//		System.out.println("글번호 : " + l.getBoardNo());
//		
//		int result = bService.likesYN(l);
//		String yn = null;
//		
//		if(result > 0) {
//			yn = "y";
//		} else {
//			yn = "n";
//		}
//		System.out.println(result);
//		
//		return yn;
//	}
	
	@RequestMapping("likesCheck.bo")
	@ResponseBody
	public String likesCheck(@ModelAttribute Likes l, @RequestParam("bId") int bId,
			HttpSession session, HttpServletRequest request) {
		String id = ((Member)session.getAttribute("loginUser")).getId();
		l.setLikedId(id);
		l.setBoardNo(bId);
		
		int result = bService.likesCheck(l);
		
		int count = likesCount(bId);
		
		return count + "";
	}
}
