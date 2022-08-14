package com.kh.homeArt.expert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.homeArt.expert.model.dao.ExpertDAO;
import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.expert.model.vo.PageInfo;

@Service("eService")   // 서비스 등록을 해주기 위해 작성해준 것
public class ExpertServiceImpl implements ExpertService{
   // ExpertService에 대한 implements를 구현한 곳이다
   
   @Autowired
   private ExpertDAO eDAO;
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   // DAO에 넘기기위한 SqlSessionTemplate 생성

   @Override
   public int getListCount() {
      return eDAO.getListCount(sqlSession);
   }

   @Override
   public ArrayList<Expert> getExpertBoardList(PageInfo pi) {
      return eDAO.getExpertBoardList(sqlSession, pi);
   }

   @Override
   public int insertExpert(Expert e) {
      return eDAO.insertExpert(sqlSession, e);
   }

   @Override
   public Expert selectExpert(int eId) {
      return eDAO.selectExpert(sqlSession, eId);
   }

   @Override
   public int updateExpert(Expert e) {
      return eDAO.updateExpert(sqlSession, e);
   }

   @Override
   public int deleteExpert(int eId) {
      return eDAO.deleteExpert(sqlSession, eId);
   }

   @Override
   public int getMoveListCount() {
      return eDAO.getMoveListCount(sqlSession);
   }
   
   @Override
   public ArrayList<Expert> getMoveExpertBoardList(PageInfo pi) {
      return eDAO.getMoveExpertBoardList(sqlSession, pi);
   }

   @Override
   public int getTileListCount() {
      return eDAO.getTileListCount(sqlSession);
   }

   @Override
   public ArrayList<Expert> getTileExpertBoardList(PageInfo pi) {
      return eDAO.getTileExpertBoardList(sqlSession, pi);
   }

   @Override
   public int getAirListCount() {
      return eDAO.getAirListCount(sqlSession);
   }

   @Override
   public ArrayList<Expert> getAirExpertBoardList(PageInfo pi) {
      return eDAO.getAirExpertBoardList(sqlSession, pi);
   }

   @Override
   public int getWallPaperListCount() {
      return eDAO.getWallPaperListCount(sqlSession);
   }

   @Override
   public ArrayList<Expert> getWallPaperExpertBoardList(PageInfo pi) {
      return eDAO.getWallPaperExpertBoardList(sqlSession, pi);
   }

   @Override
   public int getInteriorListCount() {
      return eDAO.getInteriorListCount(sqlSession);
   }

   @Override
   public ArrayList<Expert> getInteriorExpertBoardList(PageInfo pi) {
      return eDAO.getInteriorExpertBoardList(sqlSession, pi);
   }

}