package com.kh.homeArt.notice.model.vo;

import java.sql.Date;

public class Notice3 {
	
	private int noticeNo3;
	private String noticeTitle3;
	private String noticeContent3;
	private Date NCreateDate3;
	private Date modifyDate3;
	private String writer3;
	private int noticeType3;
	private String status3;
	private int views3;
	
	
	public Notice3() {}


	public Notice3(int noticeNo3, String noticeTitle3, String noticeContent3, Date nCreateDate3, Date modifyDate3,
			String writer3, int noticeType3, String status3, int views3) {
		super();
		this.noticeNo3 = noticeNo3;
		this.noticeTitle3 = noticeTitle3;
		this.noticeContent3 = noticeContent3;
		NCreateDate3 = nCreateDate3;
		this.modifyDate3 = modifyDate3;
		this.writer3 = writer3;
		this.noticeType3 = noticeType3;
		this.status3 = status3;
		this.views3 = views3;
	}


	public int getNoticeNo3() {
		return noticeNo3;
	}


	public void setNoticeNo3(int noticeNo3) {
		this.noticeNo3 = noticeNo3;
	}


	public String getNoticeTitle3() {
		return noticeTitle3;
	}


	public void setNoticeTitle3(String noticeTitle3) {
		this.noticeTitle3 = noticeTitle3;
	}


	public String getNoticeContent3() {
		return noticeContent3;
	}


	public void setNoticeContent3(String noticeContent3) {
		this.noticeContent3 = noticeContent3;
	}


	public Date getNCreateDate3() {
		return NCreateDate3;
	}


	public void setNCreateDate3(Date nCreateDate3) {
		NCreateDate3 = nCreateDate3;
	}


	public Date getModifyDate3() {
		return modifyDate3;
	}


	public void setModifyDate3(Date modifyDate3) {
		this.modifyDate3 = modifyDate3;
	}


	public String getWriter3() {
		return writer3;
	}


	public void setWriter3(String writer3) {
		this.writer3 = writer3;
	}


	public int getNoticeType3() {
		return noticeType3;
	}


	public void setNoticeType3(int noticeType3) {
		this.noticeType3 = noticeType3;
	}


	public String getStatus3() {
		return status3;
	}


	public void setStatus3(String status3) {
		this.status3 = status3;
	}


	public int getViews3() {
		return views3;
	}


	public void setViews3(int views3) {
		this.views3 = views3;
	}


	@Override
	public String toString() {
		return "Notice3 [noticeNo3=" + noticeNo3 + ", noticeTitle3=" + noticeTitle3 + ", noticeContent3="
				+ noticeContent3 + ", NCreateDate3=" + NCreateDate3 + ", modifyDate3=" + modifyDate3 + ", writer3="
				+ writer3 + ", noticeType3=" + noticeType3 + ", status3=" + status3 + ", views3=" + views3 + "]";
	}

	

}
