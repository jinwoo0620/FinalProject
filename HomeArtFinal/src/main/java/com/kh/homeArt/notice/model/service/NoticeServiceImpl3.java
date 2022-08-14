package com.kh.homeArt.notice.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.homeArt.notice.model.dao.NoticeDAO3;
import com.kh.homeArt.notice.model.vo.Notice3;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply3;

@Service("nService3")
public class NoticeServiceImpl3 implements NoticeService3{
   
   @Autowired
   private NoticeDAO3 nDAO3;
   
   @Autowired
   private SqlSessionTemplate sqlSession;

  
   
   @Override
   public int getListCount3() {
      return nDAO3.getListCount3(sqlSession);
   }
   
   

   @Override
   public ArrayList<Notice3> getNoticeList3(PageInfo pi) {
      return nDAO3.getNoticeList3(sqlSession, pi);
   }
   
 


   @Override
   public int insertNotice3(Notice3 n) {
      return nDAO3.insertNotice3(sqlSession, n);
   }

 

   @Override
   public Notice3 selectNotice3(int nId) {
      int result = nDAO3.addReadCount3(sqlSession, nId);

      Notice3 n = null;
      if(result > 0 ) {
         n = nDAO3.selectNotice3(sqlSession, nId);
      }
      return n;
   }

   @Override
   public int updateNotice3(Notice3 n) {
	
	   return nDAO3.updateNotice3(sqlSession, n);
   }

   @Override
   public int deleteNotice3(int nId) {
	
	   return nDAO3.deleteNotice3(sqlSession, nId);
   }

	@Override
	public int insertReply3(Reply3 r) {
		return nDAO3.insertReply3(sqlSession, r);
	}

	@Override
	public ArrayList<Reply3> selectReplyList3(int nId) {
		return nDAO3.selectReplyList3(sqlSession, nId);
	}



	

	



}