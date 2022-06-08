package com.boribob.dao;

import java.lang.reflect.Member;
import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.boribob.dto.OrderDTO;
import com.boribob.dto.OrderInfoDTO;

public class OrderDAO {

	private BasicDataSource bds;

	public OrderDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context) iCtx.lookup("java:comp/env");
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}

	

	public OrderInfoDTO findbyMemberId(String memberId) throws Exception { // 회원아이디로 검색
		String sql = " select " + "m.id, " + "m.name, " + "m.phone, " + "m.post, " + "m.road_address, "
				+ "m.detail_address, " + "s.product_code, " + "to_char(s.subscribe_start,'YYYY/MM/DD'),"
				+ "s.subscribe_term, " + "s.price "
				+ "from tbl_member m Left outer join tbl_subscribe s on m.id = s.id where m.id =? ";

		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, memberId);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String post = rs.getString("post");
				String roadAddress = rs.getString("road_address");
				String detailAddress = rs.getString("detail_address");
				int productCode = rs.getInt("product_code");
				String subscribeStart = rs.getString("to_char(s.subscribe_start,'YYYY/MM/DD')");
				int subscribeTerm = rs.getInt("subscribe_term");
				int price = rs.getInt("price");

				return new OrderInfoDTO(id, name, phone, post, roadAddress, detailAddress, productCode, subscribeStart,
						subscribeTerm, price);

			} else {
				return null;
			}
		}

	}

	public int insertOrder(OrderDTO dto) throws Exception { // 주문정보 등록
		String sql = "insert into tbl_order values(order_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try (Connection con = getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// order_no -> 시퀀스
			pstmt.setString(1, dto.getId()); // -> 회원 아이디
			pstmt.setString(2, dto.getOrderName());// -> 수취자
			pstmt.setString(3, dto.getOrderPhone());// -> 수취인 연락처
			pstmt.setString(4, dto.getOrderPost()); // -> 우편번호
			pstmt.setString(5, dto.getOrderRoadAddress()); // -> 수취인 주소
			pstmt.setString(6, dto.getOrderDetailAddress()); // -> 수취인 상세주소
			pstmt.setString(7, dto.getOrderMsg()); // -> 수취인 주문 메시지
			pstmt.setString(8, dto.getPostMsg()); // -> 수취인 배송메시지
			pstmt.setInt(9, dto.getProductCode()); // -> 상품코드
			pstmt.setString(10, dto.getSubscribeStart()); // 구독 시작일
			pstmt.setInt(11, dto.getSubscribeTerm()); // ->구독기간
			pstmt.setInt(12, dto.getPrice()); // -> 가격
			pstmt.setString(13, dto.getPaySuccess()); // 결제 성공여부
			pstmt.setString(14, dto.getPayId()); // 결제 ID
			pstmt.setString(15, dto.getPayTradeId()); // 상점 거래 ID
			pstmt.setString(16, dto.getPayAmount()); // 결제금액
			pstmt.setString(17, dto.getPayApproval()); // 승인여부
			pstmt.setString(18, dto.getDeliveryStatus()); // 배송상태 
			pstmt.setString(19, dto.getExpectedArrival()); // 배송예정일 
			pstmt.setString(20, dto.getDeliveryCount()); // 배송회차 

			int rs = pstmt.executeUpdate();
		
			return rs;
		}

	}

	public ArrayList<OrderDTO> findListById(String memberId)throws Exception { // 주문자명으로 주문리스트 검색 
		String sql = "select  * from tbl_order where member_id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, memberId);

			ResultSet rs = pstmt.executeQuery();
			ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();

			while (rs.next()) {
				Integer orderId = rs.getInt("order_id");
				String id = rs.getString("member_id");
				String orderName = rs.getString("order_name");
				String orderPhone = rs.getString("order_phone");
				String orderPost = rs.getString("order_post");
				String orderRoadAddress = rs.getString("order_road_address");
				String orderDetailAddress = rs.getString("order_detail_address");
				String orderMsg = rs.getString("order_msg");
				String postMsg = rs.getString("post_msg");
				int productCode = rs.getInt("product_code");
				String subscribeStart = rs.getString("subscribeStart");
				int subscribeTerm = rs.getInt("subscribeTerm"); 
				int price = rs.getInt("price");
				
				String paySuccess = rs.getString("pay_success");
				String payId = rs.getString("pay_id");
				String payTradeId = rs.getString("pay_tradeid");
				String payAmount = rs.getString("pay_amount");
				String payApproval = rs.getString("pay_approval");
				
				String deliveryStatus = rs.getString("delivery_status");
				String expectedArrival = rs.getString("expected_arrival");
				String deliveryCount = rs.getString("delivery_count");
			     
			     list.add(new OrderDTO(orderId,id,orderName,orderPhone,orderPost,orderRoadAddress,orderDetailAddress
							,orderMsg,postMsg,productCode,subscribeStart,subscribeTerm,
							price,paySuccess,payId,payTradeId,payAmount,payApproval,deliveryStatus,
							expectedArrival,deliveryCount));
			}
			return list;

		}
	}
	
	public OrderDTO findByOrderId(Integer orderId)throws Exception { // 주문번호로 단건 조회  
		String sql = "select  * from tbl_order where order_id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, orderId);

			ResultSet rs = pstmt.executeQuery();
			

			while (rs.next()) {
				
				String id = rs.getString("member_id");
				String orderName = rs.getString("order_name");
				String orderPhone = rs.getString("order_phone");
				String orderPost = rs.getString("order_post");
				String orderRoadAddress = rs.getString("order_road_address");
				String orderDetailAddress = rs.getString("order_detail_address");
				String orderMsg = rs.getString("order_msg");
				String postMsg = rs.getString("post_msg");
				int productCode = rs.getInt("product_code");
				String subscribeStart = rs.getString("subscribeStart");
				int subscribeTerm = rs.getInt("subscribeTerm"); 
				int price = rs.getInt("price");
				
				String paySuccess = rs.getString("pay_success");
				String payId = rs.getString("pay_id");
				String payTradeId = rs.getString("pay_tradeid");
				String payAmount = rs.getString("pay_amount");
				String payApproval = rs.getString("pay_approval");
				
				String deliveryStatus = rs.getString("delivery_status");
				String expectedArrival = rs.getString("expected_arrival");
				String deliveryCount = rs.getString("delivery_count");
				
				 OrderDTO orderDTO =	new OrderDTO(orderId,id,orderName,orderPhone,orderPost,orderRoadAddress,orderDetailAddress
						,orderMsg,postMsg,productCode,subscribeStart,subscribeTerm,
						price,paySuccess,payId,payTradeId,payAmount,payApproval,deliveryStatus,
						expectedArrival,deliveryCount);
				 return orderDTO;
			}
			   return null;
			

		}
	}
	
	public ArrayList<OrderDTO> findAllList()throws Exception { // 전체주문 검색 
		String sql = "select  * from tbl_order";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			

			ResultSet rs = pstmt.executeQuery();
			ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();

			while (rs.next()) {
				Integer orderId = rs.getInt("order_id");
				String id = rs.getString("member_id");
				String orderName = rs.getString("order_name");
				String orderPhone = rs.getString("order_phone");
				String orderPost = rs.getString("order_post");
				String orderRoadAddress = rs.getString("order_road_address");
				String orderDetailAddress = rs.getString("order_detail_address");
				String orderMsg = rs.getString("order_msg");
				String postMsg = rs.getString("post_msg");
				int productCode = rs.getInt("product_code");
				String subscribeStart = rs.getString("subscribeStart");
				int subscribeTerm = rs.getInt("subscribeTerm"); 
				int price = rs.getInt("price");
				
				String paySuccess = rs.getString("pay_success");
				String payId = rs.getString("pay_id");
				String payTradeId = rs.getString("pay_tradeid");
				String payAmount = rs.getString("pay_amount");
				String payApproval = rs.getString("pay_approval");
				
				String deliveryStatus = rs.getString("delivery_status");
				String expectedArrival = rs.getString("expected_arrival");
				String deliveryCount = rs.getString("delivery_count");
			     
			     list.add(new OrderDTO(orderId,id,orderName,orderPhone,orderPost,orderRoadAddress,orderDetailAddress
							,orderMsg,postMsg,productCode,subscribeStart,subscribeTerm,
							price,paySuccess,payId,payTradeId,payAmount,payApproval,deliveryStatus,
							expectedArrival,deliveryCount));
			}
			return list;

		}
	}

	public int modifyOrder(Integer orderId,String deliveryStatus,String expectedArraival, String deliveryCount) throws Exception { // 배송정보 수정 
		String sql = "update tbl_order set delivery_status =? ,expected_arrival =?,delivery_count=? where order_id =?";
				
			try (Connection con = getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			
			pstmt.setString(1, deliveryStatus); // 배송상태 
			pstmt.setString(2,expectedArraival ); // 배송예정일 
			pstmt.setString(3,deliveryCount ); // 배송회차 
			pstmt.setInt(4,orderId ); // -> 회원 아이디
			int rs = pstmt.executeUpdate();
		
			return rs;
		}

	}

}
