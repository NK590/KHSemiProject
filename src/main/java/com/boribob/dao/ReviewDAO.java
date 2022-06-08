package com.boribob.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;


import com.boribob.dto.ReviewDTO;

public class ReviewDAO {
	private BasicDataSource bds;
	public ReviewDAO() {
		try {
			Context iCtx = new InitialContext(); 
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds"); 
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	//게시물에 번호 부여하기
	public int getNewSeq() throws Exception{
		String sql = "select seq_review.nextval from dual";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int seqReview = rs.getInt(1);
			return seqReview;			
		}
	}


	//리뷰 삭제
	public int delete(int seq_review) throws Exception {
		String sql = "delete from tbl_review where seq_review = ?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, seq_review);
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}

	//리뷰 수정 ok
	public int update(ReviewDTO dto) throws Exception {
		String sql = "update tbl_review set riview_title=?, review_content=? where seq_review=?";
		try (Connection con = bds.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, dto.getReviewTitle());
			pstmt.setString(2, dto.getReviewContent());
			pstmt.setInt(3, dto.getSeqReview());
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}


	//작성된 글을 테이블에 넣기 ok
	public int insert(ReviewDTO dto) throws Exception{
		String sql = "insert into tbl_review values(seq_review.nextval,?,?,?,?,sysdate,null)";
		try (Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
	
			pstmt.setInt(1, dto.getProductCode());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getReviewTitle());
			pstmt.setString(4, dto.getReviewContent());
		
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	//상세보기 페이지를 시퀀스 넘버 기준으로 ok
	public ReviewDTO selectBySeq(int seqReview) throws Exception{
		String sql = "SELECT * FROM TBL_review WHERE seq_review = ?";

		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){

			pstmt.setInt(1, seqReview);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				String id = rs.getString("id");
				int productCode = rs.getInt("product_code");
				String reviewTitle = rs.getString("review_title");
				String reviewContent = rs.getString("review_conntent");
				String productImg = rs.getString("product_img");
				String reviewDate = dateToString(rs.getDate("review_date"));
				ReviewDTO dto = new ReviewDTO(seqReview, productCode, id, reviewTitle, reviewContent, productImg, reviewDate);
				return dto;
			}
			return null;
		}
	}
	//전체목록 띄워주기
	public ArrayList<ReviewDTO> selectAll(int start, int end)throws Exception{//페이징에 맞춰서 전체목록 보여주기
		String sql = "select * from(select tbl_Review.*,row_number() over(order by seq_review desc)as num from tbl_review)"
				+ "where num between ? and ?";
		try(Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1,start);
			pstmt.setInt(2,end);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<ReviewDTO> ReviewList = new ArrayList<>();
			
			while(rs.next()) {
				int seqReview = rs.getInt("seq_review");
				String id = rs.getString("id");
				int productCode = rs.getInt("product_code");
				String reviewTitle = rs.getString("review_title");
				String reviewContent = rs.getString("review_conntent");
				String productImg = rs.getString("product_img");
				String reviewDate = dateToString(rs.getDate("review_date"));
				ReviewList.add(new ReviewDTO(seqReview,productCode,id,reviewTitle,reviewContent,productImg,reviewDate));
				
			}return ReviewList;
		}
	}
	//date > string 
	public String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(date);
	}
	//현재 페이지 위치로 리스트 보여주기 
		public HashMap<String,Object> getPage(int currentPage)throws Exception{
			String sql = "select count (*) as totalCount from tbl_review";
			try(Connection con = bds.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql)){
				
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				//전체 게시글, 토탈 페이지, 페이지 당 게시물 개수, 페이징 단위
				int totalCount = rs.getInt("totalCount");
				int totalPage = 0;
				int numberPerPage = 10; 
				int naviPerPage = 10;
				
				
				if(totalCount % numberPerPage >0) {
					totalPage = totalCount / numberPerPage +1;
				}else {
					totalPage = totalCount / numberPerPage;
				}
				//리뷰게시판 첫 페이지를 1페이지로 픽스
				if(currentPage<1) {
					currentPage=1;
				}else if(currentPage>totalPage) {
					currentPage = totalPage;
				}
				
				int startNavi = ((currentPage-1)/naviPerPage)*naviPerPage+1;
				int endNavi = startNavi + naviPerPage-1;
				if(totalPage<endNavi) {
					endNavi = totalPage;
				}
				
				//< > 모양 
				boolean makePrev = true;
				boolean makeNext = true;
				if(startNavi==1) {
					makePrev = false;
				}
				if(endNavi==totalPage) {
					makeNext = false;
				}
				
			
				HashMap<String, Object> map = new HashMap<>();
				map.put("startNavi", startNavi);
				map.put("endNavi", endNavi);
				map.put("makePrev", makePrev);
				map.put("makeNext", makeNext);
				
				return map;
			}
		}

	}
