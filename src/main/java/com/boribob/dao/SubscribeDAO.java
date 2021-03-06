package com.boribob.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

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
		String sql = "insert into tbl_subscribe values (?, ?, sysdate, ?)";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, dto.getId());
			pstmt.setInt(2, dto.getProductCode());
			pstmt.setInt(3, dto.getSubscribeTerm());
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	// 아이디로 구독 정보 찾기
	public SubscribeDTO selectSubscribesById(String id) throws Exception {
		// tbl_subscribe 테이블과 tbl_member 테이블 join
		String sql = "select * from tbl_subscribe where id = ?";

		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
		
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			SubscribeDTO dto = new SubscribeDTO();
			if (rs.next()) {
				
				int productCode = rs.getInt("product_code");
				String subscribeStart = getStringDate(rs.getDate("subscribe_start"));
				int subscribeTerm = rs.getInt("subscribe_term");
				
				dto.setId(id);
				dto.setProductCode(productCode);
				dto.setSubscribeStart(subscribeStart);
				dto.setSubscribeTerm(subscribeTerm);
			}
			return dto;
		}
	}
	
	// 아이디로 구독 여부 확인
	public boolean isSubscribedId(String id) throws Exception {
		String sql = "select * from tbl_subscribe where id = ?";

		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
		
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			return rs.next();
		}
	}
	
	// String 형을 Date 형으로
	public String getStringDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		return sdf.format(date);
	}
}
