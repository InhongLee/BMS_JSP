package lee.inhong.BMS_JSP.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewLogOutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewLogOutHandler");
		
		req.getSession().setAttribute("customer_id", null);
		req.getSession().setAttribute("employee_id", null);
		
		return "/view/viewLogIn/viewLogOut.jsp";
	}

}
