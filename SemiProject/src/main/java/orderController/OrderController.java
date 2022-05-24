package orderController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import order.orderDAO.OrderDAO;
import order.orderDTO.OrderDTO;
import order.orderService.OrderService;


@WebServlet("*.order")
public class OrderController extends HttpServlet{
	
	OrderService orderService = new OrderService();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response  ) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println(uri);
	    OrderDTO dto = new OrderDTO();
	    request.setCharacterEncoding("utf-8");
	    
	    	if(uri.equals("/form.order")) {
	    		response.sendRedirect("/order/order.jsp");
	    	 
	    		}else if(uri.equals("/complete.order")) {
	    		response.sendRedirect("/order/orderComplete.jsp");
	    	}else if(uri.equals("/insert.order")){
	    		 
	    		 String memberId =   request.getParameter("memberId");  			//2.회원아이디 
			     String orderName =  request.getParameter("orderName");  		//3.수취인 이름 
			     String orderContact =  request.getParameter("orderContect");	//4.수취인 연락처 
			     String orderAddress =  request.getParameter("orderAddress");  	//5.수취인 주소 
			     String orderMsg =  request.getParameter("orderMsg");  			//6.주문 메시지 
			     String postMsg =  request.getParameter("postMsg");  			//7.배송 메시지 
			     String payNumber =  request.getParameter("payNumber");  		//8.결제 번호  
			     String productCode =  request.getParameter("productCode");  	//9.상품코드  
			     String totalPay =  request.getParameter("totalPay");  			//10.결제금액 
			     String card =  request.getParameter("card");  					//11.카드정보  
			     
			     dto.setMemberId(memberId);
			     dto.setOrderName(orderName);
			     dto.setOrderContact(orderContact);
			     dto.setOrderAddress(orderAddress);
			     dto.setOrderMsg(orderMsg);
			     dto.setPostMsg(postMsg);
			     dto.setPayNumber(payNumber);
			     dto.setProductCode(productCode);
			     dto.setTotalPay(totalPay);
			     dto.setCard(card);
			     
			     
			     int inputResult =orderService.save(dto);
			     if(inputResult>0) {
			    	 response.sendRedirect("/");
			     }
			     	
	    		
	    	}
	    	 
	   
	    	
	 
	    
	  
                                
	     
	   
	
	}

}
