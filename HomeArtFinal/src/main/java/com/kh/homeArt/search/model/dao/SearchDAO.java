package com.kh.homeArt.search.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.main.model.vo.BoardInfo;
import com.kh.homeArt.main.model.vo.PurchaseInfo;
import com.kh.homeArt.search.model.vo.ExpertBoardInfo;


@Repository
public class SearchDAO {

	public ArrayList<PurchaseInfo> getPurchaseList(SqlSessionTemplate sqlSession, String title) {
		return (ArrayList)sqlSession.selectList("searchMapper.getPurchaseList", title);
	}

	public ArrayList<BoardInfo> getBoardList(SqlSessionTemplate sqlSession, String title) {
		return (ArrayList)sqlSession.selectList("searchMapper.getBoardList", title);
	}

	public ArrayList<ExpertBoardInfo> getExpertList(SqlSessionTemplate sqlSession, String title) {
		return (ArrayList)sqlSession.selectList("searchMapper.getExpertList", title);
	}

}
