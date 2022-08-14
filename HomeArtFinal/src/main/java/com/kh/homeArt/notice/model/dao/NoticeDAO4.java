package com.kh.homeArt.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.notice.model.vo.Notice4;


import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply4;

@Repository
public class NoticeDAO4 {

   public int getListCount4(SqlSession sqlSession) {
      return sqlSession.selectOne("noticeMapper.getListCount4");
   
   }
   
  

   public ArrayList<Notice4> getNoticeList4(SqlSession sqlSession, PageInfo pi) {
      
     
      int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
                            
      RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
      
                                    
      return (ArrayList)sqlSession.selectList("noticeMapper.getNoticeList4",null,rowBounds);
      
   }
   

   
   
   
   
   

   public int insertNotice4(SqlSession sqlSession, Notice4 n) {
   
      return sqlSession.insert("noticeMapper.insertNotice4", n);
   }

   
   public Notice4 selectNotice4(SqlSession sqlSession, int nId) {
      return sqlSession.selectOne("noticeMapper.selectNotice4", nId);
   }

   public int addReadCount4(SqlSession sqlSession, int nId) {
      return sqlSession.update("noticeMapper.addReadCount4", nId);
      
   }

   public int updateNotice4(SqlSessionTemplate sqlSession, Notice4 n) {
	
	   return sqlSession.update("noticeMapper.updateNotice4", n);
   }

   public int deleteNotice4(SqlSessionTemplate sqlSession, int nId) {
	  
	   return sqlSession.delete("noticeMapper.deleteNotice4", nId);
   }

	public int insertReply4(SqlSessionTemplate sqlSession, Reply4 r) {
		return sqlSession.insert("noticeMapper.insertReply4", r);
	}

	public ArrayList<Reply4> selectReplyList4(SqlSessionTemplate sqlSession, int nId) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList4", nId);
	}

}