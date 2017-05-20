package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Customer;

public class ViewInfo_updateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		int cnt = 0;
		Customer dto = new Customer();
		dto.setCustomer_id(req.getParameter("customer_id"));
		dto.setCustomer_pw(req.getParameter("customer_pw"));
		dto.setCustomer_name(req.getParameter("customer_name"));
		dto.setCustomer_sid1(req.getParameter("customer_sid1"));
		dto.setCustomer_sid2(req.getParameter("customer_sid2"));
		dto.setCustomer_hp(req.getParameter("customer_hp1")+req.getParameter("customer_hp2")+req.getParameter("customer_hp3"));
		dto.setCustomer_email(req.getParameter("customer_email1")+"@"+req.getParameter("customer_email2"));

		BMSDAO dao = BMSDAOImpl.getInstance();
		cnt = dao.updateCustomer(dto);			
		
		req.setAttribute("cnt", cnt);
		return "/view/viewMember/viewInfo_update.jsp";
	}

}
