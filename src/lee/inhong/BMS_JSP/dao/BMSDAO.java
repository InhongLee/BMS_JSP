package lee.inhong.BMS_JSP.dao;

import lee.inhong.BMS_JSP.dto.Customer;

public interface BMSDAO {

	public int idCheck(String strId); //회원가입 페이지 > id 중복확인
	public int addCustomer(Customer dto); //회원가입 페이지 > 회원DB에 회원추가
}
