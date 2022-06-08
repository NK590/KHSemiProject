package com.boribob.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;


import com.boribob.dao.OrderDAO;
import com.boribob.dto.OrderDTO;
import com.boribob.dto.OrderInfoDTO;


@WebServlet("*.order")
public class OrderController extends HttpServlet {
	OrderDAO orderDAO = new OrderDAO();
	OrderInfoDTO orderInfoDTO = new OrderInfoDTO();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();

		request.setCharacterEncoding("utf-8");

		// 로그인 검증 로그인이 되었으면 아래 페이지로 이동
		if (uri.equals("/form.order")) { // 1. 주문정보 입력페이지로 이동

			HttpSession session = request.getSession();
//			String id = ((MemberDTO)session.getAttribute("loginSession")).getId();
			// 세션값으로 회원id를 받고 회원 id로 회원정보랑 구독 정보를 OrderInfoDTO에 담아서 뷰에 뿌려주기

			String memberId = "bori@gmail.com";// 세션으로 받아오는 아이디 -> 임시회원 아이디

			

			
			try {
				orderInfoDTO = orderDAO.findbyMemberId(memberId);
			
				request.setAttribute("orderInfoDTO", orderInfoDTO);
			} catch (Exception e) {

				e.printStackTrace();
			}
			
			

			request.getRequestDispatcher("/order/orderForm.jsp").forward(request, response);

		} else if (uri.equals("/insert.order")) { // 2.주문정보 저장
			HttpSession session = request.getSession();
			response.setContentType("application/x-json; charset=UTF-8");
			request.setCharacterEncoding("utf-8");

			String memberId = "bori@gmail.com";
		
			

			try { // 주문정보 입력
				orderInfoDTO = orderDAO.findbyMemberId(memberId);
				// 주문정보
				
				
				String id = orderInfoDTO.getId();
				String orderName = request.getParameter("orderName"); // 수취인 이름
				String orderPhone = request.getParameter("orderPhone"); // 수취인 연락처
				String orderPost = request.getParameter("orderPost"); // 수취인 우편번호
				String orderRoadAddress = request.getParameter("orderRoadAddress"); // 수취인 도로명 주소
				String orderDetailAddress = request.getParameter("orderDetailAddress"); // 수취인 상세주소
				String orderMsg = request.getParameter("orderMsg"); // 주문 메시지
				String postMsg = request.getParameter("postMsg"); // 배송메시지
				int productCode = orderInfoDTO.getProductCode(); // 상품코드
				String subscribeStart = orderInfoDTO.getSubscribeStart(); // 구독시작일
				int subscribeTerm = orderInfoDTO.getSubscribeTerm(); // 구독기간
				int price = orderInfoDTO.getPrice(); // 가격
				// 결제정보
				String paySuccess = request.getParameter("paySuccess"); // 결제성공여부
				String payId = request.getParameter("payId"); // 고유 아이디
				String payTradeId = request.getParameter("payTradeId"); // 상점 거래 Id
				String payAmount = request.getParameter("payAmount"); // 결제 금액
				String payApproval = request.getParameter("payApproval"); // 카드승인 번호
				
				String deliveryStatus = "배송준비중";
				String expectedArrival = "배송준비중";
				String deliveryCount = "1회차";
				
				OrderDTO orderDTO = new OrderDTO(id,orderName,orderPhone,orderPost,orderRoadAddress,orderDetailAddress
						,orderMsg,postMsg,productCode,subscribeStart,subscribeTerm,
						price,paySuccess,payId,payTradeId,payAmount,payApproval,deliveryStatus,
						expectedArrival,deliveryCount);
				
				
				OrderDAO orderDao = new OrderDAO();
				int rsOrderInsert = orderDao.insertOrder(orderDTO);
				
				
				
				response.sendRedirect("/complete.order");

			} catch (Exception e) {
				System.out.println("무었인가 오류다 ");
				e.printStackTrace();
				response.sendRedirect("/");
			}

		} else if (uri.equals("/complete.order")) {// 4.주문 완료 페이지 
			
			
			
			request.getRequestDispatcher("/order/orderComplete.jsp").forward(request, response);

		} else if (uri.equals("/list.order")) {// 주문 리스트 
			HttpSession session = request.getSession();
			
			
			try {
				String memberId  = "bori@gmail.com";
				ArrayList<OrderDTO> orderList = orderDAO.findListById(memberId);
				
				
				request.setAttribute("orderList", orderList);
				request.getRequestDispatcher("/order/orderListV1.jsp").forward(request, response);
				} catch (Exception e) {
				
				e.printStackTrace();
			}

			
		}else if (uri.equals("/detail.order")) {
		Integer orderId =Integer.parseInt(request.getParameter("orderId")); 
		
		OrderDTO detailDTO;
		try {
			detailDTO = orderDAO.findByOrderId(orderId);
			request.setAttribute("detailDTO", detailDTO);
			request.getRequestDispatcher("/order/orderDetailV1.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		}

	}

}
