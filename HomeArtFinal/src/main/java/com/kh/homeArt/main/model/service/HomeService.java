package com.kh.homeArt.main.model.service;

import java.util.ArrayList;

import com.kh.homeArt.main.model.vo.BoardInfo;
import com.kh.homeArt.main.model.vo.PurchaseInfo;

public interface HomeService {

	ArrayList<PurchaseInfo> getCurrentList(int i);

	ArrayList<BoardInfo> getBoardList(int rowCount);

	int getRowCount();
	
}
