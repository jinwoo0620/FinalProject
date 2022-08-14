package com.kh.homeArt.notice.model.vo;

import java.sql.Date;

public class Reply2 {
	private int replyNo2;
	private String replyContent2;
	private Date createDate2;
	private String status2;
	private int boardNo2;
	private int scope2;
	private String memberId2;

	
	public Reply2() {}


	public Reply2(int replyNo2, String replyContent2, Date createDate2, String status2, int boardNo2, int scope2,
			String memberId2) {
		super();
		this.replyNo2 = replyNo2;
		this.replyContent2 = replyContent2;
		this.createDate2 = createDate2;
		this.status2 = status2;
		this.boardNo2 = boardNo2;
		this.scope2 = scope2;
		this.memberId2 = memberId2;
	}


	public int getReplyNo2() {
		return replyNo2;
	}


	public void setReplyNo2(int replyNo2) {
		this.replyNo2 = replyNo2;
	}


	public String getReplyContent2() {
		return replyContent2;
	}


	public void setReplyContent2(String replyContent2) {
		this.replyContent2 = replyContent2;
	}


	public Date getCreateDate2() {
		return createDate2;
	}


	public void setCreateDate2(Date createDate2) {
		this.createDate2 = createDate2;
	}


	public String getStatus2() {
		return status2;
	}


	public void setStatus2(String status2) {
		this.status2 = status2;
	}


	public int getBoardNo2() {
		return boardNo2;
	}


	public void setBoardNo2(int boardNo2) {
		this.boardNo2 = boardNo2;
	}


	public int getScope2() {
		return scope2;
	}


	public void setScope2(int scope2) {
		this.scope2 = scope2;
	}


	public String getMemberId2() {
		return memberId2;
	}


	public void setMemberId2(String memberId2) {
		this.memberId2 = memberId2;
	}


	@Override
	public String toString() {
		return "Reply2 [replyNo2=" + replyNo2 + ", replyContent2=" + replyContent2 + ", createDate2=" + createDate2
				+ ", status2=" + status2 + ", boardNo2=" + boardNo2 + ", scope2=" + scope2 + ", memberId2=" + memberId2
				+ "]";
	}

	
}
