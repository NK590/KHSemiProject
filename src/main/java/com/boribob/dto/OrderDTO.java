package com.boribob.dto;

public class OrderDTO {
		
			
	private Integer orderId; //order_id number 주문번호 primary key
	private String id;  //회원 아이디 
 	
	
	private String orderName;//수취인 이름 
    private String orderPhone; // 수취인 연락처 
    private String orderPost; //  수취인 우편번호   
    private String orderRoadAddress; //  수취인 주소  
    private String orderDetailAddress; //  수취인 상세주소  
    private String orderMsg; // 주문메시지 
    private String postMsg; //  배송메시지
    
    private int productName; // 상품코드 
    private String subscribeStart; // 구독시작일 
    private int subscribeTerm; //구독 기간 
    private int price; // 가격 
    
    private String paySuccess;  //  결제성공여부 
    private String payId;       //  고유아이디 
    private String payTradeId;	//  상점 거래 ID 
    private String payAmount;   //  결제금액 
    private String payApproval; //  카드승인번호 
    
    public OrderDTO(){}
    
    
    

	public OrderDTO(Integer orderId, String id, String orderName, String orderPhone, String orderPost,
			String orderRoadAddress, String orderDetailAddress, String orderMsg, String postMsg, int productName,
			String subscribeStart, int subscribeTerm, int price, String paySuccess, String payId, String payTradeId,
			String payAmount, String payApproval) {
		super();
		this.orderId = orderId;
		this.id = id;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderPost = orderPost;
		this.orderRoadAddress = orderRoadAddress;
		this.orderDetailAddress = orderDetailAddress;
		this.orderMsg = orderMsg;
		this.postMsg = postMsg;
		this.productName = productName;
		this.subscribeStart = subscribeStart;
		this.subscribeTerm = subscribeTerm;
		this.price = price;
		this.paySuccess = paySuccess;
		this.payId = payId;
		this.payTradeId = payTradeId;
		this.payAmount = payAmount;
		this.payApproval = payApproval;
	}




	public OrderDTO(String id, String orderName, String orderPhone, String orderPost, String orderRoadAddress,
			String orderDetailAddress, String orderMsg, String postMsg, int productName, String subscribeStart,
			int subscribeTerm, int price, String paySuccess, String payId, String payTradeId, String payAmount,
			String payApproval) {
		super();
		this.id = id;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderPost = orderPost;
		this.orderRoadAddress = orderRoadAddress;
		this.orderDetailAddress = orderDetailAddress;
		this.orderMsg = orderMsg;
		this.postMsg = postMsg;
		this.productName = productName;
		this.subscribeStart = subscribeStart;
		this.subscribeTerm = subscribeTerm;
		this.price = price;
		this.paySuccess = paySuccess;
		this.payId = payId;
		this.payTradeId = payTradeId;
		this.payAmount = payAmount;
		this.payApproval = payApproval;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public String getId() {
		return id;
	}

	public String getOrderName() {
		return orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public String getOrderPost() {
		return orderPost;
	}

	public String getOrderRoadAddress() {
		return orderRoadAddress;
	}

	public String getOrderDetailAddress() {
		return orderDetailAddress;
	}

	public String getOrderMsg() {
		return orderMsg;
	}

	public String getPostMsg() {
		return postMsg;
	}

	public int getProductName() {
		return productName;
	}

	public String getSubscribeStart() {
		return subscribeStart;
	}

	public int getSubscribeTerm() {
		return subscribeTerm;
	}

	public int getPrice() {
		return price;
	}

	public String getPaySuccess() {
		return paySuccess;
	}

	public String getPayId() {
		return payId;
	}

	public String getPayTradeId() {
		return payTradeId;
	}

	public String getPayAmount() {
		return payAmount;
	}

	public String getPayApproval() {
		return payApproval;
	}


    

	    
	    
	}
