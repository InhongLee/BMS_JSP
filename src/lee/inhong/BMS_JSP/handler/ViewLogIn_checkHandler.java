package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;

public class ViewLogIn_checkHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		String customer_id = req.getParameter("customer_id");
		String customer_pw = req.getParameter("customer_pw");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		int cnt = dao.logInCheck(customer_id, customer_pw);
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("customer_id", customer_id);
		return "/view/viewLogIn/viewLogIn_check.jsp";
	}

}
