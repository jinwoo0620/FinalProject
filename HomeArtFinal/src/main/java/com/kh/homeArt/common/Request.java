package com.kh.homeArt.common;

public class Request {
	private int requestId;
	private int expertProfileNo;
	private String memberId;
	private String requestStatus;
	
	public Request() {
		// TODO Auto-generated constructor stub
	}

	public Request(int requestId, int expertProfileNo, String memberId, String requestStatus) {
		super();
		this.requestId = requestId;
		this.expertProfileNo = expertProfileNo;
		this.memberId = memberId;
		this.requestStatus = requestStatus;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public int getExpertProfileNo() {
		return expertProfileNo;
	}

	public void setExpertProfileNo(int expertProfileNo) {
		this.expertProfileNo = expertProfileNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	@Override
	public String toString() {
		return "Request [requestId=" + requestId + ", expertProfileNo=" + expertProfileNo + ", memberId=" + memberId
				+ ", requestStatus=" + requestStatus + "]";
	}	
	 
}
