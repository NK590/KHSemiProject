package order.orderDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.dbcp2.BasicDataSource;

import order.orderDTO.OrderDTO;

public class OrderDAO {

	private BasicDataSource bds = new BasicDataSource();

	public OrderDAO() {
		String url = "jdbc:oracle:thin:@54.180.114.149:1521/xe";
		String username = "kh";
		String password = "kh";
		bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		bds.setUrl(url);
		bds.setUsername(username);
		bds.setPassword(password);
		bds.setInitialSize(30);

	}

	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}

	public int insert(OrderDTO dto) {
		String sql = "insert into tbl_order values(order_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try (Connection con = getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
//			pstmt.setLong(1, dto.getOrderNo()); // 1.주문번호 시퀀스 
			pstmt.setString(1, dto.getMemberId()); // 2.회원 아이디
			pstmt.setString(2, dto.getOrderName()); // 3.수취인 이름
			pstmt.setString(3, dto.getOrderContact()); // 4.수취인 연락처
			pstmt.setString(4, dto.getOrderAddress()); // 5.수취인 주소
			pstmt.setString(5, dto.getOrderMsg()); // 6.주문 메시지
			pstmt.setString(6, dto.getPostMsg()); // 7.배송 메시지
			pstmt.setString(7, dto.getPayNumber()); // 8.결제 번호
			pstmt.setString(8, dto.getProductCode()); // 9.상품 코드
			pstmt.setString(9, dto.getTotalPay()); // 10.총결제 금액
			pstmt.setString(10,dto.getCard()); // 11.카드번호
			
			int rs = pstmt.executeUpdate();

			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;

	}
	
	public OrderDTO findByMemberId(String searchId) {
		String sql = "select * from tbl_order where order_no = ?";
		try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {
		 pstmt.setInt(1, 34);
			ResultSet rs = pstmt.executeQuery();
			OrderDTO dto = new OrderDTO();
			while(rs.next()) {
				Long order_no = rs.getLong("order_no");
				String memberId = rs.getString("member_id");
				String orderName = rs.getString("order_name");
				String orderContact =rs.getString("order_contact");
				String orderAddress =rs.getString("order_address");
				String orderMsg =rs.getString("order_msg");
				String postMsg =rs.getString("post_msg");
				String payNumber =rs.getString("pay_number");
				String productCode =rs.getString("product_code");
				String totalPay =rs.getString("total_pay");
				String card =rs.getString("card");

				 dto = new OrderDTO(order_no,memberId,orderName,orderContact,orderAddress,orderMsg,postMsg,payNumber,productCode
						 ,totalPay,card);
			}
		
		 return dto;	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new OrderDTO();
	}
}
