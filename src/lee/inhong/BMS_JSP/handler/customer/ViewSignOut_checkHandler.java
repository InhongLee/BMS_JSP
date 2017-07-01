package lee.inhong.BMS_JSP.handler.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewSignOut_checkHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewSignOut_checkHandler");
		
		String customer_id = req.getParameter("customer_id");
		String customer_pw = req.getParameter("customer_pw");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		int cnt = dao.deleteCustomer(customer_id, customer_pw);
		System.out.println("cnt : "+cnt);
		if(cnt == 1) req.getSession().invalidate();
		req.setAttribute("cnt", cnt);
		return "/view/viewMember/viewSignOut_check.jsp";
	}

}
