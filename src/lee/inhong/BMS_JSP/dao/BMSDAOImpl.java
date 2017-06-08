package lee.inhong.BMS_JSP.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lee.inhong.BMS_JSP.dto.Board;
import lee.inhong.BMS_JSP.dto.Book;
import lee.inhong.BMS_JSP.dto.Customer;
import lee.inhong.BMS_JSP.dto.Publisher;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.dto.ViewMyOrder;
import lee.inhong.BMS_JSP.dto.ViewOrder;
import lee.inhong.BMS_JSP.dto.ViewStock;
import lee.inhong.BMS_JSP.dto.ViewStockInfo;

public class BMSDAOImpl implements BMSDAO{

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
			String sql =	"SELECT	B.ISBN, B.publisher_id, B.book_title, B.book_author, B.purchase_price, B.sell_price, P.publisher_name "+
							"FROM	book B, publisher P, stock S "+
							"WHERE	B.publisher_id = P.publisher_id "+
							"AND	B.ISBN = S.ISBN "+
							"AND 	S.STOCK_STATE IN (3120,3130)";
			
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
			String sql = 	"SELECT * "+
							"FROM	(SELECT B.ISBN,B.book_title,B.book_author,P.publisher_id,P.publisher_name, "+
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
					dto.setPublisher_id(rs.getInt("publisher_id"));
					dto.setPublisher_name(rs.getString("publisher_name"));
					dto.setPurchase_price(rs.getInt("purchase_price"));
					dto.setSell_price(rs.getInt("sell_price"));
					dto.setStock(rs.getInt("stock"));
					dto.setStock_state(rs.getInt("STOCK_STATE"));
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
			String sql = 	"SELECT sum(B.purchase_price*S.stock)*-1 AS buyTotal, "+
							"        sum(B.sell_price*S.stock) AS sellTotal, "+
							"        sum(stock) AS EATotal "+
							"FROM    book B, stock S "+
							"WHERE   B.ISBN = S.ISBN";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new ViewStockInfo();
				dto.setEATotal(rs.getInt("EATotal"));
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
				int stock_state = 0;
				switch(updateStr) {
					case "SOLD_OUT": stock_state = SOLD_OUT; break;
					case "PENDING": stock_state = PENDING; break;
					case "ON_SALE": stock_state = ON_SALE; break;
					case "OUT_OF_PRINT": stock_state = OUT_OF_PRINT; break;
					default: break;
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, stock_state);
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

