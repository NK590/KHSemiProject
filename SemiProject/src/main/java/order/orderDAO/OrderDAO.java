package order.orderDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
		String sql = "insert into tbl_order values(?,?,?,?,?,?,?)";
		try (Connection con = getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setLong(1,dto.getOrderNumber() );
			pstmt.setString(2,dto.getId());
			pstmt.setString(3,dto.getOrderName());
			pstmt.setString(4, dto.getOrderPhone());
			pstmt.setString(5, dto.getOrderAddress());
			pstmt.setString(6, dto.getOrderPostMsg());
			pstmt.setString(7, dto.getOrderMsg());
			
			int rs = pstmt.executeUpdate();
			
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;

	}
}
