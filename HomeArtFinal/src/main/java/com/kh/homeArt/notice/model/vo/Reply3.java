package com.kh.homeArt.notice.model.vo;

import java.sql.Date;

public class Reply3 {
	private int replyNo3;
	private String replyContent3;
	private Date createDate3;
	private String status3;
	private int boardNo3;
	private int scope3;
	private String memberId3;

	
	public Reply3() {}


	public Reply3(int replyNo3, String replyContent3, Date createDate3, String status3, int boardNo3, int scope3,
			String memberId3) {
		super();
		this.replyNo3 = replyNo3;
		this.replyContent3 = replyContent3;
		this.createDate3 = createDate3;
		this.status3 = status3;
		this.boardNo3 = boardNo3;
		this.scope3 = scope3;
		this.memberId3 = memberId3;
	}


	public int getReplyNo3() {
		return replyNo3;
	}


	public void setReplyNo3(int replyNo3) {
		this.replyNo3 = replyNo3;
	}


	public String getReplyContent3() {
		return replyContent3;
	}


	public void setReplyContent3(String replyContent3) {
		this.replyContent3 = replyContent3;
	}


	public Date getCreateDate3() {
		return createDate3;
	}


	public void setCreateDate3(Date createDate3) {
		this.createDate3 = createDate3;
	}


	public String getStatus3() {
		return status3;
	}


	public void setStatus3(String status3) {
		this.status3 = status3;
	}


	public int getBoardNo3() {
		return boardNo3;
	}


	public void setBoardNo3(int boardNo3) {
		this.boardNo3 = boardNo3;
	}


	public int getScope3() {
		return scope3;
	}


	public void setScope3(int scope3) {
		this.scope3 = scope3;
	}


	public String getMemberId3() {
		return memberId3;
	}


	public void setMemberId3(String memberId3) {
		this.memberId3 = memberId3;
	}


	@Override
	public String toString() {
		return "Reply3 [replyNo3=" + replyNo3 + ", replyContent3=" + replyContent3 + ", createDate3=" + createDate3
				+ ", status3=" + status3 + ", boardNo3=" + boardNo3 + ", scope3=" + scope3 + ", memberId3=" + memberId3
				+ "]";
	}

	
}
