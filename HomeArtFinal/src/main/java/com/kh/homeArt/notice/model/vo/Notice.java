package com.kh.homeArt.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date NCreateDate;
	private Date modifyDate;
	private String writer;
	private int noticeType;
	private String status;
	private int views;
	
	
	
	public Notice() {}



	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date nCreateDate, Date modifyDate,
			String writer, int noticeType, String status, int views) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		NCreateDate = nCreateDate;
		this.modifyDate = modifyDate;
		this.writer = writer;
		this.noticeType = noticeType;
		this.status = status;
		this.views = views;
	}



	public int getNoticeNo() {
		return noticeNo;
	}



	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}



	public String getNoticeTitle() {
		return noticeTitle;
	}



	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}



	public String getNoticeContent() {
		return noticeContent;
	}



	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}



	public Date getNCreateDate() {
		return NCreateDate;
	}



	public void setNCreateDate(Date nCreateDate) {
		NCreateDate = nCreateDate;
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



	public int getNoticeType() {
		return noticeType;
	}



	public void setNoticeType(int noticeType) {
		this.noticeType = noticeType;
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



	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", NCreateDate=" + NCreateDate + ", modifyDate=" + modifyDate + ", writer=" + writer + ", noticeType="
				+ noticeType + ", status=" + status + ", views=" + views + "]";
	}


	

}
