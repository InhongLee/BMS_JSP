package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;

public class ViewSignOut_checkHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		String customer_id = req.getParameter("customer_id");
		String customer_pw = req.getParameter("customer_pw");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		int cnt = dao.deleteCustomer(customer_id, customer_pw);
		req.setAttribute("cnt", cnt);
		
		return "/view/viewMember/viewSignOut_check.jsp";
	}

}
