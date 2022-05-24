package order.orderService;



import order.orderDAO.OrderDAO;
import order.orderDTO.OrderDTO;

public class OrderService {
	
	OrderDAO dao = new OrderDAO();
	
	public int save(OrderDTO dto) {
		
		int rs =dao.insert(dto);
		
		return rs;
	}

}