	@Override
	public ArrayList<Publisher> getPublisher() {
		ArrayList<Publisher> dtos = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM publisher ORDER BY publisher_name ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dtos = new ArrayList<Publisher>();
				do {
					Publisher dto = new Publisher();
					dto.setPublisher_id(rs.getInt("publisher_id"));
					dto.setPublisher_name(rs.getString("publisher_name"));
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
	public ArrayList<ViewStock> getOpSearchStocks(int publisher_id, int stock_state, int stock) {
		ArrayList<ViewStock> dtos = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = 	"SELECT * "+
							"FROM	(SELECT B.ISBN,B.book_title,B.book_author,P.publisher_name, "+
											"B.purchase_price,B.sell_price,S.stock,S.stock_state,rownum rNum "+
									"FROM book B, publisher P, stock S "+
									"WHERE B.publisher_id = P.publisher_id "+
									"AND B.ISBN = S.ISBN "+
									"AND B.publisher_id = CASE ? "+
		                                "WHEN 0 THEN B.publisher_id "+
		                                "ELSE ? "+
		                            "END "+
		                            "AND S.stock_state = CASE ? "+
		                                "WHEN 0 THEN S.stock_state "+
		                                "ELSE ? "+
		                            "END "+
		                            "AND S.stock <= CASE ? "+
		                            "WHEN 0 THEN S.stock "+
		                            "ELSE ? "+
		                            "END "+
									") ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, publisher_id);
			pstmt.setInt(2, publisher_id);
			pstmt.setInt(3, stock_state);
			pstmt.setInt(4, stock_state);
			pstmt.setInt(5, stock);
			pstmt.setInt(6, stock);
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
					dto.setStock_state(rs.getInt("stock_state"));
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
	public String addOrder(String order_code,int publisher_id, String customer_id, int employee_id) {
		String orderId = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			
			if(order_code.equals("PU") || order_code.equals("RP")) {
				String sql =	"INSERT INTO orders(ORDER_ID,PUBLISHER_ID,EMPLOYEE_ID) "+
						"VALUES (?||TO_CHAR(SYSDATE,'YYMMDD')||LPAD(orderid_serialNo_seq.NEXTVAL,2,0), "+
						"		?,?) ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, order_code);
				pstmt.setInt(2, publisher_id);
				pstmt.setInt(3, employee_id);
			} else if(order_code.equals("SE") || order_code.equals("RE")) {
				String sql =	"INSERT INTO orders(ORDER_ID,PUBLISHER_ID,customer_id) "+
						"VALUES (?||TO_CHAR(SYSDATE,'YYMMDD')||LPAD(orderid_serialNo_seq.NEXTVAL,2,0), "+
						"		?,?) ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, order_code);
				pstmt.setInt(2, publisher_id);
				pstmt.setString(3, customer_id);
			}
			
			pstmt.executeUpdate();
			
			String sql2= "SELECT TO_CHAR(SYSDATE,'YYMMDD')||LPAD(orderid_serialNo_seq.CURRVAL,2,0) FROM DUAL";
			pstmt.close();
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String order_subId = rs.getString(1);
				orderId = order_code + order_subId;
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
		return orderId;
	}

	@Override
	public int addOrderDetail(String order_id, String ISBN, int pCost, int sPrice, int order_quentity, int order_state) {
		int addCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = datasource.getConnection();
			String sql =	"INSERT INTO orderdetail(order_id,detail_number,ISBN, "+
							"purchase_price,sell_price,order_quantity,order_state) "+
							"VALUES (?,1,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order_id);
			pstmt.setString(2, ISBN);
			pstmt.setInt(3, pCost);
			pstmt.setInt(4, sPrice);
			pstmt.setInt(5, order_quentity);
			pstmt.setInt(6, order_state);
			addCnt = pstmt.executeUpdate();
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
		return addCnt;
	}

	@Override
	public int getCount_order() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT COUNT(*) FROM orderDetail";
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
	public ArrayList<ViewOrder> getOrders(int start, int end) {
		ArrayList<ViewOrder> dtos = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql =	"SELECT * "+
							"FROM    (SELECT O.order_id,OD.detail_number,B.book_title, "+
							"		 OD.purchase_price,OD.sell_price,S.stock, "+
							"        OD.order_quantity,OD.order_state,rownum rNum "+
							"        FROM orders O, orderDetail OD, stock S, book B "+
							"        WHERE   O.order_id = OD.order_id "+
							"        AND     OD.ISBN = S.ISBN "+
							"        AND     S.ISBN = B.ISBN "+
							"        ) "+
							"WHERE rNum >= ? AND rNUM <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dtos = new ArrayList<ViewOrder>();
				do {
					ViewOrder dto = new ViewOrder();
					dto.setOrder_id(rs.getString("order_id"));
					dto.setDetail_number(rs.getInt("detail_number"));
					dto.setBook_title(rs.getString("book_title"));
					dto.setPurchase_price(rs.getInt("purchase_price"));
					dto.setSell_price(rs.getInt("sell_price"));
					dto.setStock(rs.getInt("stock"));
					dto.setOrder_quantity(rs.getInt("order_quantity"));
					dto.setOrder_state(rs.getInt("order_state"));
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
	public int reportTotalSales() {
		int totalSales = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT NVL(sum(SELL_PRICE*order_quantity),0) "+
					"FROM orderdetail "+
					"WHERE TO_DATE(SUBSTR(order_id,3,6), 'YYMMDD') >= TRUNC(SYSDATE, 'MONTH') "+
					"AND TO_DATE(SUBSTR(order_id,3,6), 'YYMMDD') <= LAST_DAY(SYSDATE) "+
					"AND ORDER_STATE IN (2120,2210,2230)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) totalSales = rs.getInt(1);
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
		return totalSales;
	}

	@Override
	public int reportTotalCost() {
		int totalCost = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT NVL(sum(PURCHASE_PRICE*order_quantity),0) "+
					"FROM orderdetail "+
					"WHERE TO_DATE(SUBSTR(order_id,3,6), 'YYMMDD') >= TRUNC(SYSDATE, 'MONTH') "+
					"AND TO_DATE(SUBSTR(order_id,3,6), 'YYMMDD') <= LAST_DAY(SYSDATE) "+
					"AND order_state IN (1120,1210,1230)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) totalCost = rs.getInt(1);
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
		return totalCost;
	}

	@Override
	public int reportTotalRefunds() {
		int totalRefunds = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT NVL(sum(SELL_PRICE*order_quantity),0) "+
					"FROM orderdetail "+
					"WHERE TO_DATE(SUBSTR(order_id,3,6), 'YYMMDD') >= TRUNC(SYSDATE, 'MONTH') "+
					"AND TO_DATE(SUBSTR(order_id,3,6), 'YYMMDD') <= LAST_DAY(SYSDATE) "+
					"AND ORDER_STATE = 2220";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) totalRefunds = rs.getInt(1);
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
		return totalRefunds;
	}

	@Override
	public int reportTotalReturns() {
		int totalReturn = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT NVL(sum(SELL_PRICE*order_quantity),0) "+
					"FROM orderdetail "+
					"WHERE TO_DATE(SUBSTR(order_id,3,6), 'YYMMDD') >= TRUNC(SYSDATE, 'MONTH') "+
					"AND TO_DATE(SUBSTR(order_id,3,6), 'YYMMDD') <= LAST_DAY(SYSDATE) "+
					"AND order_state = 1220";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) totalReturn = rs.getInt(1);
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
		return totalReturn;
	}	
	
	@Override
	public int confirmOrder(String order_id, int order_state) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			conn.setAutoCommit(false);
			String sql =	"UPDATE orderDetail SET order_state = ? "+
							"WHERE order_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order_state);
			pstmt.setString(2, order_id);
			cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				sql = "SELECT * FROM orderDetail WHERE order_id = ?";
				pstmt.close();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, order_id);
				rs = pstmt.executeQuery();
				
				String ISBN = null;
				int order_quantity = 0;	
				
				if(rs.next()) {
					ISBN = rs.getString("ISBN");
					order_quantity = rs.getInt("order_quantity");
					if(order_state == APP_PURCHASE || order_state == APP_REFUND) {
						sql = "UPDATE stock SET stock = stock + ? WHERE ISBN = ? AND ? > 0";
					} else if(order_state == APP_SALES || order_state == APP_RETURN) {
						sql = "UPDATE stock SET stock = stock - ? WHERE ISBN = ? AND stock >= ?";
					}
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, order_quantity);
					pstmt.setString(2, ISBN);
					pstmt.setInt(3, order_quantity);
					cnt = pstmt.executeUpdate();
					if(cnt == 1) conn.commit();
					else {
						cnt = -1;
						conn.rollback();
					}
				} else {conn.rollback();}
			} else {conn.rollback();}
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
	public int rejectOrder(String order_id, int order_state) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = datasource.getConnection();
			String sql =	"UPDATE orderDetail SET order_state = ? "+
							"WHERE order_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order_state);
			pstmt.setString(2, order_id);
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
	public ArrayList<ViewOrder> getOpSearchOrder(Date order_StartDate, Date order_EndDate, String selectOrderType,
			int selectOrderState) {
		ArrayList<ViewOrder> dtos = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = 	
							"SELECT  * "+
							"FROM    (SELECT O.order_id,OD.detail_number,B.book_title, "+
							        "OD.purchase_price,OD.sell_price,S.stock, "+
							        "OD.order_quantity,OD.order_state,rownum rNum	 "+	
							        "FROM orders O, orderDetail OD, stock S, book B "+
							        "WHERE   O.order_id = OD.order_id "+
							        "AND     OD.ISBN = S.ISBN "+
							        "AND     S.ISBN = B.ISBN "+
							        "AND		SUBSTR(OD.order_id,3,6) >= TO_CHAR(NVL(?,SYSDATE-365),'YYMMDD') "+
							        "AND		SUBSTR(OD.order_id,3,6) <= TO_CHAR(NVL(?,SYSDATE),'YYMMDD') "+
							        "AND 	SUBSTR(OD.order_id,1,2) = CASE NVL(?,'0') "+
							        "        WHEN '0' THEN SUBSTR(O.order_id,1,2) ELSE ? END "+
									"AND		OD.order_state = CASE NVL(?,0) "+
									"		WHEN 0 THEN OD.order_state ELSE ? END "+
									") ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, order_StartDate);
			pstmt.setDate(2, order_EndDate);
			pstmt.setString(3, selectOrderType);
			pstmt.setString(4, selectOrderType);
			pstmt.setInt(5, selectOrderState);
			pstmt.setInt(6, selectOrderState);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dtos = new ArrayList<ViewOrder>();
				do {
					ViewOrder dto = new ViewOrder();
					dto.setOrder_id(rs.getString("order_id"));
					dto.setDetail_number(rs.getInt("detail_number"));
					dto.setBook_title(rs.getString("book_title"));
					dto.setPurchase_price(rs.getInt("purchase_price"));
					dto.setSell_price(rs.getInt("sell_price"));
					dto.setStock(rs.getInt("stock"));
					dto.setOrder_quantity(rs.getInt("order_quantity"));
					dto.setOrder_state(rs.getInt("order_state"));
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
	public int addBook(Book dto) {
		int addCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = datasource.getConnection();
			String sql =	"INSERT INTO book(ISBN,publisher_id,book_title, "+
							"book_author,purchase_price,sell_price) "+
							"VALUES (?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getISBN());
			pstmt.setInt(2, dto.getPublisher_id());
			pstmt.setString(3, dto.getBook_title());
			pstmt.setString(4, dto.getBook_author());
			pstmt.setInt(5, dto.getPurchase_price());
			pstmt.setInt(6, dto.getSell_price());
			addCnt = pstmt.executeUpdate();
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
		return addCnt;
	}

	@Override
	public ArrayList<ViewMyOrder> getMyOrders(String customer_id) {
		ArrayList<ViewMyOrder> dtos = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql =	"SELECT B.ISBN, B.BOOK_TITLE, B.SELL_PRICE book_price, OD.SELL_PRICE, OD.ORDER_QUANTITY, "+
			                "(OD.SELL_PRICE*OD.ORDER_QUANTITY) TOTAL_PRICE, O.customer_id, OD.order_id, OD.order_state "+
			                "FROM    orders O, orderDetail OD, stock S, book B "+
			                "WHERE   O.order_id = OD.order_id "+
			                "AND     OD.ISBN = S.ISBN "+
			                "AND     S.ISBN = B.ISBN "+
			                "AND     O.CUSTOMER_ID = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dtos = new ArrayList<ViewMyOrder>();
				do {
					ViewMyOrder dto = new ViewMyOrder();
					dto.setISBN(rs.getString("ISBN"));
					dto.setBook_title(rs.getString("BOOK_TITLE"));
					dto.setBook_price(rs.getInt("book_price"));
					dto.setSell_price(rs.getInt("SELL_PRICE"));
					dto.setOrder_quantity(rs.getInt("ORDER_QUANTITY"));
					dto.setTotal_price(rs.getInt("TOTAL_PRICE"));
					dto.setCustomer_id(rs.getString("customer_id"));
					dto.setOrder_id(rs.getString("order_id"));
					dto.setOrder_state(rs.getInt("order_state"));
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
	public int reqRefund(String order_id) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = datasource.getConnection();
			String sql =	"UPDATE	orderDetail SET order_state = 2210 "+
							"WHERE	order_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order_id);	
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
	public int getCount_board() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = 	"SELECT count(*) FROM bms_board ";
							
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) cnt = rs.getInt(1); // cnt = null이 아닌 모든 튜플의 개수
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
	public ArrayList<Board> getArticles(int start, int end) {
		ArrayList<Board> dtos = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * "
						+"FROM 	(SELECT num, writer, passwd, subject, content, readCnt, "
									+"ref, ref_step, ref_level, reg_date, ip, rownum rNum "
								+"FROM 	( "
										+"SELECT * FROM bms_board "
										+"ORDER BY ref DESC, ref_step ASC " //1.최신글부터 SELECT
										+") "
								+") " //2.최신글부터 SELECT한 레코드에 rowNum을 추가한다(삭제데이터 제외한 실제데이터를 넘버링)
						+"WHERE rNum >= ? AND rNum <= ?"; //3.넘겨받은 start, end값으로 rowNum을 조회한다
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//1.큰 바구니 생성(dtos)
				dtos = new ArrayList<Board>(end-start+1);
				do {
					//2.작은 바구니를 생성(dto)
					Board dto = new Board();
					//3.게시글 1건을 읽어서 rs를 작은 바구니(dto)에 담는다.
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setReadCnt(rs.getInt("readCnt"));
					dto.setRef(rs.getInt("ref"));
					dto.setRef_step(rs.getInt("ref_step"));
					dto.setRef_level(rs.getInt("ref_level"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setIp(rs.getString("ip"));
					//4.큰 바구니(dtos)에 작은 바구니(dto, 게시글 1건씩)를 담는다.
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
		//5.큰 바구니(dtos)를 반환한다.
		return dtos;
	}

	@Override
	public Board getArticle(int num) {
		Board dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM bms_board WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new Board();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadCnt(rs.getInt("readCnt"));
				dto.setRef(rs.getInt("ref"));
				dto.setRef_step(rs.getInt("ref_step"));
				dto.setRef_level(rs.getInt("ref_level"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setIp(rs.getString("ip"));
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
	public void addReadCnt(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = datasource.getConnection();
			String sql = "UPDATE bms_board SET readCnt = readCnt+1 WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
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
	}

	
	@Override
	public int pwdCheck(int num, String passwd) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM bms_board WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("passwd").equals(passwd)) {cnt = 1;}
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
		return cnt;
	}


	@Override
	public int update(Board dto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = datasource.getConnection();
			String sql = "UPDATE bms_board SET passwd=?,subject=?,content=? WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum());
			cnt = pstmt.executeUpdate();
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
		return cnt;
	}


	@Override
	public int insert(Board dto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = datasource.getConnection();
			
			int num = dto.getNum();
			int ref = dto.getRef();
			int ref_step = dto.getRef_step();
			int ref_level = dto.getRef_level();
			
			String sql = null;
			
			//답변글이 아닌 경우(제목글인 경우)
			if(num == 0) {
				sql = "SELECT MAX(num) FROM bms_board";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				//첫글이 아닌 경우
				if(rs.next()) {
					ref = rs.getInt(1) + 1;
				} else { //첫글인 경우
					ref = 1;
				}
				ref_step = 0;
				ref_level = 0;
			} else { //답변글인 경우
				sql = "UPDATE bms_board SET ref_step = ref_step + 1 "+
				      "WHERE ref = ? AND ref_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, ref_step);
				pstmt.executeUpdate();
				ref_step++;
				ref_level++;
			}
			
			sql = "INSERT INTO bms_board(num, writer, passwd, subject, content, readCnt, "+
			             "ref, ref_step, ref_level, reg_date, ip) "+
			             "VALUES(board_seq.NEXTVAL, ?, ?, ?, ?, 0, ?, ?, ?, ?, ?)";
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, ref_step);
			pstmt.setInt(7, ref_level);
			pstmt.setTimestamp(8, dto.getReg_date());
			pstmt.setString(9, dto.getIp());
			cnt = pstmt.executeUpdate();
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
	public int delete(int num) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = datasource.getConnection();
			sql = "SELECT * FROM bms_board WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //넘겨받은 num에 해당하는 키값이 존재하면
				int ref = rs.getInt("ref");
				int ref_step = rs.getInt("ref_step");
				int ref_level = rs.getInt("ref_level");
				//답글이 존재하는지 여부
				sql = "SELECT * FROM bms_board "+
				      "WHERE ref = ? AND ref_step = ?+1 AND ref_level > ?";
				pstmt.close();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, ref_step);
				pstmt.setInt(3, ref_level);
				rs.close();
				rs = pstmt.executeQuery();
				if(rs.next()) { //답글이 있는 경우 삭제하지 않겠다.
					cnt = -1;
				} else { //답글이 없는 경우 삭제전에 삭제글보다 아래에 있는 글들을 step-1을 해서 1줄씩 올린다.
					sql = "UPDATE bms_board SET ref_step = ref_step - 1 "+
				          "WHERE ref = ? AND ref_step > ?";
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, ref);
					pstmt.setInt(2, ref_step);
					pstmt.executeUpdate();
					
					sql = "DELETE FROM bms_board WHERE num = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					cnt = pstmt.executeUpdate();
				}
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
		return cnt;
	}
}
