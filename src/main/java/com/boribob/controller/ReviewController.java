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
import com.boribob.dao.ReviewDAO;
import com.boribob.dto.InquiryDTO;
import com.boribob.dto.MemberDTO;
import com.boribob.dto.ReviewDTO;
import com.google.gson.Gson;

@WebServlet("*.bo")
public class ReviewController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);
		request.setCharacterEncoding("utf-8");

		if (uri.equals("/review.bo")) {
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			ReviewDAO dao = new ReviewDAO();
			try {

				HashMap map = dao.getPage(currentPage);
				System.out.println(map.get("startNavi"));
				System.out.println(map.get("endNavi"));
				System.out.println(map.get("makePrev"));
				System.out.println(map.get("makeNext"));

				// 전체목록 불러오기
				System.out.println(currentPage);
				ArrayList<ReviewDTO> list = dao.selectAll(currentPage * 10 - 9, currentPage * 10);
				request.setAttribute("list", list);
				request.setAttribute("map", map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/review/review.jsp").forward(request, response);

		} else if (uri.equals("/write.bo")) {
			response.sendRedirect("/review/write.jsp");
			// 리뷰작성 요청
		} else if (uri.equals("/writeProc.bo")) {
			String reviewTitle = request.getParameter("reviewTitle");
			String reviewContent = request.getParameter("reviewContent");
			System.out.println("리뷰 제목 : " + reviewTitle);
			System.out.println("리뷰 내용 : " + reviewContent);

			ReviewDAO dao = new ReviewDAO();
			MemberDTO dto = (MemberDTO) request.getSession().getAttribute("loginSession");
			try {
				String id = dto.getId();

				int rs = dao.insert(new ReviewDTO(0, 0, id, reviewTitle, reviewContent, null, null));
				if (rs > 0) {
					response.sendRedirect("/review.bo?currentPage=1");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 게시물 상세보기 요청
		} else if (uri.equals("/detailView.bo")) {
			int seqReview = Integer.parseInt(request.getParameter("seqReview"));
			System.out.println("seqReview : " + seqReview);
			ReviewDAO ReviewDAO = new ReviewDAO();
			try {

				ReviewDTO dto = ReviewDAO.selectBySeq(seqReview);
				request.setAttribute("dto", dto);

			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/review/detailView.jsp").forward(request, response);

		}
			
		
		
		// 게시물 수정 페이지 요청
//		 else if (uri.equals("/update.bo")) {
//			int seqReview = Integer.parseInt(request.getParameter("seqReview"));
//			System.out.println("seqReview : " + seqReview);
//
//			ReviewDAO dao = new ReviewDAO();
//			try {
//				ReviewDTO dto = dao.selectBySeq(seqReview);
//				request.setAttribute("dto", dto);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//
//			request.getRequestDispatcher("/review/update.jsp").forward(request, response);
//			// 게시물 수정 요청
//		} else if (uri.equals("/updateProc.bo")) {
//			int seqReview = Integer.parseInt(request.getParameter("seqReview"));
//			String reviewTitle = request.getParameter("reviewTitle");
//			String reviewContent = request.getParameter("reviewContent");
//
//			ReviewDAO dao = new ReviewDAO();
//			try {
//				int rs = dao.update(new ReviewDTO(seqReview, 0, null, reviewTitle, reviewContent, null, null));
//				if (rs > 0) {
//			// 수정한 게시물 바로 확인하기
//			response.sendRedirect("/detailView.bo?seqReview=" + seqReview);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//
//		} else if (uri.equals("/deleteProc.bo")) {// 삭제 요청
//			int seqReview = Integer.parseInt(request.getParameter("seqReview"));
//			System.out.println("seqReview :" + seqReview);
//
//			ReviewDAO dao = new ReviewDAO();
//			// 시퀀스번호 이용해 tbl_Review에서 게시글 삭제
//			try {
//				int rs = dao.delete(seqReview);
//				if (rs > 0) {
//					// 삭제완료 후에는 게시글 목록을 요청하도록.
//					response.sendRedirect("/review.bo");
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		
		else if(uri.equals("/reviewList.bo")) {//마이페이지에서 리뷰글 보기
			ReviewDAO dao = new ReviewDAO();
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
			try {
				String id = dto.getId();
				ArrayList<ReviewDTO> list =  dao.selectById(id);
				request.setAttribute("list", list);
			}catch(Exception e) {
				e.printStackTrace();
			}request.getRequestDispatcher("/mypage/reviewList.jsp").forward(request, response);
			
		}else if(uri.equals("/reviewListDetail.bo")) { // 리뷰글 클릭하게 상세보기
			int seqReview = Integer.parseInt(request.getParameter("seqReview"));
			System.out.println(seqReview);
			ReviewDAO dao = new ReviewDAO();
			try{
				ReviewDTO dto = dao.selectBySeq(seqReview);
				request.setAttribute("dto", dto);
				Gson gson = new Gson();
				String rs = gson.toJson(dto);
				System.out.println(rs);
				response.setCharacterEncoding("utf-8");
				response.getWriter().append(rs);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/reviewUpdate.bo")) {//수정
			int seqReview = Integer.parseInt(request.getParameter("seqReview"));
			String reviewTitle = request.getParameter("reviewTitle");
			String reviewContent = request.getParameter("reviewContent");
			System.out.println(seqReview+" : "+reviewTitle+" : "+reviewContent);
			
			ReviewDAO dao = new ReviewDAO();
			
			try {		
				
				int result = dao.update(new ReviewDTO(seqReview, 0,null,reviewTitle, reviewContent,null,null));
				if(result>0){
					ReviewDTO dto = dao.selectBySeq(seqReview);
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
		}else if(uri.equals("/reviewDelete.bo")) {//문의글 삭제하기
			int seqReview= Integer.parseInt(request.getParameter("seqReview"));
			System.out.println(seqReview);
			ReviewDAO dao = new ReviewDAO();
			try {
				int rs = dao.delete(seqReview);
				if(rs>0) {
					response.sendRedirect("/reviewList.bo");
				}else {
					System.out.println("실패");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		
		

		
	}
}

















