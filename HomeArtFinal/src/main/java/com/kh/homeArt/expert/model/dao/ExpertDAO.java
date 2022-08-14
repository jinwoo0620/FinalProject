package com.kh.homeArt.expert.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.expert.model.vo.PageInfo;

@Repository("eDAO")
public class ExpertDAO {

   public int getListCount(SqlSessionTemplate sqlSession) {
      return sqlSession.selectOne("expertMapper.getListCount");
   }

   public ArrayList<Expert> getExpertBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
      
      return (ArrayList)sqlSession.selectList("expertMapper.getExpertBoardList", null, rowBounds);
   }

   public int insertExpert(SqlSessionTemplate sqlSession, Expert e) {

      return sqlSession.insert("expertMapper.insertExpert", e);
   }

   public Expert selectExpert(SqlSessionTemplate sqlSession, int eId) {
      return sqlSession.selectOne("expertMapper.selectExpert", eId);
   }

   public int updateExpert(SqlSessionTemplate sqlSession, Expert e) {
      return sqlSession.update("expertMapper.updateExpert", e);
   }

   public int deleteExpert(SqlSessionTemplate sqlSession, int eId) {
      return sqlSession.delete("expertMapper.deleteExpert", eId);
   }

   public int getMoveListCount(SqlSessionTemplate sqlSession) {
      return sqlSession.selectOne("expertMapper.getMoveListCount");
   }
   
   public ArrayList<Expert> getMoveExpertBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
      
      return (ArrayList)sqlSession.selectList("expertMapper.getMoveExpertBoardList", null, rowBounds);
   }

   public int getTileListCount(SqlSessionTemplate sqlSession) {
      return sqlSession.selectOne("expertMapper.getTileListCount");
   }

   public ArrayList<Expert> getTileExpertBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
      
      return (ArrayList)sqlSession.selectList("expertMapper.getTileExpertBoardList", null, rowBounds);
   }

   public int getAirListCount(SqlSessionTemplate sqlSession) {
      return sqlSession.selectOne("expertMapper.getAirListCount");
   }

   public ArrayList<Expert> getAirExpertBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
      
      return (ArrayList)sqlSession.selectList("expertMapper.getAirExpertBoardList", null, rowBounds);
   }

   public int getWallPaperListCount(SqlSessionTemplate sqlSession) {
      return sqlSession.selectOne("expertMapper.getWallPaperListCount");
   }

   public ArrayList<Expert> getWallPaperExpertBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
      
      return (ArrayList)sqlSession.selectList("expertMapper.getWallPaperExpertBoardList", null, rowBounds);
   }

   public int getInteriorListCount(SqlSessionTemplate sqlSession) {
      return sqlSession.selectOne("expertMapper.getInteriorListCount");
   }

   public ArrayList<Expert> getInteriorExpertBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
      
      return (ArrayList)sqlSession.selectList("expertMapper.getInteriorExpertBoardList", null, rowBounds);
   }
}