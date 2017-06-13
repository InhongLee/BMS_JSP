package lee.inhong.BMS_JSP.dao;

import java.sql.Date;
import java.util.ArrayList;

import lee.inhong.BMS_JSP.dto.BMSCode;
import lee.inhong.BMS_JSP.dto.Board;
import lee.inhong.BMS_JSP.dto.Book;
import lee.inhong.BMS_JSP.dto.Customer;
import lee.inhong.BMS_JSP.dto.Publisher;
import lee.inhong.BMS_JSP.dto.Review;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.dto.ViewMyOrder;
import lee.inhong.BMS_JSP.dto.ViewOrder;
import lee.inhong.BMS_JSP.dto.ViewOrderTrend;
import lee.inhong.BMS_JSP.dto.ViewReview;
import lee.inhong.BMS_JSP.dto.ViewStock;
import lee.inhong.BMS_JSP.dto.ViewStockInfo;

public interface BMSDAO extends BMSCode{

	public int logInCheck(String strId, String strPw); //로그인 페이지 > id,pw 확인
	public int idCheck(String strId); //회원가입 페이지 > id 중복확인
	public int addCustomer(Customer dto); //회원가입 페이지 > 회원DB에 회원추가
	public Customer selectCustomer(String strId); //내정보 페이지 > 회원정보 보기
	public int updateCustomer(Customer dto); //내정보 페이지 > 회원DB에 회원정보 수정
	public int deleteCustomer(String strId, String strPw);
	
	public ArrayList<ViewBook> selectBookList(); //전체 책목록 검색
	public ArrayList<ViewBook> getIssueBook(); //화제의 책목록
	public ArrayList<ViewBook> getBestSeller(); //베스트셀러 책목록
	public ViewBook selectBookInfo(String strISBN); //선택된 책 정보 검색
	
	
	public ArrayList<ViewMyOrder> getMyOrders(String customer_id); //고객이 구매한 제품 목록
	public int reqRefund(String order_id); //환불요청
	/****************************************************************/
	public int ISBNCheck(String ISBN);
	/****************************************************************/
	public int getCount_book(); //등록된 책의 숫자 확인
	public ArrayList<ViewStock> getStocks(int start, int end); //start에서 end까지의 범위안의 재고를 검색
	public ViewStockInfo getStockInfo(); //재고현황 검색 (총수량, 총비용, 총재고금액)
	public int updateStock(String ISBN, int columnNo, String updateStr); //재고정보 업데이트(재고번호,업데이트칼럼,업데이트내용)
	public ArrayList<Publisher> getPublisher();// 출판사 정보 검색
	public ArrayList<ViewStock> getOpSearchStocks(String searchTitleAuthor, int publisher_id, int stock_state, int stock); //검색조건 부여 재고 검색
	public String addOrder(String order_code,int publisher_id, String customer_id, int employee_id); //오더추가
	public int addOrderDetail(String order_id, String ISBN, int pCost, int sPrice, int order_quentity, int order_state); //오더새부사항등록
	public int resetOrderSerial();//order_id의 하위 시리얼넘버 초기화(날짜변경시)
	public int addBook(Book dto); //책 등록
	/****************************************************************/
	public int getCount_order(); //등록된 오더의 숫자 확인
	public ArrayList<ViewOrder> getOrders(int start, int end); //start에서 end까지의 범위안의 주문을 검색
	public int reportTotalSales(); //이달의 매출총액
	public int reportTotalRefunds(); //이달의 환불총액
	public int reportTotalCost(); //이달의 비용총액
	public int reportTotalReturns(); //이달의 반품총액
	public int confirmOrder(String order_id, int order_state); //주문 승인
	public int rejectOrder(String order_id, int order_state); //주문 거부
	public ArrayList<ViewOrder> getOpSearchOrder(String searchTitleAuthor, Date order_StartDate, Date order_EndDate, String selectOrderType,
			int selectOrderState); //주문현황 검색(검색시작일,검색종료일,주문종류,주문상태)
	public ArrayList<ViewOrderTrend> getTrend(); //주별판매량,판매금액 추이 확인
	/*****************************************************************/
	public int getCount_board(); //등록된 글의 숫자 확인
	public ArrayList<Board> getArticles(int start, int end); //리스트 호출
	public ArrayList<Board> getAnnounce(); //공지사항 호출
	public Board getArticle(int num); //상세페이지 호출(리스트,수정)
	public void addReadCnt(int num); //조회수 추가
	public int pwdCheck(int num, String passwd); //비밀번호 체크
	public int update(Board dto); //글수정
	public int insert(Board dto); //게시글 및 답변글 작성
	public int delete(int num); //글삭제
	/*****************************************************************/
	public ArrayList<ViewReview> getReviews(String ISBN); //제품리뷰 리스트 호출
	public int addReview(Review dto); //리뷰등록
}
