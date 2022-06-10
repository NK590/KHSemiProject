package com.boribob.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.security.o3logon.a;

import com.boribob.dao.AdminDAO;
import com.boribob.dao.InquiryDAO;
import com.boribob.dao.MemberDAO;
import com.boribob.dao.OrderDAO;
import com.boribob.dto.InquiryDTO;
import com.boribob.dto.MemberDTO;
import com.boribob.dto.OrderDTO;
import com.google.gson.Gson;

@WebServlet("*.admin")
public class AdminController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		sysoutTest
	if(uri.equals("/")) {  
		
		//HttpSession session = request.getSession();   // 세션으로 괸리자 아이디만 접속가능 처리
		//String id = ((MemberDTO)session.getAttribute("loginSession")).getId();
		//if(!(id.equals("admin@gmail.com"))) {
		//response.sendRedirect("/login");
		//}else
	}	
		else if(uri.equals("/member.admin")) { //member 리스트 불러오기
			MemberDAO dao =new MemberDAO();
			try {
				ArrayList<MemberDTO> list = dao.selectAll();
				request.setAttribute("list",list);
			}catch(Exception e){
				e.printStackTrace();
			}request.getRequestDispatcher("/admin/adminMember.jsp").forward(request, response);			
		}else if(uri.equals("/allMember.admin")) {
			MemberDAO dao =new MemberDAO();
			try {
				ArrayList<MemberDTO> list = dao.selectAll();
				Gson gson = new Gson();
				String result = gson.toJson(list);
				System.out.println(result);
				response.getWriter().append(result);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/findMember.admin")) {
			AdminDAO admindao =new AdminDAO();
			try {
				String id = request.getParameter("id");
				ArrayList<MemberDTO> list = admindao.selectById(id);
				Gson gson = new Gson();
				String result = gson.toJson(list);
				System.out.println(result);
				response.getWriter().append(result);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/subMember.admin")) {
			AdminDAO admindao = new AdminDAO();
			try {
				ArrayList<MemberDTO> list = admindao.findSubMem();
				Gson gson = new Gson();
				String result = gson.toJson(list);
				System.out.println(result);
				response.getWriter().append(result);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(uri.equals("/notSubMember.admin")) {
			AdminDAO admindao = new AdminDAO();
			try {
				ArrayList<MemberDTO> list = admindao.findNOtSubMem();
				Gson gson = new Gson();
				String result = gson.toJson(list);
				System.out.println(result);
				response.getWriter().append(result);
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		}else if(uri.equals("product.admin")) { //product 관리
			
			response.sendRedirect("/productAdmin.jsp");
			
		}else if(uri.equals("productList.admin")) {
	
			
		}else if(uri.equals("productForm.admin")) {
			
		
		
		}else if(uri.equals("/modifyOrder.admin")) { //배송정보 수정 
			System.out.println("/???");		
			Integer orderId =Integer.parseInt(request.getParameter("orderId"));
			String deliveryStatus = request.getParameter("deliveryStatus");
			String expectedArrival = request.getParameter("expectedArrival");
			String deliveryCount =  request.getParameter("deliveryCount");
			OrderDAO orderDAO = new OrderDAO();
			try {
				orderDAO.modifyOrder(orderId, deliveryStatus, expectedArrival, deliveryCount);
				System.out.println("수정완");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("return");
			response.sendRedirect("/admin/orderList.jsp");
		}else if(uri.equals("/orderList.admin")) {
			
			
			try {
				OrderDAO orderDAO = new OrderDAO();
				ArrayList<OrderDTO> orderList  = orderDAO.findAllList();
				
				request.setAttribute("orderList", orderList);
				request.getRequestDispatcher("/admin/orderList.jsp").forward(request, response);
			} catch (Exception e) {
				// 
				e.printStackTrace();
			}
		}else if(uri.equals("/orderDetail.admin")) {
			Integer orderId =Integer.parseInt(request.getParameter("orderId"));
			OrderDAO orderDAO = new OrderDAO();
			try {
				OrderDTO orderDTO = orderDAO.findByOrderId(orderId);
				request.setAttribute("orderDTO", orderDTO);
				request.getRequestDispatcher("/admin/orderDetail.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			
		}else if(uri.equals("review.admin")) { //review 관리
			
			response.sendRedirect("/reviewAdmin.jsp");
		}else if(uri.equals("reviewList.admin")) {
			
		}else if(uri.equals("reviewForm.admin")) {
			
		}else if(uri.equals("/inquiry.admin")){
			InquiryDAO dao = new InquiryDAO();
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
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
				request.setAttribute("currentPage",currentPage);
			}catch(Exception e){
				e.printStackTrace();
			}request.getRequestDispatcher("/admin/adminInquiry.jsp").forward(request, response);
		}else if(uri.equals("/inquiryDelete.admin")) {
			InquiryDAO dao = new InquiryDAO();
			int seqInquiry = Integer.parseInt(request.getParameter("seqInquiry"));
			int page = Integer.parseInt(request.getParameter("page"));
			System.out.println(seqInquiry);
			System.out.println(page);
			try {
				int rs = dao.delete(seqInquiry);
				if(rs>0) {
					response.sendRedirect("/inquiry.admin?currentPage="+page);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}else if(uri.equals("/inquiryDetail.admin")) {
			int seqInquiry = Integer.parseInt(request.getParameter("seqInquiry"));
			System.out.println(seqInquiry);
			InquiryDAO dao= new InquiryDAO();
			try {
				InquiryDTO dto = dao.selectBySeq(seqInquiry);
				request.setAttribute("dto", dto);
			}catch(Exception e){
				e.printStackTrace();
			}
			request.getRequestDispatcher("admin/adminInquiryDetail.jsp").forward(request, response);
		}else if(uri.equals("/inquiryAnswer.admin")) {
			InquiryDAO dao = new InquiryDAO();
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			try {
				//페이징
				HashMap map = dao.getPage(currentPage);
				System.out.println(map.get("startNavi"));
				System.out.println(map.get("endNavi"));
				System.out.println(map.get("makePrev"));
				System.out.println(map.get("makeNext"));
				
				//전체목록 불러오기
				System.out.println(currentPage);
				ArrayList<InquiryDTO> list = dao.selectNotAnswer(currentPage*10-9, currentPage*10);
				request.setAttribute("list",list);
				request.setAttribute("map", map);
				request.setAttribute("currentPage",currentPage);
			}catch(Exception e){
				e.printStackTrace();
			}request.getRequestDispatcher("/admin/adminInquiryAnswer.jsp").forward(request, response);
		}else if(uri.equals("/inquiryAnswerDetail.admin")) {
			int seqInquiry = Integer.parseInt(request.getParameter("seqInquiry"));
			System.out.println(seqInquiry);
			InquiryDAO dao= new InquiryDAO();
			try {
				InquiryDTO dto = dao.selectBySeq(seqInquiry);
				request.setAttribute("dto", dto);
			}catch(Exception e){
				e.printStackTrace();
			}
			request.getRequestDispatcher("admin/adminInquiryAnswerInput.jsp").forward(request, response);
		}else if(uri.equals("/inquiryAnswerProc.admin")) {
			int seqInquiry = Integer.parseInt(request.getParameter("seqInquiry"));
			String inquiryAnswer = request.getParameter("inquiryAnswer");
			InquiryDAO dao = new InquiryDAO();
			try {
				int rs = dao.updateAnswer(inquiryAnswer, seqInquiry);
				if(rs>0) {
					response.sendRedirect("/inquiryAnswer.admin?currentPage=1");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		} else if (uri.equals("/deliveryList.admin")) { // 배송정보 리스트
			try {
				OrderDAO orderDAO = new OrderDAO();
				ArrayList<OrderDTO> deliveryList = orderDAO.findAllList();

				request.setAttribute("deliveryList", deliveryList);
				request.getRequestDispatcher("/admin/deliveryList.jsp").forward(request, response);
			} catch (Exception e) {
				//
				e.printStackTrace();
			}

		} else if (uri.equals("/deliveryManagement.admin")) { // 배송 상세 페이지
			request.setCharacterEncoding("utf-8");

			Integer orderId = Integer.parseInt(request.getParameter("orderId"));
			OrderDAO orderDAO = new OrderDAO();
			try {
				OrderDTO deliveryDetail = orderDAO.findByOrderId(orderId);
				request.setAttribute("deliveryDetail", deliveryDetail);
				request.getRequestDispatcher("/admin/deliveryManagement.jsp").forward(request, response);
			} catch (Exception e) {

				e.printStackTrace();
			}

		} else if (uri.equals("/modifyDelivery.admin")) {
			request.setCharacterEncoding("utf-8");
			Integer orderId = Integer.parseInt(request.getParameter("orderId"));// 주문번호
			String deliveryStatus = request.getParameter("deliveryStatus"); // 배송상태
			String deliveryCount = request.getParameter("deliveryCount"); // 배송회차
			String expectedArrival = request.getParameter("expectedArrival"); // 도착 예정일

			OrderDAO orderDAO = new OrderDAO();
			try {
				int modifyRs = orderDAO.modifyOrder(orderId, deliveryStatus, expectedArrival, deliveryCount);
				if (modifyRs > 0) {
					response.sendRedirect("/deliveryList.admin");
				} else {
					response.sendRedirect("/modifyDelivery.admin");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (uri.equals("/orderList.admin")) { // 주문 리스트

			try {
				OrderDAO orderDAO = new OrderDAO();
				ArrayList<OrderDTO> orderList = orderDAO.findAllList();

				request.setAttribute("orderList", orderList);
				request.getRequestDispatcher("/admin/orderListV2.jsp").forward(request, response);
			} catch (Exception e) {
				//
				e.printStackTrace();
			}
		} else if (uri.equals("/orderDetail.admin")) {
			Integer orderId = Integer.parseInt(request.getParameter("orderId"));
			OrderDAO orderDAO = new OrderDAO();
			try {
				OrderDTO orderDTO = orderDAO.findByOrderId(orderId);
				request.setAttribute("orderDTO", orderDTO);
				request.getRequestDispatcher("/admin/orderDetailV2.jsp").forward(request, response);
			} catch (Exception e) {

				e.printStackTrace();
			}
		}

	}
}

