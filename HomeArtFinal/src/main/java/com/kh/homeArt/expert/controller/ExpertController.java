package com.kh.homeArt.expert.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.homeArt.common.Pagination;
import com.kh.homeArt.expert.model.exception.ExpertException;
import com.kh.homeArt.expert.model.service.ExpertService;
import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.expert.model.vo.PageInfo;


@Controller
public class ExpertController {
   // 컨트롤러로 등록하기 - @Controller
   
   @Autowired   // 의존성 주입을 위해 @Autowired 작성
   private ExpertService eService;   // 서비스 이릉을 eService로 지정
   
   /* 전문가 게시판 조회 */
   @RequestMapping("elist.ex")
   public ModelAndView expertList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
      
      int currentPage = 1;
      
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = eService.getListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<Expert> list = eService.getExpertBoardList(pi);
      
      if(list != null) {
         mv.addObject("list", list);
         mv.addObject("pi", pi);
         mv.setViewName("expertListView");
      } else {
         throw new ExpertException("게시글 전체 조회에 실패했습니다.");
      }
      return mv;
   }
   
   /* 전문가 게시글 작성 */
   @RequestMapping("einsertView.ex")
   public String experProfileForm() {
      return "expertProfile";
   }
   
   @RequestMapping("einsert.ex")
   public String expertInsertBoard(@ModelAttribute Expert e, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) {
//      // 매개변수로 들어온단 것 자체가 객체로 만들었단 뜻이니까 @Autowired 안해도 돼
       System.out.println(e);
       System.out.println(uploadFile);
      
      if(uploadFile != null && !uploadFile.isEmpty()) {
         String renameFileName = saveFile(uploadFile, request);
         
         e.setOriginalFileName(uploadFile.getOriginalFilename());
         e.setRenameFileName(renameFileName);
      }
       
      int result = eService.insertExpert(e);
      
      if(result > 0) {
         return "redirect:elist.ex";
      } else {
         throw new ExpertException("게시글 등록에 실패하였습니다.");
      }
   }

   private String saveFile(MultipartFile file, HttpServletRequest request) {
      String root = request.getSession().getServletContext().getRealPath("resources");
      // System.out.println(root); 알고 있는 위치로 나오는지?
      // 제대로 안 나올 경우 서버에서 publishing 체크
      String savePath = root + "\\buploadFiles";   // 어디다 저장할 것인지
      
      File folder = new File(savePath);
      if(!folder.exists()) {
         folder.mkdirs();   // 폴더 생성
      }
      
      // 이름 바꾸기 진행
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
      String originFileName = file.getOriginalFilename();
      String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + originFileName.substring(originFileName.lastIndexOf("."));
                                 // 지금 현재시간에 대해서 포맷을 진행 + 마지막 . 이후에 것들을 모두 가져오기
      
//      System.out.println(originFileName);
//      System.out.println(renameFileName);
      
      String renamePath = folder + "\\" + renameFileName;
                  // 원래있던 폴더
      try {
         file.transferTo(new File(renamePath));
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      return renameFileName;
   }
   
   
   /* 전문가 게시글 상세보기 */
   @RequestMapping("edetail.ex")
   public ModelAndView expertBoardDetail(@RequestParam("eId")int eId, @RequestParam("page") int page, ModelAndView mv){
      Expert expert = eService.selectExpert(eId);
      
      if(expert != null) {
         mv.addObject("expert", expert).addObject("page", page).setViewName("expertDetailView");
      } else {
         throw new ExpertException("게시글 상세보기에 실패하였습니다.");
      }
      return mv;
   }
   
   /* 전문가 게시글 수정 */
   @RequestMapping("eupView.ex")
   public String expertBoardUpdateForm(@ModelAttribute Expert e, @RequestParam("page") int page, Model model) {
      model.addAttribute("expert", e).addAttribute("page", page);
      return "expertUpdateForm";
   }
   
   /* 전문가 게시글 수정 */
   @RequestMapping("eupdate.ex")
   public String expertUpdateBoard(@ModelAttribute Expert e, @RequestParam("page") int page, @RequestParam("reloadFile") MultipartFile reloadFile, HttpServletRequest request, Model model) {
      
      if(reloadFile != null && !reloadFile.isEmpty()) {
         
         if(e.getRenameFileName() != null) {
            deleteFile(e.getRenameFileName(), request);
         }
         
         String renameFileName = saveFile(reloadFile, request);
         e.setOriginalFileName(reloadFile.getOriginalFilename());
         e.setRenameFileName(renameFileName);
      }
      
      int result = eService.updateExpert(e);
       
//      System.out.println(result);
      
         if(result > 0) {
            //해당글로 가고싶지? --> 글번호와 페이지 있지
            //return "redirect:edetail.ex?eId=" + e.getExpertProfileNo() + "&page=" + page;
            model.addAttribute("eId", e.getExpertProfileNo());
            model.addAttribute("page", page);
            return "redirect:edetail.ex";
            
         } else {
            throw new ExpertException("게시글 수정에 실패하였습니다.");
         }
         //return null;//지우니까 반환값 필요없구~~
   }
   
   /* 전문가 게시글 삭제 */
   public void deleteFile(String fileName, HttpServletRequest request) {
      String root = request.getSession().getServletContext().getRealPath("resources");
      String savePath = root + "\\buploadFiles";
  
      File f = new File(savePath + "\\" + fileName);//file클래스를 이용해야 다음과 같은 메소드를 활용할 수 있어
      if(f.exists()) {
         f.delete();
      }//update할거니까 여기에서 먼저 지워주면 돼!
   }
   
   /* 전문가 게시글 삭제 */
   @RequestMapping("edelete.ex")
   public String expertDeleteBoard(@RequestParam("eId") int eId, @RequestParam("renameFileName") String renameFileName, HttpServletRequest request) {
      if(!renameFileName.equals("")) {
         deleteFile(renameFileName, request);
      }
      
      int result = eService.deleteExpert(eId);
      
      if(result > 0) {
         return "redirect:elist.ex";
      } else {
         throw new ExpertException("게시글 삭제에 실패하였습니다.");
      }
   }
   
   /* 이사/입주청소 전문가 리스트 */
   @RequestMapping("eMove.ex")
   public ModelAndView MoveExpertList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
      
      int currentPage = 1;
      
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = eService.getMoveListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<Expert> list = eService.getMoveExpertBoardList(pi);
      
      if(list != null) {
         mv.addObject("list", list);
         mv.addObject("pi", pi);
         mv.setViewName("expertListView");
      } else {
         throw new ExpertException("게시글 조회에 실패했습니다.");
      }
      return mv;
   }
   
   /* 타일시공 전문가 리스트 */
   @RequestMapping("eTile.ex")
   public ModelAndView TileExpertList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
      
      int currentPage = 1;
      
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = eService.getTileListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<Expert> list = eService.getTileExpertBoardList(pi);
      
      if(list != null) {
         mv.addObject("list", list);
         mv.addObject("pi", pi);
         mv.setViewName("expertListView");
      } else {
         throw new ExpertException("게시글 조회에 실패했습니다.");
      }
      return mv;
   }
   
   /* 에어컨 설치/수리 전문가 리스트 */
   @RequestMapping("eAir.ex")
   public ModelAndView AirExpertList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
      
      int currentPage = 1;
      
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = eService.getAirListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<Expert> list = eService.getAirExpertBoardList(pi);
      
      if(list != null) {
         mv.addObject("list", list);
         mv.addObject("pi", pi);
         mv.setViewName("expertListView");
      } else {
         throw new ExpertException("게시글 조회에 실패했습니다.");
      }
      return mv;
   }
   
   /* 도배/장판 전문가 리스트 */
   @RequestMapping("eWallPaper.ex")
   public ModelAndView WallPaperExpertList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
      
      int currentPage = 1;
      
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = eService.getWallPaperListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<Expert> list = eService.getWallPaperExpertBoardList(pi);
      
      if(list != null) {
         mv.addObject("list", list);
         mv.addObject("pi", pi);
         mv.setViewName("expertListView");
      } else {
         throw new ExpertException("게시글 조회에 실패했습니다.");
      }
      return mv;
   }
   
   /* 실내 인테리어 전문가 리스트 */
   @RequestMapping("eInterior.ex")
   public ModelAndView InteriorExpertList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
      
      int currentPage = 1;
      
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = eService.getInteriorListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<Expert> list = eService.getInteriorExpertBoardList(pi);
      
      if(list != null) {
         mv.addObject("list", list);
         mv.addObject("pi", pi);
         mv.setViewName("expertListView");
      } else {
         throw new ExpertException("게시글 조회에 실패했습니다.");
      }
      return mv;
   }
   
}