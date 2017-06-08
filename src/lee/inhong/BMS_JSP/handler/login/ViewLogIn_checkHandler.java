package lee.inhong.BMS_JSP.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewLogIn_checkHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewLogIn_checkHandler");
		
		String customer_id = req.getParameter("customer_id");
		String customer_pw = req.getParameter("customer_pw");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|logInCheck(customer_id,customer_pw) result : "+customer_id+","+customer_pw);
		int cnt = dao.logInCheck(customer_id, customer_pw);
		System.out.println("DB|logInCheck() result : "+cnt);
		
		req.setAttribute("cnt", cnt);
		if(cnt == 1) {
			req.getSession().setAttribute("employee_id", 1001);
			req.getSession().setAttribute("customer_id", customer_id);
		}
		
		return "/view/viewLogIn/viewLogIn_check.jsp";
	}

}
