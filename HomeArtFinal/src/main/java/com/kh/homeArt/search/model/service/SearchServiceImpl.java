package com.kh.homeArt.search.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.main.model.vo.BoardInfo;
import com.kh.homeArt.main.model.vo.PurchaseInfo;
import com.kh.homeArt.search.model.dao.SearchDAO;
import com.kh.homeArt.search.model.vo.ExpertBoardInfo;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	SearchDAO searchDAO;
	
	@Override
	public ArrayList<PurchaseInfo> getPurchaseList(String title) {
		return searchDAO.getPurchaseList(sqlSession, title);
	}
	
	@Override
	public ArrayList<BoardInfo> getBoardList(String title) {
		return searchDAO.getBoardList(sqlSession, title);
	}
	
	@Override
	public ArrayList<ExpertBoardInfo> getExpertList(String title) {
		return searchDAO.getExpertList(sqlSession, title);
	}
}
