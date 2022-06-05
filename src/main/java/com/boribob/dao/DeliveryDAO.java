package com.boribob.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import order.orderDTO.DeliveryDTO;
import order.orderDTO.OrderDTO;

public class DeliveryDAO {

	
	private BasicDataSource bds; 

	public DeliveryDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx =(Context)iCtx.lookup("java:comp/env");
			bds=(BasicDataSource)envCtx.lookup("jdbc/bds");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	
	
	public int insertDelivery(DeliveryDTO dto) throws Exception{  // 주문정보 등록 
		String sql = "insert into tbl_delivery values(?,?,?)";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// order_no -> 시퀀스
			pstmt.setString(1, dto.getDeliveryId()); // -> 배송이름  
			pstmt.setString(2, dto.getDeliveryStatus());// -> 배송상태 
			pstmt.setString(3, dto.getPostMsg());// ->배송 메시지 
		


			int rs = pstmt.executeUpdate();

			return rs;
		}
	}
	

	public ArrayList<DeliveryDTO> findbyDeliveryNo(int deliverNo)throws Exception { //배달번호로 검색하기 
		String sql = "select * from tbl_delivery where delivery_name = ?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
		pstmt.setInt(1, deliverNo);
		
		ResultSet rs  = pstmt.executeQuery();
		ArrayList<DeliveryDTO> findDelivery = new ArrayList<DeliveryDTO>();
		
		while(rs.next()) {
			String deliveryId = rs.getString("delivery_name");
			String delivery_status = rs.getString("delivery_status");
			String postMsg = rs.getString("post_msg");
			
			 
			findDelivery.add(new DeliveryDTO(deliveryId,delivery_status,postMsg));
			
		}
		return findDelivery;
		}
	}
	
	
	public int updateOrder(DeliveryDTO dto)throws Exception {  // 배달정보 수정 
		String sql = "update tbl_delivery set delivery_status = ?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);){ 
			
			pstmt.setString(1, dto.getDeliveryStatus()); // -> 배달 상태 
			

			int rs = pstmt.executeUpdate();

			return rs;
		
		}
	}
	
	
}
