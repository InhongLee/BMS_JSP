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
		
		String strId = req.getParameter("customer_id");
		String strPw = req.getParameter("customer_pw");
		String tabNo = req.getParameter("tabNo");

		BMSDAO dao = BMSDAOImpl.getInstance();
		int cnt = 0;
		if(tabNo.equals("1")) {
			System.out.println("DB|logInCheck(customer_id,customer_pw) result : "+strId+","+strPw);
			cnt = dao.logInCheck(strId, strPw);
			System.out.println("DB|logInCheck() result : "+cnt);	
			if(cnt == 1) {
				req.getSession().setAttribute("employee_id", null);
				req.getSession().setAttribute("customer_id", strId);
			}
		} else if(tabNo.equals("2")) {
			System.out.println("DB|logInCheck2(employee_id,employee_pw) result : "+strId+","+strPw);
			cnt = dao.logInCheck2(strId, strPw);
			System.out.println("DB|logInCheck2() result : "+cnt);	
			if(cnt == 1) {
				req.getSession().setAttribute("customer_id", null);
				req.getSession().setAttribute("employee_id", strId);
			}
		}
		
		req.setAttribute("cnt", cnt);
		
		return "/view/viewLogIn/viewLogIn_check.jsp";
	}

}
