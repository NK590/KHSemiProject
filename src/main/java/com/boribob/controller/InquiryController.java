package com.boribob.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boribob.dao.InquiryDAO;
import com.boribob.dto.InquiryDTO;
import com.boribob.dto.MemberDTO;
import com.google.gson.Gson;

@WebServlet("*.iq")
public class InquiryController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("요청uri: "+uri);
		request.setCharacterEncoding("utf-8");
		
		if(uri.equals("/inquiry.iq")) {
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			InquiryDAO dao = new InquiryDAO();
			try {
				//페이징
				HashMap map = dao.getPage(currentPage);
				System.out.println(map.get("startNavi"));
				System.out.println(map.get("endNavi"));
				System.out.println(map.get("makePrev"));
				System.out.println(map.get("makeNext"));
				
				//전체목록 불러오기
				System.out.println(currentPage);
				ArrayList<InquiryDTO> list = dao.selectAll(currentPage*10-9, currentPage*10);
				request.setAttribute("list",list);
				request.setAttribute("map", map);
			}catch(Exception e){
				e.printStackTrace();
			}request.getRequestDispatcher("/delivery/inquiry.jsp").forward(request, response);
		}
		else if(uri.equals("/inquiryWrite.iq")) {//문의글쓰기 페이지로 이동
			response.sendRedirect("delivery/inquiryWrite.jsp");
		}else if(uri.equals("/inquiryWriteProc.iq")) {//문의글쓰기 페이지
			String inquiryTitle = request.getParameter("inquiryTitle");
			String inquiryContent = request.getParameter("inquiryContent");
			System.out.println("글 제목 : " + inquiryTitle);
			System.out.println("글 내용 : " + inquiryContent);
			
			InquiryDAO dao = new InquiryDAO();
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
			try {
				String id = dto.getId();
				int rs = dao.insert(new InquiryDTO(0,id,inquiryTitle,inquiryContent,null,null));
				if(rs>0) {
					response.sendRedirect("/inquiry.iq?currentPage=1");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(uri.equals("/inquiryDetailview.iq")) {
			int seqInquiry = Integer.parseInt(request.getParameter("seqInquiry"));
			System.out.println(seqInquiry);
			InquiryDAO dao = new InquiryDAO();
			try{
				InquiryDTO dto = dao.selectBySeq(seqInquiry);
				request.setAttribute("dto", dto);
				Gson gson = new Gson();
				String rs = gson.toJson(dto);
				System.out.println(rs);
				response.setCharacterEncoding("utf-8");
				response.getWriter().append(rs);
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/delivery/inquiryDetailview.jsp").forward(request, response);
			
		}else if(uri.equals("/inquiryList.iq")) {//마이페이지에서 문의글 보기
			InquiryDAO dao = new InquiryDAO();
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
			try {
				String id = dto.getId();
				ArrayList<InquiryDTO> list =  dao.selectById(id);
				request.setAttribute("list", list);
			}catch(Exception e) {
				e.printStackTrace();
			}request.getRequestDispatcher("/mypage/inquiryList.jsp").forward(request, response);
		}else if(uri.equals("/inquiryListDetail.iq")) {
			int seqInquiry = Integer.parseInt(request.getParameter("seqInquiry"));
			System.out.println(seqInquiry);
			InquiryDAO dao = new InquiryDAO();
			try{
				InquiryDTO dto = dao.selectBySeq(seqInquiry);
				request.setAttribute("dto", dto);
				Gson gson = new Gson();
				String rs = gson.toJson(dto);
				System.out.println(rs);
				response.setCharacterEncoding("utf-8");
				response.getWriter().append(rs);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/inquiryUpdate.iq")) {//수정
			int seqInquiry = Integer.parseInt(request.getParameter("seqInquiry"));
			String inquiryTitle = request.getParameter("inquiryTitle");
			String inquiryContent = request.getParameter("inquiryContent");
			System.out.println(seqInquiry+inquiryTitle+inquiryContent);
			
			InquiryDAO dao = new InquiryDAO();
			try {
				int result = dao.update(new InquiryDTO(seqInquiry,null,inquiryTitle,inquiryContent,null,null));
				if(result>0){
					InquiryDTO dto = dao.selectBySeq(seqInquiry);
					request.setAttribute("dto", dto);
					Gson gson = new Gson();
					String rs = gson.toJson(dto);
					System.out.println(rs);
					response.setCharacterEncoding("utf-8");
					response.getWriter().append(rs);
				}else {
					response.getWriter().append("fail");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/inquiryDelete.iq")) {//문의글 삭제하기
			int seqInquiry = Integer.parseInt(request.getParameter("seqInquiry"));
			System.out.println(seqInquiry);
			InquiryDAO dao = new InquiryDAO();
			try {
				int rs = dao.delete(seqInquiry);
				if(rs>0) {
					response.sendRedirect("/inquiryList.iq");
				}else {
					System.out.println("실패");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	

}
