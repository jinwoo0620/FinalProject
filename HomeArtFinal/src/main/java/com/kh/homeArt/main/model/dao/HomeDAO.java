package com.kh.homeArt.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.main.model.vo.BoardInfo;
import com.kh.homeArt.main.model.vo.PurchaseInfo;

@Repository
public class HomeDAO {

	public ArrayList<PurchaseInfo> getCurrentList(SqlSessionTemplate sqlSession, int i) {
		return (ArrayList)sqlSession.selectList("HomeMapper.getCurrentList", i);
	}

	public ArrayList<BoardInfo> getBoardList(SqlSessionTemplate sqlSession, int rowCount) {
		return (ArrayList)sqlSession.selectList("HomeMapper.getBoardList", rowCount);
	}

	public int getRowCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("HomeMapper.getRowCount");
	}

}
