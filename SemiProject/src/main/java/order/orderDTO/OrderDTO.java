package order.orderDTO;

public class OrderDTO {
		
	 private Long orderNumber;
	    private String id;
	    private String orderName;
	    private String orderPhone;
	    private String orderAddress;
	    private String orderPostMsg;
	    private String orderMsg;
		
	    public OrderDTO() {};
	    
	    public OrderDTO(Long orderNumber, String id, String orderName, String orderPhone, String orderAddress,
				String orderPostMsg, String orderMsg) {
		
			this.orderNumber = orderNumber;
			this.id = id;
			this.orderName = orderName;
			this.orderPhone = orderPhone;
			this.orderAddress = orderAddress;
			this.orderPostMsg = orderPostMsg;
			this.orderMsg = orderMsg;
		}
	    

		public Long getOrderNumber() {
			return orderNumber;
		}

		public void setOrderNumber(Long orderNumber) {
			this.orderNumber = orderNumber;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
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

		public String getOrderAddress() {
			return orderAddress;
		}

		public void setOrderAddress(String orderAddress) {
			this.orderAddress = orderAddress;
		}

		public String getOrderPostMsg() {
			return orderPostMsg;
		}

		public void setOrderPostMsg(String orderPostMsg) {
			this.orderPostMsg = orderPostMsg;
		}

		public String getOrderMsg() {
			return orderMsg;
		}

		public void setOrderMsg(String orderMsg) {
			this.orderMsg = orderMsg;
		}
	
	    
	
	}
