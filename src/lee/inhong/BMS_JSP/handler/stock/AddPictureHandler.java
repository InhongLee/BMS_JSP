package lee.inhong.BMS_JSP.handler.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.handler.CommandHandler;

public class AddPictureHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewStockHandler");
		String ISBN = req.getParameter("ISBN");
		
		req.setAttribute("ISBN", ISBN);
		return "/view/viewStock/addPicture.jsp";
	}

}
