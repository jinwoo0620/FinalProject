package com.kh.homeArt.notice.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String replyContent;
	private Date createDate;
	private String status;
	private int boardNo;
	private int scope;
	private String memberId;

	
	public Reply() {}


	public Reply(int replyNo, String replyContent, Date createDate, String status, int boardNo, int scope,
			String memberId) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.status = status;
		this.boardNo = boardNo;
		this.scope = scope;
		this.memberId = memberId;
	}


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getScope() {
		return scope;
	}


	public void setScope(int scope) {
		this.scope = scope;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", createDate=" + createDate
				+ ", status=" + status + ", boardNo=" + boardNo + ", scope=" + scope + ", memberId=" + memberId + "]";
	}


	
	
	
	
}
