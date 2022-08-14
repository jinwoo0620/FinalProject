package com.kh.homeArt.board.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.homeArt.board.model.vo.Att;
import com.kh.homeArt.board.model.vo.Board;
import com.kh.homeArt.board.model.vo.Likes;
import com.kh.homeArt.board.model.vo.Reply;

@Repository
public class BoardDAO {

	public ArrayList<Board> getCommunityList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getCommunityList");
	}

	public ArrayList<Att> getImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getImageList");
	}
	
	public Board selectCommunity(SqlSessionTemplate sqlSession, String bId) {
		return sqlSession.selectOne("boardMapper.selectCommunity", bId);
	}

	public int addViewCount(SqlSessionTemplate sqlSession, String bId) {
		return sqlSession.update("boardMapper.addViewCount", bId);
	}

	public ArrayList<Att> selectImages(SqlSessionTemplate sqlSession, String bId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectImages", bId);
	}

	public int insertCommunity(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertCommunity", b);
	}

	public int insertImages(SqlSessionTemplate sqlSession, ArrayList<Att> list) {
		int result = 0;
		
		for(int i= 0; i<list.size(); i++) {
			result += sqlSession.insert("boardMapper.insertImages", list.get(i));
		}
		
		return result;
	}

	public int updateCommunity(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateCommunity", b);
	}

	public int updateImages(SqlSessionTemplate sqlSession, ArrayList<Att> list) {
		int result = 0;
		
		for(int i= 0; i<list.size(); i++) {
			result += sqlSession.update("boardMapper.updateImages", list.get(i));
		}
		
		return result;
	}

	public int deleteCommunity(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("boardMapper.deleteCommunity", bId);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", bId);
	}

	public int replyCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.replyCount", bId);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int rId) {
		return sqlSession.update("boardMapper.deleteReply", rId);
	}

	public int likesCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.likesCount", bId);
	}

	public int likesCheck(SqlSessionTemplate sqlSession, Likes l) {
		return sqlSession.selectOne("boardMapper.likesCheck", l);
	}

	public int addlikes(SqlSessionTemplate sqlSession, Likes l) {
		return sqlSession.insert("boardMapper.addLikes", l);
	}

	public int deleteLikes(SqlSessionTemplate sqlSession, Likes l) {
		return sqlSession.delete("boardMapper.deleteLikes", l);
	}

}
