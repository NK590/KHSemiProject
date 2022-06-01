package com.boribob.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.boribob.dto.PetDTO;
import com.boribob.utils.Algorithms;

public class PetDAO {
	private BasicDataSource bds;

	public PetDAO() {
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
	
	// 펫 정보 입력
	public int insert(PetDTO dto) throws Exception {
		String sql = "insert into tbl_pet values (?, ?, ?, ?, ?, ?, ?)";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareCall(sql)) {
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPetName());
			pstmt.setInt(3, dto.getPetAge());
			pstmt.setInt(4, dto.getPetAllergy());
			pstmt.setInt(5, dto.getPetWeight());
			pstmt.setString(6, dto.getPetKind());
			pstmt.setString(7, dto.getPetType());
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	
	// 펫의 정보를 비트 배열로 저장
	public ArrayList<Integer> getPetStatus(PetDTO dto) throws Exception {
		ArrayList<Integer> petDetails = new ArrayList<>();
		
		// 인덱스 순서대로 견/묘 구분, 나이, 알러지 종류, 몸무게
		// 견/묘 구분 입력
		if (dto.getPetType() == "dog") petDetails.add(0); // 개
		else if (dto.getPetType() == "cat") petDetails.add(1); // 고양이
		
		// 나이 입력
		if (dto.getPetAge() <= 5) petDetails.add(0); // 5살 이하
		else petDetails.add(1); // 6살 이상
		
		// 알러지 종류 입력
		petDetails.add(dto.getPetAllergy()); // 0이면 없음, 1이면 있음
		
		// 몸무게 입력
		if (dto.getPetWeight() <= 5) petDetails.add(0); // 5kg 이하
		else petDetails.add(1); // 6kg 이상
		
		return petDetails;
	}
	
	// 펫의 비트배열 정보를 숫자(상품번호)로 치환
	public int getProductNum(ArrayList<Integer> petDetails) throws Exception {
		Algorithms algorithm = new Algorithms();
		return algorithm.bitmask(petDetails, 0);
	}
	
	
}