package com.kh.homeArt.notice.model.vo;

import java.sql.Date;

public class Reply4 {
	private int replyNo4;
	private String replyContent4;
	private Date createDate4;
	private String status4;
	private int boardNo4;
	private int scope4;
	private String memberId4;

	
	public Reply4() {}


	public Reply4(int replyNo4, String replyContent4, Date createDate4, String status4, int boardNo4, int scope4,
			String memberId4) {
		super();
		this.replyNo4 = replyNo4;
		this.replyContent4 = replyContent4;
		this.createDate4 = createDate4;
		this.status4 = status4;
		this.boardNo4 = boardNo4;
		this.scope4 = scope4;
		this.memberId4 = memberId4;
	}


	public int getReplyNo4() {
		return replyNo4;
	}


	public void setReplyNo4(int replyNo4) {
		this.replyNo4 = replyNo4;
	}


	public String getReplyContent4() {
		return replyContent4;
	}


	public void setReplyContent4(String replyContent4) {
		this.replyContent4 = replyContent4;
	}


	public Date getCreateDate4() {
		return createDate4;
	}


	public void setCreateDate4(Date createDate4) {
		this.createDate4 = createDate4;
	}


	public String getStatus4() {
		return status4;
	}


	public void setStatus4(String status4) {
		this.status4 = status4;
	}


	public int getBoardNo4() {
		return boardNo4;
	}


	public void setBoardNo4(int boardNo4) {
		this.boardNo4 = boardNo4;
	}


	public int getScope4() {
		return scope4;
	}


	public void setScope4(int scope4) {
		this.scope4 = scope4;
	}


	public String getMemberId4() {
		return memberId4;
	}


	public void setMemberId4(String memberId4) {
		this.memberId4 = memberId4;
	}


	@Override
	public String toString() {
		return "Reply4 [replyNo4=" + replyNo4 + ", replyContent4=" + replyContent4 + ", createDate4=" + createDate4
				+ ", status4=" + status4 + ", boardNo4=" + boardNo4 + ", scope4=" + scope4 + ", memberId4=" + memberId4
				+ "]";
	}

	
}
