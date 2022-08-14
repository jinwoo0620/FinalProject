package com.kh.homeArt.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.homeArt.board.model.dao.BoardDAO;
import com.kh.homeArt.board.model.vo.Att;
import com.kh.homeArt.board.model.vo.Board;
import com.kh.homeArt.board.model.vo.Likes;
import com.kh.homeArt.board.model.vo.Reply;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList getCommunityList() {
		return bDAO.getCommunityList(sqlSession);
	}
	
	@Override
	public ArrayList getImageList() {
		return bDAO.getImageList(sqlSession);
	}

	@Override
	@Transactional
	public Board selectCommunity(String bId) {
		int result = bDAO.addViewCount(sqlSession, bId);
		
		Board b = null;
		if(result > 0) {
			b = bDAO.selectCommunity(sqlSession, bId);
		}
		return b;
	}

	@Override
	public ArrayList<Att> selectImages(String bId) {
		return bDAO.selectImages(sqlSession, bId);
	}

	@Override
	public int insertCommunity(Board b) {
		return bDAO.insertCommunity(sqlSession, b);
	}

	@Override
	public int insertImages(ArrayList<Att> list) {
		return bDAO.insertImages(sqlSession, list);
	}

	@Override
	public int updateCommunity(Board b) {
		return bDAO.updateCommunity(sqlSession, b);
	}

	@Override
	public int updateImages(ArrayList<Att> list) {
		return bDAO.updateImages(sqlSession, list);
	}

	@Override
	public int deleteCommunity(int bId) {
		return bDAO.deleteCommunity(sqlSession, bId);
	}

	@Override
	public int insertReply(Reply r) {
		return bDAO.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bId) {
		return bDAO.selectReplyList(sqlSession, bId);
	}

	@Override
	public int replyCount(int bId) {
		return bDAO.replyCount(sqlSession, bId);
	}

	@Override
	public int deleteReply(int rId) {
		return bDAO.deleteReply(sqlSession, rId);
	}

	@Override
	public int likesCount(int bId) {
		return bDAO.likesCount(sqlSession, bId);
	}

//	@Override
//	public int likesYN(Likes l) {
//		return bDAO.likesCheck(sqlSession, l);
//	}
	
	@Override
	public int likesCheck(Likes l) {
		int result = bDAO.likesCheck(sqlSession, l);
		
		if(result > 0) {
			return bDAO.deleteLikes(sqlSession, l);
		} else {
			return bDAO.addlikes(sqlSession, l);
		}
	}

	
}
