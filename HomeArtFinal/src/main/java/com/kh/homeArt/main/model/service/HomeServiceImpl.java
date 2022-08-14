package com.kh.homeArt.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.homeArt.main.model.dao.HomeDAO;
import com.kh.homeArt.main.model.vo.BoardInfo;
import com.kh.homeArt.main.model.vo.PurchaseInfo;

@Service
public class HomeServiceImpl implements HomeService{
	
	@Autowired
	HomeDAO homeDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<PurchaseInfo> getCurrentList(int i) {
		return homeDAO.getCurrentList(sqlSession, i);
	}
	
	@Override
	public ArrayList<BoardInfo> getBoardList(int rowCount) {
		return homeDAO.getBoardList(sqlSession, rowCount);
	}
	
	@Override
	public int getRowCount() {
		return homeDAO.getRowCount(sqlSession);
	}
}
