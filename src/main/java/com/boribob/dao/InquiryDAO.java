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

import com.boribob.dto.InquiryDTO;

public class InquiryDAO {
	private BasicDataSource bds;
	public InquiryDAO() {
			try {
				Context iCtx = new InitialContext(); 
				Context envCtx = (Context)iCtx.lookup("java:comp/env");
				bds = (BasicDataSource)envCtx.lookup("jdbc/bds"); 
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	
	public int insert (InquiryDTO dto)throws Exception{//데이터삽입
	      String sql = "insert into tbl_inquiry values(seq_inquiry.nextval,?,?,?,sysdate,null) ";
	      try(Connection con = bds.getConnection(); 
	         PreparedStatement pstmt = con.prepareStatement(sql);){
	         pstmt.setString(1, dto.getId());
	         pstmt.setString(2, dto.getInquiryTitle());
	         pstmt.setString(3, dto.getInquiryContent());
	         
	         int rs = pstmt.executeUpdate();
	         return rs;
	      }
	   }
	public InquiryDTO selectBySeq(int seqInquiry)throws Exception {//seqInquiry로 문의글 찾기
		String sql = "select * from tbl_inquiry where seq_inquiry=? ";
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, seqInquiry);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String id = rs.getString("id");
				String inquiryTitle = rs.getString("inquiry_title");
				String inquiryContent = rs.getString("inquiry_content");
				String inquiryDate = dateToString(rs.getDate("inquiry_date"));
				String inquiryAnswer = rs.getString("inquiry_answer");
				InquiryDTO dto = new InquiryDTO(seqInquiry,id,inquiryTitle,inquiryContent,inquiryDate,inquiryAnswer);
				return dto;
			}return null;
		}
	}
	public ArrayList<InquiryDTO> selectAll(int start, int end)throws Exception{//페이징에 맞춰서 전체목록 보여주기
		String sql = "select * from(select tbl_inquiry.*,row_number() over(order by seq_inquiry desc)as num from tbl_inquiry)"
				+ "where num between ? and ?";
		try(Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1,start);
			pstmt.setInt(2,end);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<InquiryDTO> inquiryList = new ArrayList<>();
			
			while(rs.next()) {
				int seqInquiry = rs.getInt("seq_inquiry");
				String id = rs.getString("id");
				String inquiryTitle = rs.getString("inquiry_title");
				String inquiryContent = rs.getString("inquiry_content");
				String inquiryDate = dateToString(rs.getDate("inquiry_date"));
				String inquiryAnswer = rs.getString("inquiry_answer");
				inquiryList.add(new InquiryDTO(seqInquiry,id,inquiryTitle,inquiryContent,inquiryDate,inquiryAnswer));
				
			}return inquiryList;
		}
	}
	public int update(InquiryDTO dto)throws Exception{//수정
		String sql = "update tbl_inquiry set inquiry_title=?, inquiry_content=? where seq_inquiry=?";
		try(Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, dto.getInquiryTitle());
			pstmt.setString(2, dto.getInquiryContent());
			pstmt.setInt(3, dto.getSeqInquiry());
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	public int delete(int seq_inquiry)throws Exception{//삭제
		String sql = "delete from tbl_inquiry where seq_inquiry=?";
		try(Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, seq_inquiry);
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
	public ArrayList<InquiryDTO> selectById(String id)throws Exception{//로그인한 id가 작성한 문의글 모두 보여주기
		String sql = "select * from tbl_inquiry where id=? ";
		try (Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<InquiryDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				int seqInquiry = rs.getInt("seq_inquiry");
				String inquiryTitle = rs.getString("inquiry_title");
				String inquiryContent = rs.getString("inquiry_content");
				String inquiryDate = dateToString(rs.getDate("inquiry_date"));
				String inquiryAnswer = rs.getString("inquiry_answer");
				list.add(new InquiryDTO(seqInquiry,id,inquiryTitle,inquiryContent,inquiryDate,inquiryAnswer));
			}return list;
		}
	}
	public String dateToString(Date date) {//date를 String으로 변환하는 메서드
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(date);
	}
	public HashMap<String,Object> getPage(int currentPage)throws Exception{//현재페이지가 어디인지 구하는 메서드
		String sql = "select count (*) as totalCount from tbl_inquiry";
		try(Connection con = bds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			int totalCount = rs.getInt("totalCount");//전체게시글갯수
			int numberPerPage = 10; //한페이지에 몇개의 게시글
			int naviPerPage = 10;//몇개단의의 페이징
			int totalPage = 0; //총 몇페이지
			
			if(totalCount % numberPerPage >0) {
				totalPage = totalCount / numberPerPage +1;
			}else {
				totalPage = totalCount / numberPerPage;
			}
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
			
			//페이징하는데 필요한 것들
			HashMap<String, Object> map = new HashMap<>();
			map.put("startNavi", startNavi);
			map.put("endNavi", endNavi);
			map.put("makePrev", makePrev);
			map.put("makeNext", makeNext);
			
			return map;
		}
	}

}
