package com.kh.homeArt.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.notice.model.vo.Notice2;


import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply2;

@Repository
public class NoticeDAO2 {

   public int getListCount2(SqlSession sqlSession) {
      return sqlSession.selectOne("noticeMapper.getListCount2");
   
   }
   
  

   public ArrayList<Notice2> getNoticeList2(SqlSession sqlSession, PageInfo pi) {
      
     
      int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
                            
      RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
      
                                    
      return (ArrayList)sqlSession.selectList("noticeMapper.getNoticeList2",null,rowBounds);
      
   }
   

   
   
   
   
   

   public int insertNotice2(SqlSession sqlSession, Notice2 n) {
   
      return sqlSession.insert("noticeMapper.insertNotice2", n);
   }

   
   public Notice2 selectNotice2(SqlSession sqlSession, int nId) {
      return sqlSession.selectOne("noticeMapper.selectNotice2", nId);
   }

   public int addReadCount2(SqlSession sqlSession, int nId) {
      return sqlSession.update("noticeMapper.addReadCount2", nId);
      
   }

   public int updateNotice2(SqlSessionTemplate sqlSession, Notice2 n) {
	
	   return sqlSession.update("noticeMapper.updateNotice2", n);
   }

   public int deleteNotice2(SqlSessionTemplate sqlSession, int nId) {
	  
	   return sqlSession.delete("noticeMapper.deleteNotice2", nId);
   }

	public int insertReply2(SqlSessionTemplate sqlSession, Reply2 r) {
		return sqlSession.insert("noticeMapper.insertReply2", r);
	}

	public ArrayList<Reply2> selectReplyList2(SqlSessionTemplate sqlSession, int nId) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList2", nId);
	}

}