package com.boribob.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.File;

import com.boribob.dao.OrderDAO;
import com.boribob.dao.ProductDAO;
import com.boribob.dto.OrderDTO;
import com.boribob.dto.ProductDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			
		
		}
		// 상품
		else if(uri.equals("/productList.admin")) { //product 관리  // 홈페이지의 전체 상품 조회
				
			ProductDAO dao = new ProductDAO();
				try {
					ArrayList<ProductDTO> productList = dao.selectAll(); // 전체 상품에 대한 내용을 productList로 받아온다.
					request.setAttribute("productList", productList); // 전체 상품 값 셋팅

				} catch (Exception e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("/admin/adminProductList.jsp").forward(request, response); 																							
	
			
		}else if(uri.equals("/productInsert.admin")) {  // 상품 입력 페이지로 이동
			
			response.sendRedirect("/admin/adminProductInsert.jsp");
			
		}else if(uri.equals("productInsertProc.admin")) {	//상품 등록
			String filePath = request.getServletContext().getRealPath("files"); // 데이터가 저장될 서버의 경로
			System.out.println(filePath);
			File dir = new File(filePath);

			if (!dir.exists()) {    // 폴더가 없을 경우를 대비
				dir.mkdirs();
			}
			int maxSize = 1024 * 1024 * 10;

			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8",new DefaultFileRenamePolicy());
				int productCode = Integer.parseInt(multi.getParameter("productCode"));  
				String productName = multi.getParameter("productName");
				int productPrice = Integer.parseInt(multi.getParameter("productPrice"));  
				String productContent = multi.getParameter("productContent");
				String productImg = multi.getFilesystemName("productImg");
				
				ProductDAO dao = new ProductDAO();
				try {
					int rs = dao.insert(new ProductDTO(productCode,productName,productPrice,productContent,productImg));
					if(rs>0) {  // 만약에 상품 등록에 성공하면 관리자 페이지에 얼럿 띄워주기
						request.setAttribute("productInsert", rs);
						
					}else{
						request.setAttribute("productInsert", rs);		
					}
					
				}catch(Exception e) {e.printStackTrace();
				} request.getRequestDispatcher("/admin/adminProductInsert.jsp").forward(request, response);
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		
		}else if(uri.equals("/productUpdate.admin")) { // 상품 수정페이지로 이동
			
			response.sendRedirect("/admin/adminProductUpdate.jsp");
			
		}else if(uri.equals("/productUpdateProc.admin")) { // 상품 수정
			
			String filePath = request.getServletContext().getRealPath("files"); // 데이터가 저장될 서버의 경로
			System.out.println(filePath);
//			File dir = new File(filePath);
//
//			if (!dir.exists()) {    // 폴더가 없을 경우를 대비
//				dir.mkdirs();
//			}
			int maxSize = 1024 * 1024 * 10;

			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8",new DefaultFileRenamePolicy());
				int productCode = Integer.parseInt(multi.getParameter("productCode"));  
				String productName = multi.getParameter("productName");
				int productPrice = Integer.parseInt(multi.getParameter("productPrice"));  
				String productContent = multi.getParameter("productContent");
				String productImg = multi.getFilesystemName("productImg");
				
				ProductDAO dao = new ProductDAO();
				try {
					int rs = dao.update(new ProductDTO(productCode,productName,productPrice,productContent,productImg));
					if(rs>0) {  // 만약에 상품 수정에 성공하면 관리자 페이지에 얼럿 띄워주기
						request.setAttribute("productUpdate", rs);
						
					}else{
						request.setAttribute("productUpdate", rs);		
					}
					
				}catch(Exception e) {e.printStackTrace();
				} request.getRequestDispatcher("/admin/adminProductUpdate.jsp").forward(request, response);
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			
		}else if(uri.equals("/productDelete.admin")) { // 상품 삭제요청
			
			int productCode = Integer.parseInt( request.getParameter("productCodeDelete"));
			System.out.println(productCode);
			
			ProductDAO dao = new ProductDAO();
			
			try {
				int rs = dao.delete(productCode);
				if(rs>0) {
					System.out.println("데이터 삭제 성공");			
					response.getWriter().append("ok");
				}else {
					response.getWriter().append("fail");
				}
				
			}catch(Exception e) {e.printStackTrace();
			}
			
		}
	
		
		
		
		
		
		
		else if(uri.equals("/modifyOrder.admin")) { //배송정보 수정 
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
