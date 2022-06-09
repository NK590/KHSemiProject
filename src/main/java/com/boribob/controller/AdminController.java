package com.boribob.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.security.o3logon.a;
import com.boribob.dao.OrderDAO;
import com.boribob.dto.OrderDTO;

@WebServlet("*.admin")
public class AdminController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		
	if(uri.equals("admin")) {  
		
		//HttpSession session = request.getSession();   // 세션으로 괸리자 아이디만 접속가능 처리
		//String id = ((MemberDTO)session.getAttribute("loginSession")).getId();
		//if(!(id.equals("admin@gmail.com"))) {
		//response.sendRedirect("/login");
		//}else
			
			response.sendRedirect("/admin.jsp");
			
		}else if(uri.equals("member.admin")) { //member 관리 
			
			response.sendRedirect("admin/memberAdmin.jsp");
			
		}else if(uri.equals("memberList.admin")) {
			
			
			
		}else if(uri.equals("memberForm.admin")) {
			
		
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
			
		}
	}
}
