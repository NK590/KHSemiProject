package com.boribob.dto;

import java.util.Date;

public class OrderInfoDTO {// 주문에 필요한 회원정보, 구독정보, 상품정보 DTO 
	
	private String id;
	private String name;
	private String phone;
	private String post;
	private String roadAddress;
	private String detailAddress;
	private int productCode;
	private String subscribeStart;
	private int subscribeTerm;
	private int price;
	
	
	public OrderInfoDTO() {}


	public OrderInfoDTO(String id, String name, String phone, String post, String roadAddress, String detailAddress,
			int productCode, String subscribeStart, int subscribeTerm, int price) {
		
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.post = post;
		this.roadAddress = roadAddress;
		this.detailAddress = detailAddress;
		this.productCode = productCode;
		this.subscribeStart = subscribeStart;
		this.subscribeTerm = subscribeTerm;
		this.price = price;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getPost() {
		return post;
	}


	public void setPost(String post) {
		this.post = post;
	}


	public String getRoadAddress() {
		return roadAddress;
	}


	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}


	public String getDetailAddress() {
		return detailAddress;
	}


	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}


	public int getProductCode() {
		return productCode;
	}


	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}


	public String getSubscribeStart() {
		return subscribeStart;
	}


	public void setSubscribeStart(String subscribeStart) {
		this.subscribeStart = subscribeStart;
	}


	public int getSubscribeTerm() {
		return subscribeTerm;
	}


	public void setSubscribeTerm(int subscribeTerm) {
		this.subscribeTerm = subscribeTerm;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	@Override
	public String toString() {
		return "OrderInfoDTO [id=" + id + ", name=" + name + ", phone=" + phone + ", post=" + post + ", roadAddress="
				+ roadAddress + ", detailAddress=" + detailAddress + ", productCode=" + productCode
				+ ", subscribeStart=" + subscribeStart + ", subscribeTerm=" + subscribeTerm + ", price=" + price + "]";
	}
	
	

}
