package com.boribob.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.boribob.dto.SubscribeDTO;

public class SubscribeDAO {
	private BasicDataSource bds;

	public SubscribeDAO() {
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
	
	// 구독 정보 입력
	public int insert(SubscribeDTO dto) throws Exception {
		String sql = "insert into tbl_subscribe values (seq_subscribe, ?, sysdate, ?)";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
		
			pstmt.setInt(1, dto.getProductCode());
			pstmt.setInt(2, dto.getSubscribeTerm());
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	// 아이디로 구독 정보 찾기
	public SubscribeDTO selectSubscribesById(String id) throws Exception {
		// tbl_subscribe 테이블과 tbl_member 테이블 join
		String sql = "select s.* form tbl_subscribe s join tbl_member m on s.id = m.id where m.id = ?";

		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
		
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			SubscribeDTO dto = new SubscribeDTO();
			if (rs.next()) {
				int productCode = rs.getInt("product_code");
				int seqSubscribe = rs.getInt("seq_subscribe");
				int subscribeStart = rs.getInt("subscribe_start");
				int subscribeTerm = rs.getInt("subscribe_term");
				
				dto.setProductCode(productCode);
				dto.setSeqSubscribe(seqSubscribe);
				dto.setSubscribeStart(subscribeStart);
				dto.setSubscribeTerm(subscribeTerm);
			}
			return dto;
		}
	}
}
