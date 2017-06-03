package lee.inhong.BMS_JSP.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lee.inhong.BMS_JSP.dto.Customer;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.dto.ViewStock;
import lee.inhong.BMS_JSP.dto.ViewStockInfo;

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
			String sql =	"UPDATE customer SET customer_pw = ?, customer_name = ?, customer_hp = ?, customer_email = ? "+
							" WHERE customer_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCustomer_pw());
			pstmt.setString(2, dto.getCustomer_name());
			pstmt.setString(3, dto.getCustomer_hp());
			pstmt.setString(4, dto.getCustomer_email());
			pstmt.setString(5, dto.getCustomer_id());
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

	@Override
	public ArrayList<ViewBook> selectBookList() {
		ArrayList<ViewBook> dtos = new ArrayList<ViewBook>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ViewBook dto = null;
		try {
			conn = datasource.getConnection();
			String sql =	"SELECT B.ISBN, B.publisher_id, B.book_title, B.book_author, B.purchase_price, B.sell_price, P.publisher_name"+
							" FROM book B, publisher P"+
							" WHERE B.publisher_id = P.publisher_id";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new ViewBook();
				dto.setISBN(rs.getString("ISBN"));
				dto.setPublisher_id(rs.getInt("publisher_id"));
				dto.setBook_title(rs.getString("book_title"));
				dto.setBook_author(rs.getString("book_author"));
				dto.setPurchase_price(rs.getInt("purchase_price"));
				dto.setSell_price(rs.getInt("sell_price"));
				dto.setPublisher_name(rs.getString("publisher_name"));
				dtos.add(dto);
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
		return dtos;
	}

	@Override
	public ViewBook selectBookInfo(String strISBN) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ViewBook dto = null;
		try {
			conn = datasource.getConnection();
			String sql =	"SELECT B.ISBN, B.publisher_id, B.book_title, B.book_author, B.purchase_price, B.sell_price, P.publisher_name"+
							" FROM book B, publisher P"+
							" WHERE B.publisher_id = P.publisher_id AND B.ISBN = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strISBN);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new ViewBook();
				dto.setISBN(rs.getString("ISBN"));
				dto.setPublisher_id(rs.getInt("publisher_id"));
				dto.setBook_title(rs.getString("book_title"));
				dto.setBook_author(rs.getString("book_author"));
				dto.setPurchase_price(rs.getInt("purchase_price"));
				dto.setSell_price(rs.getInt("sell_price"));
				dto.setPublisher_name(rs.getString("publisher_name"));
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
	public int ISBNCheck(String ISBN) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM book WHERE ISBN = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ISBN);
			rs = pstmt.executeQuery();
			if(rs.next()) cnt = 1;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	@Override
	public int getCount_book() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT COUNT(*) FROM book";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) cnt = rs.getInt(1);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	@Override
	public ArrayList<ViewStock> getStocks(int start, int end) {
		ArrayList<ViewStock> dtos = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
							/*
							SELECT *
							FROM	(SELECT B.ISBN,B.book_title,B.book_author,P.publisher_name,
							                B.purchase_price,B.sell_price,S.stock,S.stock_state,rownum rNum
							        FROM book B, publisher P, stock S
							        WHERE B.publisher_id = P.publisher_id
							        AND B.ISBN = S.ISBN
							        )
							WHERE rNum >= 1 AND rNum <= 5;
							*/
			String sql = 	"SELECT * "+
							"FROM	(SELECT B.ISBN,B.book_title,B.book_author,P.publisher_name, "+
											"B.purchase_price,B.sell_price,S.stock,S.stock_state,rownum rNum "+
									"FROM book B, publisher P, stock S "+
									"WHERE B.publisher_id = P.publisher_id "+
									"AND B.ISBN = S.ISBN "+
									") "+
							"WHERE rNum >= ? AND rNum <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dtos = new ArrayList<ViewStock>();
				do {
					ViewStock dto = new ViewStock();
					dto.setISBN(rs.getString("ISBN"));
					dto.setBook_title(rs.getString("book_title"));
					dto.setBook_author(rs.getString("book_author"));
					dto.setPublisher_name(rs.getString("publisher_name"));
					dto.setPurchase_price(rs.getInt("purchase_price"));
					dto.setSell_price(rs.getInt("sell_price"));
					dto.setStock(rs.getInt("stock"));
					dto.setStock_state(rs.getString("stock_state"));
					dtos.add(dto);
				} while(rs.next());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}

	@Override
	public ViewStockInfo getStockInfo() {
		ViewStockInfo dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
							/*
							SELECT  sum(B.purchase_price*S.stock) AS buyTotal,
							        sum(B.sell_price*S.stock) AS sellTotal,
							        sum(stock) AS EATotal
							FROM    book B, stock S
							WHERE   B.ISBN = S.ISBN;
							*/
			String sql = 	"SELECT sum(B.purchase_price*S.stock)*-1 AS buyTotal, "+
							"        sum(B.sell_price*S.stock) AS sellTotal, "+
							"        sum(stock) AS EATotal "+
							"FROM    book B, stock S "+
							"WHERE   B.ISBN = S.ISBN";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new ViewStockInfo();
				dto.setEATotal(rs.getInt("eATotal"));
				dto.setBuyTotal(rs.getInt("buyTotal"));
				dto.setSellTotal(rs.getInt("sellTotal"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}

	@Override
	public int updateStock(String ISBN, int columnNo, String updateStr) {
		int updateCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = datasource.getConnection();
			String sql = null;
			switch(columnNo) {
			case 1: sql = "UPDATE book SET book_title = ? WHERE ISBN = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, updateStr);
				pstmt.setString(2, ISBN);
				break;
			case 2: sql = "UPDATE book SET book_author = ? WHERE ISBN = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, updateStr);
				pstmt.setString(2, ISBN);
				break;
			case 3: sql = "UPDATE book SET purchase_price = ? WHERE ISBN = ?";
				int purchase_price = Integer.parseInt(updateStr);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, purchase_price);
				pstmt.setString(2, ISBN);
				break;
			case 4: sql = "UPDATE book SET sell_price = ? WHERE ISBN = ?";
				int sell_price = Integer.parseInt(updateStr);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, sell_price);
				pstmt.setString(2, ISBN);
				break;
			case 6: sql = "UPDATE stock SET stock_state = ? WHERE ISBN = ?";
				String stock_state = null;
				switch(updateStr) {
					case "SOLD_OUT": stock_state="O"; break;
					case "PENDING": stock_state="P"; break;
					case "ON_SALE": stock_state="S"; break;
					default: break;
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, stock_state);
				pstmt.setString(2, ISBN);
				break;
			default: break;
			}
			updateCnt = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e2) {
				e2.printStackTrace();
			}
		}
		return updateCnt;
	}

}
