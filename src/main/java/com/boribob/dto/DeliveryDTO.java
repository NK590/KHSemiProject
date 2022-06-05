package com.boribob.dto;

public class DeliveryDTO {
	
	private String deliveryId;
	private String deliveryStatus;
	private String postMsg;
	
	public DeliveryDTO() {}

	public DeliveryDTO(String deliveryId, String deliveryStatus, String postMsg) {
		super();
		this.deliveryId = deliveryId;
		this.deliveryStatus = deliveryStatus;
		this.postMsg = postMsg;
	}

	public String getDeliveryId() {
		return deliveryId;
	}

	public void setDeliveryId(String deliveryId) {
		this.deliveryId = deliveryId;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getPostMsg() {
		return postMsg;
	}

	public void setPostMsg(String postMsg) {
		this.postMsg = postMsg;
	}

	


	
	
	
}
