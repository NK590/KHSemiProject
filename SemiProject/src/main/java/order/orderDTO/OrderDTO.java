package order.orderDTO;

public class OrderDTO {
		
			
	 	private Long orderNo; //order_no number 주문번호 primary key 
	    private String memberId; //member_id varchar2(100) 회원명 forin key 
	    private String orderName; //order_name varchar2(100) 수취인 이름 
	    private String orderContact; //order_contact varchar2(100) 수취인 연락처 
	    private String orderAddress; // order_address varchar2(100) 수취인 주소 
	    private String orderMsg; //  order_msg varchar2(200) 주문 메시지 
	    private String postMsg; //post_msg varchar2(200) 배송 매시지 
	    private String payNumber; // pay_number number 결제번호 
	    private String productCode; //product_code number 상품번호 
	    private String totalPay; // total_pay number 결제금액 
	    private String card; //card VARCHAR(100)  카드 0000

	    
	    public OrderDTO() {}


		public Long getOrderNo() {
			return orderNo;
		}


		public void setOrderNo(Long orderNo) {
			this.orderNo = orderNo;
		}


		public String getMemberId() {
			return memberId;
		}


		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}


		public String getOrderName() {
			return orderName;
		}


		public void setOrderName(String orderName) {
			this.orderName = orderName;
		}


		public String getOrderContact() {
			return orderContact;
		}


		public void setOrderContact(String orderContact) {
			this.orderContact = orderContact;
		}


		public String getOrderAddress() {
			return orderAddress;
		}


		public void setOrderAddress(String orderAddress) {
			this.orderAddress = orderAddress;
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


		public String getPayNumber() {
			return payNumber;
		}


		public void setPayNumber(String payNumber) {
			this.payNumber = payNumber;
		}


		public String getProductCode() {
			return productCode;
		}


		public void setProductCode(String productCode) {
			this.productCode = productCode;
		}


		public String getTotalPay() {
			return totalPay;
		}


		public void setTotalPay(String totalPay) {
			this.totalPay = totalPay;
		}


		public String getCard() {
			return card;
		}


		public void setCard(String card) {
			this.card = card;
		}

	    
	
		
	    
	    
	}
