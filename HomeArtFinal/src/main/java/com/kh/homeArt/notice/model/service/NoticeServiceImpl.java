package com.kh.homeArt.notice.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.homeArt.notice.model.dao.NoticeDAO;
import com.kh.homeArt.notice.model.vo.Notice;
import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{
   
   @Autowired
   private NoticeDAO nDAO;
   
   @Autowired
   private SqlSessionTemplate sqlSession;

  
   
   @Override
   public int getListCount() {
      return nDAO.getListCount(sqlSession);
   }
   
   

   @Override
   public ArrayList<Notice> getNoticeList(PageInfo pi) {
      return nDAO.getNoticeList(sqlSession, pi);
   }
   
 


   @Override
   public int insertNotice(Notice n) {
      return nDAO.insertNotice(sqlSession, n);
   }

 

   @Override
   public Notice selectNotice(int nId) {
      int result = nDAO.addReadCount(sqlSession, nId);

      Notice n = null;
      if(result > 0 ) {
         n = nDAO.selectNotice(sqlSession, nId);
      }
      return n;
   }

   @Override
   public int updateNotice(Notice n) {
	
	   return nDAO.updateNotice(sqlSession, n);
   }

   @Override
   public int deleteNotice(int nId) {
	
	   return nDAO.deleteNotice(sqlSession, nId);
   }

	@Override
	public int insertReply(Reply r) {
		return nDAO.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int nId) {
		return nDAO.selectReplyList(sqlSession, nId);
	}





	



}