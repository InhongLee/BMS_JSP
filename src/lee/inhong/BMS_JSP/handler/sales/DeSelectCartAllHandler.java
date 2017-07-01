package lee.inhong.BMS_JSP.handler.sales;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.handler.CommandHandler;

public class DeSelectCartAllHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		req.getSession().setAttribute("cart", null);
		return "/view/viewSales/viewCartBuy.jsp";
	}

}
