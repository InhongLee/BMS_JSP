package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewSignOutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("ViewSignOutHandler");
		return "/view/viewMember/viewSignOut.jsp";
	}

}
