package com.kh.homeArt.notice.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.homeArt.notice.model.dao.NoticeDAO4;
import com.kh.homeArt.notice.model.vo.Notice4;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply4;

@Service("nService4")
public class NoticeServiceImpl4 implements NoticeService4{
   
   @Autowired
   private NoticeDAO4 nDAO4;
   
   @Autowired
   private SqlSessionTemplate sqlSession;

  
   
   @Override
   public int getListCount4() {
      return nDAO4.getListCount4(sqlSession);
   }
   
   

   @Override
   public ArrayList<Notice4> getNoticeList4(PageInfo pi) {
      return nDAO4.getNoticeList4(sqlSession, pi);
   }
   
 


   @Override
   public int insertNotice4(Notice4 n) {
      return nDAO4.insertNotice4(sqlSession, n);
   }

 

   @Override
   public Notice4 selectNotice4(int nId) {
      int result = nDAO4.addReadCount4(sqlSession, nId);

      Notice4 n = null;
      if(result > 0 ) {
         n = nDAO4.selectNotice4(sqlSession, nId);
      }
      return n;
   }

   @Override
   public int updateNotice4(Notice4 n) {
	
	   return nDAO4.updateNotice4(sqlSession, n);
   }

   @Override
   public int deleteNotice4(int nId) {
	
	   return nDAO4.deleteNotice4(sqlSession, nId);
   }

	@Override
	public int insertReply4(Reply4 r) {
		return nDAO4.insertReply4(sqlSession, r);
	}

	@Override
	public ArrayList<Reply4> selectReplyList4(int nId) {
		return nDAO4.selectReplyList4(sqlSession, nId);
	}



	

	



}