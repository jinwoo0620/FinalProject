package com.kh.homeArt.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date bCreateDate;
	private Date modifyDate;
	private String writer;
	private String nickName;
	private int boardType;
	private String status;
	private int views;
	private String renameFileName;
	private int rCount;
	private int lCount;
	
	public Board() {}

	public Board(int boardNo, String boardTitle, String boardContent, Date bCreateDate, Date modifyDate, String writer,
			String nickName, int boardType, String status, int views, String renameFileName, int rCount, int lCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.bCreateDate = bCreateDate;
		this.modifyDate = modifyDate;
		this.writer = writer;
		this.nickName = nickName;
		this.boardType = boardType;
		this.status = status;
		this.views = views;
		this.renameFileName = renameFileName;
		this.rCount = rCount;
		this.lCount = lCount;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getbCreateDate() {
		return bCreateDate;
	}

	public void setbCreateDate(Date bCreateDate) {
		this.bCreateDate = bCreateDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public int getlCount() {
		return lCount;
	}

	public void setlCount(int lCount) {
		this.lCount = lCount;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", bCreateDate=" + bCreateDate + ", modifyDate=" + modifyDate + ", writer=" + writer + ", nickName="
				+ nickName + ", boardType=" + boardType + ", status=" + status + ", views=" + views
				+ ", renameFileName=" + renameFileName + ", rCount=" + rCount + ", lCount=" + lCount + "]";
	}
}