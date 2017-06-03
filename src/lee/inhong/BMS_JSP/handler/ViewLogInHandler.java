package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewLogInHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("ViewLogInHandler");
		return "/view/viewLogIn/viewLogIn.jsp";
	}

}
