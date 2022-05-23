package orderController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.orderDAO.OrderDAO;
import order.orderDTO.OrderDTO;


@WebServlet("/test")
public class OrderController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			OrderDAO dao = new OrderDAO();
			OrderDTO dto = new OrderDTO();
			dto.setOrderNumber(2L);
			dto.setId("mynameIsId");
			dto.setOrderName("Lee");
			dto.setOrderPhone("010-2306-1231");
			dto.setOrderAddress("seoul-1benzi");
			dto.setOrderPostMsg("posrmsg");
			dto.setOrderMsg("ordermsg");
			
			
			int rs =dao.insert(dto);
			System.out.println("rs = "+rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
