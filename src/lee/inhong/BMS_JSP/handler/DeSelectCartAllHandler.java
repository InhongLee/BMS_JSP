package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeSelectCartAllHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		req.getSession().setAttribute("cart", null);
		return "/view/viewSales/viewCartBuy.jsp";
	}

}
