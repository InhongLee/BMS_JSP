package lee.inhong.BMS_JSP.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lee.inhong.BMS_JSP.dto.Customer;

public class BMSDAOImpl implements BMSDAO {

	DataSource datasource;
	
	private static BMSDAOImpl instance = new BMSDAOImpl();
	
	public static BMSDAOImpl getInstance() {
		return instance;
	}
	
	public BMSDAOImpl() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int idCheck(String strId) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM customer WHERE customer_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			
			rs = pstmt.executeQuery();
			if(rs.next())	cnt = 1;
			else 			cnt = 0;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	@Override
	public int addCustomer(Customer dto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = datasource.getConnection();
			String sql =	"INSERT INTO customer(customer_id,customer_pw,customer_name,customer_sid1,customer_sid2,customer_hp,customer_email)"+
							"VALUES(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCustomer_id());
			pstmt.setString(2, dto.getCustomer_pw());
			pstmt.setString(3, dto.getCustomer_name());
			pstmt.setString(4, dto.getCustomer_sid1());
			pstmt.setString(5, dto.getCustomer_sid2());
			pstmt.setString(6, dto.getCustomer_hp());
			pstmt.setString(7, dto.getCustomer_email());
			cnt = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	@Override
	public int logInCheck(String strId, String strPw) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM customer WHERE customer_id = ? AND customer_pw = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			pstmt.setString(2, strPw);
			
			rs = pstmt.executeQuery();
			if(rs.next())	cnt = 1;
			else 			cnt = 0;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	@Override
	public Customer selectCustomer(String strId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Customer dto = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM customer WHERE customer_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new Customer();
				dto.setCustomer_id(rs.getString("customer_id"));
				dto.setCustomer_pw(rs.getString("customer_pw"));
				dto.setCustomer_name(rs.getString("customer_name"));
				dto.setCustomer_sid1(rs.getString("customer_sid1"));
				dto.setCustomer_sid2(rs.getString("customer_sid2"));
				dto.setCustomer_hp(rs.getString("customer_hp"));
				dto.setCustomer_email(rs.getString("customer_email"));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}

	@Override
	public int updateCustomer(Customer dto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = datasource.getConnection();
			String sql =	"UPDATE customer SET customer_pw = ?, customer_name = ?, customer_sid1 = ?, customer_sid2 = ?, customer_hp = ?, customer_email = ? "+
							" WHERE customer_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCustomer_pw());
			pstmt.setString(2, dto.getCustomer_name());
			pstmt.setString(3, dto.getCustomer_sid1());
			pstmt.setString(4, dto.getCustomer_sid2());
			pstmt.setString(5, dto.getCustomer_hp());
			pstmt.setString(6, dto.getCustomer_email());
			pstmt.setString(7, dto.getCustomer_id());
			cnt = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	@Override
	public int deleteCustomer(String strId, String strPw) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = datasource.getConnection();
			String sql =	"DELETE FROM customer WHERE customer_id = ? AND customer_pw = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			pstmt.setString(2, strPw);
			cnt = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

}
