package com.kh.homeArt.notice.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.homeArt.notice.model.dao.NoticeDAO2;
import com.kh.homeArt.notice.model.vo.Notice2;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply2;

@Service("nService2")
public class NoticeServiceImpl2 implements NoticeService2{
   
   @Autowired
   private NoticeDAO2 nDAO2;
   
   @Autowired
   private SqlSessionTemplate sqlSession;

  
   
   @Override
   public int getListCount2() {
      return nDAO2.getListCount2(sqlSession);
   }
   
   

   @Override
   public ArrayList<Notice2> getNoticeList2(PageInfo pi) {
      return nDAO2.getNoticeList2(sqlSession, pi);
   }
   
 


   @Override
   public int insertNotice2(Notice2 n) {
      return nDAO2.insertNotice2(sqlSession, n);
   }

 

   @Override
   public Notice2 selectNotice2(int nId) {
      int result = nDAO2.addReadCount2(sqlSession, nId);

      Notice2 n = null;
      if(result > 0 ) {
         n = nDAO2.selectNotice2(sqlSession, nId);
      }
      return n;
   }

   @Override
   public int updateNotice2(Notice2 n) {
	
	   return nDAO2.updateNotice2(sqlSession, n);
   }

   @Override
   public int deleteNotice2(int nId) {
	
	   return nDAO2.deleteNotice2(sqlSession, nId);
   }

	@Override
	public int insertReply2(Reply2 r) {
		return nDAO2.insertReply2(sqlSession, r);
	}

	@Override
	public ArrayList<Reply2> selectReplyList2(int nId) {
		return nDAO2.selectReplyList2(sqlSession, nId);
	}



	

	



}