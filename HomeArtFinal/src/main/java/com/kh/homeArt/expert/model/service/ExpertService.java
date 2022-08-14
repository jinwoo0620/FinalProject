package com.kh.homeArt.expert.model.service;

import java.util.ArrayList;

import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.expert.model.vo.PageInfo;

public interface ExpertService {

   int getListCount();

   ArrayList<Expert> getExpertBoardList(PageInfo pi);

   int insertExpert(Expert e);

   Expert selectExpert(int eId);

   int updateExpert(Expert e);

   int deleteExpert(int eId);

   int getMoveListCount();
   
   ArrayList<Expert> getMoveExpertBoardList(PageInfo pi);

   int getTileListCount();

   ArrayList<Expert> getTileExpertBoardList(PageInfo pi);

   int getAirListCount();

   ArrayList<Expert> getAirExpertBoardList(PageInfo pi);

   int getWallPaperListCount();

   ArrayList<Expert> getWallPaperExpertBoardList(PageInfo pi);

   int getInteriorListCount();

   ArrayList<Expert> getInteriorExpertBoardList(PageInfo pi);


}