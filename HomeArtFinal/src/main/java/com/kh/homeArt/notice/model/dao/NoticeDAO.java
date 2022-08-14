package com.kh.homeArt.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.notice.model.vo.Notice;


import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply;

@Repository
public class NoticeDAO {

   public int getListCount(SqlSession sqlSession) {
      return sqlSession.selectOne("noticeMapper.getListCount");
   
   }
   
  

   public ArrayList<Notice> getNoticeList(SqlSession sqlSession, PageInfo pi) {
      
     
      int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
                            
      RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
      
                                    
      return (ArrayList)sqlSession.selectList("noticeMapper.getNoticeList",null,rowBounds);
      
   }
   

   
   
   
   
   

   public int insertNotice(SqlSession sqlSession, Notice n) {
   
      return sqlSession.insert("noticeMapper.insertNotice", n);
   }

   
   public Notice selectNotice(SqlSession sqlSession, int nId) {
      return sqlSession.selectOne("noticeMapper.selectNotice", nId);
   }

   public int addReadCount(SqlSession sqlSession, int nId) {
      return sqlSession.update("noticeMapper.addReadCount", nId);
      
   }

   public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
	
	   return sqlSession.update("noticeMapper.updateNotice", n);
   }

   public int deleteNotice(SqlSessionTemplate sqlSession, int nId) {
	   return sqlSession.delete("noticeMapper.deleteNotice", nId);
	   
   }

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("noticeMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int nId) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList", nId);
	}

}