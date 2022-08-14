package com.kh.homeArt.notice.model.vo;

import java.sql.Date;

public class Notice2 {
	
	private int noticeNo2;
	private String noticeTitle2;
	private String noticeContent2;
	private Date NCreateDate2;
	private Date modifyDate2;
	private String writer2;
	private int noticeType2;
	private String status2;
	private int views2;
	
	
	public Notice2() {}


	public Notice2(int noticeNo2, String noticeTitle2, String noticeContent2, Date nCreateDate2, Date modifyDate2,
			String writer2, int noticeType2, String status2, int views2) {
		super();
		this.noticeNo2 = noticeNo2;
		this.noticeTitle2 = noticeTitle2;
		this.noticeContent2 = noticeContent2;
		NCreateDate2 = nCreateDate2;
		this.modifyDate2 = modifyDate2;
		this.writer2 = writer2;
		this.noticeType2 = noticeType2;
		this.status2 = status2;
		this.views2 = views2;
	}


	public int getNoticeNo2() {
		return noticeNo2;
	}


	public void setNoticeNo2(int noticeNo2) {
		this.noticeNo2 = noticeNo2;
	}


	public String getNoticeTitle2() {
		return noticeTitle2;
	}


	public void setNoticeTitle2(String noticeTitle2) {
		this.noticeTitle2 = noticeTitle2;
	}


	public String getNoticeContent2() {
		return noticeContent2;
	}


	public void setNoticeContent2(String noticeContent2) {
		this.noticeContent2 = noticeContent2;
	}


	public Date getNCreateDate2() {
		return NCreateDate2;
	}


	public void setNCreateDate2(Date nCreateDate2) {
		NCreateDate2 = nCreateDate2;
	}


	public Date getModifyDate2() {
		return modifyDate2;
	}


	public void setModifyDate2(Date modifyDate2) {
		this.modifyDate2 = modifyDate2;
	}


	public String getWriter2() {
		return writer2;
	}


	public void setWriter2(String writer2) {
		this.writer2 = writer2;
	}


	public int getNoticeType2() {
		return noticeType2;
	}


	public void setNoticeType2(int noticeType2) {
		this.noticeType2 = noticeType2;
	}


	public String getStatus2() {
		return status2;
	}


	public void setStatus2(String status2) {
		this.status2 = status2;
	}


	public int getViews2() {
		return views2;
	}


	public void setViews2(int views2) {
		this.views2 = views2;
	}


	@Override
	public String toString() {
		return "Notice2 [noticeNo2=" + noticeNo2 + ", noticeTitle2=" + noticeTitle2 + ", noticeContent2="
				+ noticeContent2 + ", NCreateDate2=" + NCreateDate2 + ", modifyDate2=" + modifyDate2 + ", writer2="
				+ writer2 + ", noticeType2=" + noticeType2 + ", status2=" + status2 + ", views2=" + views2 + "]";
	}

	
}
