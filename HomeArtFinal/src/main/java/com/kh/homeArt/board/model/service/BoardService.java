package com.kh.homeArt.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.homeArt.board.model.vo.Att;
import com.kh.homeArt.board.model.vo.Board;
import com.kh.homeArt.board.model.vo.Likes;
import com.kh.homeArt.board.model.vo.Reply;

public interface BoardService {

	ArrayList getCommunityList();
	
	ArrayList getImageList();
	
	Board selectCommunity(String bId);

	ArrayList<Att> selectImages(String bId);

	int insertCommunity(Board b);

	int insertImages(ArrayList<Att> list);

	int updateCommunity(Board b);

	int updateImages(ArrayList<Att> list);

	int deleteCommunity(int bId);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int bId);

	int replyCount(int bId);

	int deleteReply(int rId);

	int likesCount(int bId);

	int likesCheck(Likes l);

//	int likesYN(Likes l);

}
