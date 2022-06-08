package com.boribob.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.boribob.dto.ProductDTO;

public class ProductDAO {

	private BasicDataSource bds;

	public ProductDAO() {
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

	// 상품 등록
	public int insert(ProductDTO dto) throws Exception {

		String sql = "insert into tbl_product values(?,?,?,?,?)";

		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setInt(1, dto.getProductCode()); // 상품 코드
			pstmt.setString(2, dto.getProductName()); // 상품명
			pstmt.setInt(3, dto.getProductPrice()); // 상품 가격
			pstmt.setString(4, dto.getProductContent()); // 상품 설명
			pstmt.setString(5, dto.getProductImg()); // 상품 이미지 경로

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	// 상품 삭제 -> 상품코드로 등록 상품 삭제
	public int delete(int productCode) throws Exception {

		String sql = "delete from tbl_product where product_code = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, productCode);

			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	// 상품 수정
	public int update(ProductDTO dto) throws Exception {

		String sql = "update tbl_product set product_code = ?, product_name = ?, product_price = ?, product_content = ?, product_img = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, dto.getProductCode()); // 상품 코드
			pstmt.setString(2, dto.getProductName()); // 상품명
			pstmt.setInt(3, dto.getProductPrice()); // 상품 가격
			pstmt.setString(4, dto.getProductContent()); // 상품 설명
			pstmt.setString(5, dto.getProductImg()); // 상품 이미지 경로
			int rs = pstmt.executeUpdate();
			return rs;
		}

	}

	// 모든 상품내역 출력
	public ArrayList<ProductDTO> selectAll() throws Exception {

		String sql = "select * from tbl_product";

		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			ResultSet rs = pstmt.executeQuery();

			ArrayList list = new ArrayList<>();
			while (rs.next()) {
				int productCode = rs.getInt(1);
				String productName = rs.getString(2);
				int productPrice = rs.getInt(3);
				String productContent = rs.getString(4);
				String productImg = rs.getString(5);

				list.add(new ProductDTO(productCode, productName, productPrice, productContent, productImg));
			}
			return list;
		}
	}

	// 원하는 상품 조회시 상품명으로 검색 (중복되는 상품명 없음)
	public ProductDTO selectByName(String productName) throws Exception {

		String sql = "select * from tbl_product where product_name = ? ";

		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, productName);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				int productCode = rs.getInt(1);
				int productPrice = rs.getInt(3);
				String productContent = rs.getString(4);
				String productImg = rs.getString(5);

				ProductDTO dto = new ProductDTO(productCode, productName, productPrice, productContent, productImg);
				return dto;
			}
			return null;
		}

	}
	
	// 원하는 상품 클릭시 해당 상품의 코드를 이용해 정보를 얻어내고 뿌려준다. 
	public ProductDTO selectByCode(int productCode)throws Exception {
		String sql = "select * from tbl_product where product_code = ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, productCode);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String productName = rs.getString(2);
			int productPrice = rs.getInt(3);
			String productContent = rs.getString(4);
			String productImg = rs.getString(5);
			ProductDTO dto = new ProductDTO(productCode,productName,productPrice,productContent,productImg);
			return dto;
		}
	}
	
	// 강아지 사료만 조회 
	public ArrayList<ProductDTO> selectByDog() throws Exception {
		String sql = "select * from tbl_product where product_code between 1 and 8 ";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<ProductDTO> list = new ArrayList<>();
			while(rs.next()) {
				int productCode = rs.getInt(1);
				String productName = rs.getString(2);
				int productPrice = rs.getInt(3);
				String productContent = rs.getString(4);
				String productImg = rs.getString(5);
				
				list.add(new ProductDTO(productCode,productName, productPrice, productContent, productImg));
			}return list;
			
		}
	}
	// 고양이 사료만 조회 
	public ArrayList<ProductDTO> selectByCat() throws Exception {
		String sql = "select * from tbl_product where product_code between 9 and 16 ";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<ProductDTO> list = new ArrayList<>();
			while(rs.next()) {
				
				int productCode = rs.getInt(1);
				String productName = rs.getString(2);
				int productPrice = rs.getInt(3);
				String productContent = rs.getString(4);
				String productImg = rs.getString(5);
				
				list.add(new ProductDTO(productCode,productName, productPrice, productContent, productImg));
			}return list;
			
		}
	}
}












