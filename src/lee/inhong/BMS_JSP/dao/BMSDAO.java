package lee.inhong.BMS_JSP.dao;

import java.util.ArrayList;

import lee.inhong.BMS_JSP.dto.Customer;
import lee.inhong.BMS_JSP.dto.ViewBook;

public interface BMSDAO {

	public int logInCheck(String strId, String strPw); //로그인 페이지 > id,pw 확인
	public int idCheck(String strId); //회원가입 페이지 > id 중복확인
	public int addCustomer(Customer dto); //회원가입 페이지 > 회원DB에 회원추가
	public Customer selectCustomer(String strId); //내정보 페이지 > 회원정보 보기
	public int updateCustomer(Customer dto); //내정보 페이지 > 회원DB에 회원정보 수정
	public int deleteCustomer(String strId, String strPw);
	
	public ArrayList<ViewBook> selectBookList(); //전체 책목록 검색
	public ViewBook selectBookInfo(String strISBN); //선택된 책 정보 검색
}
