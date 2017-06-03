package lee.inhong.BMS_JSP.dao;

import java.util.ArrayList;

import lee.inhong.BMS_JSP.dto.Customer;
import lee.inhong.BMS_JSP.dto.Publisher;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.dto.ViewStock;
import lee.inhong.BMS_JSP.dto.ViewStockInfo;

public interface BMSDAO {

	public int logInCheck(String strId, String strPw); //로그인 페이지 > id,pw 확인
	public int idCheck(String strId); //회원가입 페이지 > id 중복확인
	public int addCustomer(Customer dto); //회원가입 페이지 > 회원DB에 회원추가
	public Customer selectCustomer(String strId); //내정보 페이지 > 회원정보 보기
	public int updateCustomer(Customer dto); //내정보 페이지 > 회원DB에 회원정보 수정
	public int deleteCustomer(String strId, String strPw);
	
	public ArrayList<ViewBook> selectBookList(); //전체 책목록 검색
	public ViewBook selectBookInfo(String strISBN); //선택된 책 정보 검색
	
	/****************************************************************/
	public int ISBNCheck(String ISBN);
	/****************************************************************/
	public int getCount_book(); //등록된 책의 숫자 확인
	public ArrayList<ViewStock> getStocks(int start, int end); //start에서 end까지의 범위안의 재고를 검색
	public ViewStockInfo getStockInfo(); //재고현황 검색 (총수량, 총비용, 총재고금액)
	public int updateStock(String ISBN, int columnNo, String updateStr); //재고정보 업데이트(재고번호,업데이트칼럼,업데이트내용)
	public ArrayList<Publisher> getPublisher();// 출판사 정보 검색
	public ArrayList<ViewStock> getOpSearchStocks(int publisher_id, String stock_state, int stock); //검색조건 부여 재고 검색
}
