package lee.inhong.BMS_JSP.handler.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewSignInHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewSignInHandler");
		
		return "/view/viewMember/viewSignIn.jsp";
	}

}
