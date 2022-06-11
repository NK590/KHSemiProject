package com.boribob.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boribob.dao.FileDAO;
import com.boribob.dao.ReviewDAO;
import com.boribob.dto.FileDTO;
import com.boribob.dto.MemberDTO;
import com.boribob.dto.ReviewDTO;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			String filePath = request.getServletContext().getRealPath("files");
			System.out.println("filePath : " + filePath);
			
			File dir = new File(filePath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			int maxSize = 1024*1024*10;
			
			try {
				// 서버의 경로에 파일 저장하기 
				MultipartRequest multi = new MultipartRequest(request,filePath,maxSize,"utf-8",new DefaultFileRenamePolicy());
				
				// 아이디 뽑아내기
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
				String id = dto.getId();
				
				// MultipartRequest 에서 제목, 내용 뽑아내기
				String reviewTitle = multi.getParameter("reviewTitle");
				String reviewContent = multi.getParameter("reviewContent");
				
				// MultipartRequest에서 파일태그의 name을 이용해 원본파일명, 실제 서버에 저장된 파일이름 뽑아내기
				String oriName = multi.getOriginalFileName("file");
				String sysName = multi.getFilesystemName("file");
	
	
				ReviewDAO dao = new ReviewDAO();
				FileDAO daoFile = new FileDAO();
				
				try {
					// 게시글과 파일 데이터 저장하기 위해 새로운 게시글 번호 뽑아내기
					int seqReview = dao.getNewSeq();

					// 위에서 뽑아낸 게시글 번호를 활용하여 게시글, 파일 정보 DB에 저장 
					int rs = dao.insert(new ReviewDTO(seqReview, 0, id, reviewTitle, reviewContent, null, null));
					int rsFile = daoFile.insert(new FileDTO(0, seqReview, oriName, sysName));
					
					if(rs > 0 && rsFile > 0) {
						response.sendRedirect("/review.bo?curPage=1");
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}catch(Exception e) {
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
				Gson gson = new Gson();
				String rs = gson.toJson(dto);
				System.out.println(rs);
				response.setCharacterEncoding("utf-8");
				response.getWriter().append(rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/review/detailView.jsp").forward(request, response);

			// 게시물 수정 요청
		}else if(uri.equals("/reviewUpdate.bo")) {
			int seqReview = Integer.parseInt(request.getParameter("seqReview"));
			String reviewTitle = request.getParameter("reviewTitle");
			String reviewContent = request.getParameter("reviewContent");
			System.out.println(reviewTitle+reviewContent);
			
			ReviewDAO dao = new ReviewDAO();
			try {
				int result = dao.update(new ReviewDTO(seqReview,0,null,reviewTitle,reviewContent,null,null));
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

		}else if(uri.equals("/reviewList.bo")) {//마이페이지에서 리뷰글 보기
			ReviewDAO dao = new ReviewDAO();
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
			try {
				String id = dto.getId();
				ArrayList<ReviewDTO> list =  dao.selectById(id);
				request.setAttribute("list", list);
			}catch(Exception e) {
				e.printStackTrace();
			}request.getRequestDispatcher("/mypage/reviewList.jsp").forward(request, response);
		}else if(uri.equals("/reviewListDetail.bo")) { // 마이페이지 리뷰 상세페이지 
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
	}
//			else if(uri.equals("/reviewUpdate.bo")) { // 마이페이지 리뷰 수정
//			int seqReview = Integer.parseInt(request.getParameter("seqReview"));
//			String reviewTitle = request.getParameter("reviewTitle");
//			String reviewContent = request.getParameter("reviewContent");
//			System.out.println(seqReview+" : "+reviewTitle+" : "+reviewContent);
//			
//			ReviewDAO dao = new ReviewDAO();
//			
//			try {		
//				
//				int result = dao.update(new ReviewDTO(seqReview, 0,null,reviewTitle, reviewContent,null,null));
//				if(result>0){
//					ReviewDTO dto = dao.selectBySeq(seqReview);
//					request.setAttribute("dto", dto);
//					Gson gson = new Gson();
//					String rs = gson.toJson(dto);
//					System.out.println(rs);
//					response.setCharacterEncoding("utf-8");
//					response.getWriter().append(rs);
//				}else {
//					response.getWriter().append("fail");
//				}
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		} 
			else if(uri.equals("/reviewDelete.bo")) {//문의글 삭제하기
			int seqReview = Integer.parseInt(request.getParameter("seqReview"));
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
