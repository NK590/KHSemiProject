package com.boribob.dto;

public class OrderDTO {
		
			
	private int orderNo; //order_no number 주문번호 primary key
 	private int seqSubscribe;
	private String orderName;//수취인 이름 
    private String orderPhone; // 수취인 연락처 
    private String orderPostCode; //  수취인 우편번호 
    private String orderAddress; //  수취인 주소  
    private String orderDetailAddress; //수취인 상세주소 
    private String orderMsg; // 주문메시지 
    private String postMsg; //  배송메시지
    
  
    
	public OrderDTO(){}



	public OrderDTO(int orderNo, int seqSubscribe, String orderName, String orderPhone, String orderPostCode,
			String orderAddress, String orderDetailAddress, String orderMsg, String postMsg) {
		super();
		this.orderNo = orderNo;
		this.seqSubscribe = seqSubscribe;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderPostCode = orderPostCode;
		this.orderAddress = orderAddress;
		this.orderDetailAddress = orderDetailAddress;
		this.orderMsg = orderMsg;
		this.postMsg = postMsg;
	}



	public int getOrderNo() {
		return orderNo;
	}



	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}



	public int getSeqSubscribe() {
		return seqSubscribe;
	}



	public void setSeqSubscribe(int seqSubscribe) {
		this.seqSubscribe = seqSubscribe;
	}



	public String getOrderName() {
		return orderName;
	}



	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}



	public String getOrderPhone() {
		return orderPhone;
	}



	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}



	public String getOrderPostCode() {
		return orderPostCode;
	}



	public void setOrderPostCode(String orderPostCode) {
		this.orderPostCode = orderPostCode;
	}



	public String getOrderAddress() {
		return orderAddress;
	}



	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}



	public String getOrderDetailAddress() {
		return orderDetailAddress;
	}



	public void setOrderDetailAddress(String orderDetailAddress) {
		this.orderDetailAddress = orderDetailAddress;
	}



	public String getOrderMsg() {
		return orderMsg;
	}



	public void setOrderMsg(String orderMsg) {
		this.orderMsg = orderMsg;
	}



	public String getPostMsg() {
		return postMsg;
	}



	public void setPostMsg(String postMsg) {
		this.postMsg = postMsg;
	}


	

	
	
	
	
	    
	    
	    
	    
		
	    
	    
	}
