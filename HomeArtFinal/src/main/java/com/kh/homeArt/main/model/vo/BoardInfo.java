package com.kh.homeArt.main.model.vo;

public class BoardInfo {
	private int BoardNo;
	private String boardTitle;
	private String writer;
	private int views;
	private String originName;
	private String changeName;
	private String profilePath;
	
	public BoardInfo() {}

	public BoardInfo(int boardNo, String boardTitle, String writer, int views, String originName, String changeName,
			String profilePath) {
		super();
		BoardNo = boardNo;
		this.boardTitle = boardTitle;
		this.writer = writer;
		this.views = views;
		this.originName = originName;
		this.changeName = changeName;
		this.profilePath = profilePath;
	}

	public int getBoardNo() {
		return BoardNo;
	}

	public void setBoardNo(int boardNo) {
		BoardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	@Override
	public String toString() {
		return "BoardInfo [BoardNo=" + BoardNo + ", boardTitle=" + boardTitle + ", writer=" + writer + ", views="
				+ views + ", originName=" + originName + ", changeName=" + changeName + ", profilePath=" + profilePath
				+ "]";
	}
	
	
}
