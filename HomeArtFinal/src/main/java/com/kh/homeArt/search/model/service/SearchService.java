package com.kh.homeArt.search.model.service;

import java.util.ArrayList;

import com.kh.homeArt.expert.model.vo.Expert;
import com.kh.homeArt.main.model.vo.BoardInfo;
import com.kh.homeArt.main.model.vo.PurchaseInfo;
import com.kh.homeArt.search.model.vo.ExpertBoardInfo;

public interface SearchService {

	ArrayList<PurchaseInfo> getPurchaseList(String title);

	ArrayList<BoardInfo> getBoardList(String title);

	ArrayList<ExpertBoardInfo> getExpertList(String title);

}
