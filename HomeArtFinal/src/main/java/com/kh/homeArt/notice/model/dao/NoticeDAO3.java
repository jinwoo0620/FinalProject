package com.kh.homeArt.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.notice.model.vo.Notice3;


import com.kh.homeArt.notice.model.vo.PageInfo;
import com.kh.homeArt.notice.model.vo.Reply3;

@Repository
public class NoticeDAO3 {

   public int getListCount3(SqlSession sqlSession) {
      return sqlSession.selectOne("noticeMapper.getListCount3");
   
   }
   
  

   public ArrayList<Notice3> getNoticeList3(SqlSession sqlSession, PageInfo pi) {
      
     
      int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
                            
      RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
      
                                    
      return (ArrayList)sqlSession.selectList("noticeMapper.getNoticeList3",null,rowBounds);
      
   }
   

   
   
   
   
   

   public int insertNotice3(SqlSession sqlSession, Notice3 n) {
   
      return sqlSession.insert("noticeMapper.insertNotice3", n);
   }

   
   public Notice3 selectNotice3(SqlSession sqlSession, int nId) {
      return sqlSession.selectOne("noticeMapper.selectNotice3", nId);
   }

   public int addReadCount3(SqlSession sqlSession, int nId) {
      return sqlSession.update("noticeMapper.addReadCount3", nId);
      
   }

   public int updateNotice3(SqlSessionTemplate sqlSession, Notice3 n) {
	
	   return sqlSession.update("noticeMapper.updateNotice3", n);
   }

   public int deleteNotice3(SqlSessionTemplate sqlSession, int nId) {
	  
	   return sqlSession.delete("noticeMapper.deleteNotice3", nId);
   }

	public int insertReply3(SqlSessionTemplate sqlSession, Reply3 r) {
		return sqlSession.insert("noticeMapper.insertReply3", r);
	}

	public ArrayList<Reply3> selectReplyList3(SqlSessionTemplate sqlSession, int nId) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList3", nId);
	}

}