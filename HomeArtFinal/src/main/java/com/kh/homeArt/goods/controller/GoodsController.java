package com.kh.homeArt.goods.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.homeArt.goods.model.exception.GoodsException;
import com.kh.homeArt.goods.model.service.GoodsService;
import com.kh.homeArt.goods.model.vo.Goods;
import com.kh.homeArt.goods.model.vo.GoodsAtt;
import com.kh.homeArt.member.model.vo.Member;

@Controller
public class GoodsController {

   @Autowired
   private GoodsService gService;
   
   @RequestMapping("glist.go")
   public ModelAndView goodsList(ModelAndView mv) {
      
      ArrayList<Goods> list = gService.getGoodsList();
      ArrayList<GoodsAtt> list1 = gService.getGoodsList1();
      
      //System.out.println(list);
      //System.out.println(list1);
      
      if(list != null && list1 != null) {
      
         mv.addObject("list", list);
         mv.addObject("list1", list1);
         mv.setViewName("goodsList");
         
      } else {
         throw new GoodsException("게시글 조회에 실패했습니다.");
      }
      
      return mv;
   }
   
   
   @RequestMapping("ginsertView.go")
   public String goodsInsertForm() {
      return "goodsRegistration";
   }
   
   @RequestMapping("ginsert.go")
   public String insertGoods(@ModelAttribute Goods g,
                       @RequestParam("uploadFiles1") MultipartFile uploadFile1,
                       @RequestParam("uploadFiles2") MultipartFile uploadFile2,
                       HttpServletRequest request) {
      
      
      //vo 변수명(setter 이름) = name값 일치 !!!!!!!!
      //request
      //name값 3개 다르게 함
      //thumbnail, detail1, detail2
      //파라미터 받아오는데 multipartfile을 받아올때.. 파일을 받아올때 경로
      //for문 dao에서 돌리면 돼
      
      //System.out.println(g);
      //System.out.println(uploadFile1);
      //System.out.println(uploadFile2);

      //파일을 무조건 받아와 : required
      int result = gService.insertGoodsText(g);
      
      GoodsAtt ga = new GoodsAtt();
      ArrayList<GoodsAtt> list = new ArrayList<GoodsAtt>();//setting 끝
      //리스트는 층으로 된 서랍
      //3단 서랍 - 1층에 똑같은 지우개, 2층에 똑같은 지우개 
      //insert를 하면 일반적으로 한행
      //한번에 두개 row --> 이미지
      //이 두개를 넣어서 한번에 service로 갈때
      //list를 쓰는것
      //
      
      if(uploadFile1 != null && !uploadFile1.isEmpty()) {
         String renameFileName = saveFile(uploadFile1, request);
         
         ga.setOriginFileName(uploadFile1.getOriginalFilename());
         ga.setRenameFileName(renameFileName);
         ga.setThumbNail(0);
         
         list.add(ga);
         
      } 
      
      GoodsAtt ga1 = new GoodsAtt();
      
      if(uploadFile2 != null && !uploadFile2.isEmpty()) {
         String renameFileName = saveFile(uploadFile2, request);
         
         ga1.setOriginFileName(uploadFile2.getOriginalFilename());
         ga1.setRenameFileName(renameFileName);
         ga1.setThumbNail(1);
         
         list.add(ga1);
         
         }
      //System.out.println(list);
      
      //리스트에 ga 담아야겠져..
      //텍스트 따로 이미지 따로 보내는게 편해..
      
      int result1 = gService.insertGoodsImage(list);
      
      if(result+result1 > 2) {
         return "redirect:glist.go";
      } else {
         throw new GoodsException("게시글 등록에 실패하였습니다.");
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
      String originFileName = uploadFile1.getOriginalFilename();
      String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + originFileName.substring(originFileName.lastIndexOf("."));
      
   String filePath = folder + "\\" + renameFileName;
      
      try {
         uploadFile1.transferTo(new File(filePath));
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      return renameFileName;
   }
   
   
   @RequestMapping("gdetail.go")
   public ModelAndView goodsDetail(@RequestParam("gId") int gId, ModelAndView mv) {
      Goods goods = gService.selectGoodsText(gId);
      ArrayList<GoodsAtt> goodsAtt = gService.selectGoodsImage(gId);
      
      if(goods != null && goodsAtt != null) {
         mv.addObject("goods", goods).addObject("goodsAtt", goodsAtt).setViewName("goodsDetail");
      } else {
         throw new GoodsException("상품 상세보기에 실패하였습니다.");
      }
      
      return mv;
   }
   
   
   @RequestMapping("gupView.go")
   public String goodsUpdateForm(@ModelAttribute Goods g, @RequestParam(value="uploadFile1", required=false) String uploadFile1,
                          @RequestParam(value="uploadFiles2", required=false) String uploadFiles2, Model model, 
                          @RequestParam(value="thumbFileNo", required=false) Integer thumbFileNo, 
                          @RequestParam(value="detailFileNo", required=false) Integer detailFileNo) {
      
      //Current request is not a multipart request --> String이 아니라 multipartFile로 받아옴
      
      //System.out.println(uploadFile1);
      //System.out.println(uploadFiles2);
      
      model.addAttribute("g", g).addAttribute("uploadFile1", uploadFile1).addAttribute("uploadFile2", uploadFiles2).addAttribute("thumbFileNo", thumbFileNo).addAttribute("detailFileNo", detailFileNo);
      
      
      
      //System.out.println(uploadFile1);
      //System.out.println(uploadFiles2);
      
      //System.out.println("썸네일 : " + thumbFileNo);
      //System.out.println("디테일 : " + detailFileNo);
      
      return "goodsUpdateForm";
   }
   
   
   @RequestMapping("gupdate.go")
   public String updateGoods(@ModelAttribute Goods g, @RequestParam("uploadFiles1") MultipartFile uploadFiles1, 
                                          @RequestParam("uploadFiles2") MultipartFile uploadFiles2, 
                                          HttpServletRequest request,
                                          Model model, HttpSession session,
                                          @RequestParam(value="fileNo1", required=false) Integer fileNo1,
                                          @RequestParam(value="fileNo2", required=false) Integer fileNo2) {
      String userId = ((Member)session.getAttribute("loginUser")).getId();
      //update하면.. 게시글 번호가 기준(시퀀스)
      g.setAdminId(userId);
      int result = gService.updateGoodsText(g);
      
      //System.out.println("뷰단에서" + g);
      //System.out.println("뷰단에서" + uploadFiles1);
      //System.out.println("뷰단에서" + uploadFiles2);
      
      //System.out.println("result : " + result); 
      
      
      //파일 넘버
      //System.out.println("updateform으로부터"+fileNo1);
      //System.out.println("updateform으로부터"+fileNo2);
      
      GoodsAtt ga = new GoodsAtt();
      ArrayList<GoodsAtt> list = new ArrayList<GoodsAtt>();
      //HashMap<String, String> map = new HashMap<>();
      
      if(uploadFiles1 != null && !uploadFiles1.isEmpty()) {
         deleteFile(ga.getRenameFileName(), request);
         
         
         String renameFileName = saveFile(uploadFiles1, request);
         ga.setFileNo(fileNo1);
         ga.setOriginFileName(uploadFiles1.getOriginalFilename());
         ga.setRenameFileName(renameFileName);
         ga.setThumbNail(0);
         ga.setGoodsId(g.getGoodsId());
         
         list.add(ga);
         
         //System.out.println("list(ga) : " + list);
         //System.out.println("renameFileName : " + renameFileName);
      }
      
      GoodsAtt ga1 = new GoodsAtt();
      if(uploadFiles2 != null && !uploadFiles2.isEmpty()) {
         deleteFile(ga1.getRenameFileName(), request);
         
         String renameFileName = saveFile(uploadFiles2, request);
         ga1.setFileNo(fileNo2);
         ga1.setOriginFileName(uploadFiles1.getOriginalFilename());
         ga1.setRenameFileName(renameFileName);
         ga1.setThumbNail(1);
         ga1.setGoodsId(g.getGoodsId());
         
         list.add(ga1);
         
         //System.out.println("list(ga1) : " + list);
         //System.out.println("renameFileName : " + renameFileName);
         
         
      }
      
      int result1 = gService.updateGoodsImage(list);
      
      //System.out.println("list : " +list);
      
      //System.out.println("result1 : " +result1);
         
      
      
      if(result + result1 > 2) {
         return "redirect:gdetail.go?gId="+g.getGoodsId();
      } else {
         throw new GoodsException("게시글 수정에 실패하였습니다.");
      }
      
   
   }


   private void deleteFile(String fileName, HttpServletRequest request) {//저 위에는 renameFileName으로 보내줬지만 여기서 fileName명으로 받아준거야
      String root = request.getSession().getServletContext().getRealPath("resources");
      String savePath = root + "\\buploadFiles";
      
      File f = new File(savePath + "\\" + fileName);//file클래스를 이용해야 다음과 같은 메소드를 활용할 수 있어
      if(f.exists()) {
         f.delete();
      }//update할거니까 여기에서 먼저 지워주면 돼!
      
   }
   
    @RequestMapping("gdelete.go")
    public String deleteGoods(@RequestParam("gId") int gId, @RequestParam("uploadFile1") String uploadFile1,
                            @RequestParam("uploadFiles2") String uploadFiles2, HttpServletRequest request) {
       
       if(!uploadFile1.equals("") && !uploadFiles2.equals("")) {
          deleteFile(uploadFile1, request);
          deleteFile(uploadFiles2, request);
       }
       
       System.out.println(gId);
       
       int result = gService.deleteGoodsText(gId);
       //int result1 = gService.deleteGoodsImage(gId);
       
       System.out.println(result);
       //System.out.println(result1);
       
       
       
       if(result > 0) {
          return "redirect:glist.go";
       } else {
          throw new GoodsException("상품 삭제에 실패하였습니다.");
       }
      
    }
    
   
   
   
}