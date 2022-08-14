package com.kh.homeArt.notice.model.vo;

import java.sql.Date;

public class Notice4 {
	
	private int noticeNo4;
	private String noticeTitle4;
	private String noticeContent4;
	private Date NCreateDate4;
	private Date modifyDate4;
	private String writer4;
	private int noticeType4;
	private String status4;
	private int views4;
	
	
	public Notice4() {}


	public Notice4(int noticeNo4, String noticeTitle4, String noticeContent4, Date nCreateDate4, Date modifyDate4,
			String writer4, int noticeType4, String status4, int views4) {
		super();
		this.noticeNo4 = noticeNo4;
		this.noticeTitle4 = noticeTitle4;
		this.noticeContent4 = noticeContent4;
		NCreateDate4 = nCreateDate4;
		this.modifyDate4 = modifyDate4;
		this.writer4 = writer4;
		this.noticeType4 = noticeType4;
		this.status4 = status4;
		this.views4 = views4;
	}


	public int getNoticeNo4() {
		return noticeNo4;
	}


	public void setNoticeNo4(int noticeNo4) {
		this.noticeNo4 = noticeNo4;
	}


	public String getNoticeTitle4() {
		return noticeTitle4;
	}


	public void setNoticeTitle4(String noticeTitle4) {
		this.noticeTitle4 = noticeTitle4;
	}


	public String getNoticeContent4() {
		return noticeContent4;
	}


	public void setNoticeContent4(String noticeContent4) {
		this.noticeContent4 = noticeContent4;
	}


	public Date getNCreateDate4() {
		return NCreateDate4;
	}


	public void setNCreateDate4(Date nCreateDate4) {
		NCreateDate4 = nCreateDate4;
	}


	public Date getModifyDate4() {
		return modifyDate4;
	}


	public void setModifyDate4(Date modifyDate4) {
		this.modifyDate4 = modifyDate4;
	}


	public String getWriter4() {
		return writer4;
	}


	public void setWriter4(String writer4) {
		this.writer4 = writer4;
	}


	public int getNoticeType4() {
		return noticeType4;
	}


	public void setNoticeType4(int noticeType4) {
		this.noticeType4 = noticeType4;
	}


	public String getStatus4() {
		return status4;
	}


	public void setStatus4(String status4) {
		this.status4 = status4;
	}


	public int getViews4() {
		return views4;
	}


	public void setViews4(int views4) {
		this.views4 = views4;
	}


	@Override
	public String toString() {
		return "Notice4 [noticeNo4=" + noticeNo4 + ", noticeTitle4=" + noticeTitle4 + ", noticeContent4="
				+ noticeContent4 + ", NCreateDate4=" + NCreateDate4 + ", modifyDate4=" + modifyDate4 + ", writer4="
				+ writer4 + ", noticeType4=" + noticeType4 + ", status4=" + status4 + ", views4=" + views4 + "]";
	}

	
}
