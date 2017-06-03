package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewLogOutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		
		req.getSession().setAttribute("customer_id", null);
		
		return "/view/viewLogIn/viewLogOut.jsp";
	}

}