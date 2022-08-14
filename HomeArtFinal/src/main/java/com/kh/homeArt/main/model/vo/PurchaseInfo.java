package com.kh.homeArt.main.model.vo;

public class PurchaseInfo {
	private int goodsId;
	private String goodsTitle;
	private int goodsPrice;
	private String goodsCompay;
	private String status;
	private String originFileName;
	private String reNameFileName;
	private String imageStatus;
	
	public PurchaseInfo() {}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsTitle() {
		return goodsTitle;
	}

	public void setGoodsTitle(String goodsTitle) {
		this.goodsTitle = goodsTitle;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getGoodsCompay() {
		return goodsCompay;
	}

	public void setGoodsCompay(String goodsCompay) {
		this.goodsCompay = goodsCompay;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getReNameFileName() {
		return reNameFileName;
	}

	public void setReNameFileName(String reNameFileName) {
		this.reNameFileName = reNameFileName;
	}

	public String getImageStatus() {
		return imageStatus;
	}

	public void setImageStatus(String imageStatus) {
		this.imageStatus = imageStatus;
	}

	@Override
	public String toString() {
		return "PurchaseInfo [goodsId=" + goodsId + ", goodsTitle=" + goodsTitle + ", goodsPrice=" + goodsPrice
				+ ", goodsCompay=" + goodsCompay + ", status=" + status + ", originFileName=" + originFileName
				+ ", reNameFileName=" + reNameFileName + ", imageStatus=" + imageStatus + "]";
	}
}
