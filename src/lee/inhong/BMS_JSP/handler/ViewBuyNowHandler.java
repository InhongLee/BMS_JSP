package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewBook;

public class ViewBuyNowHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		ViewBook dto = new ViewBook();
		String strISBN = req.getParameter("ISBN");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		dto = dao.selectBookInfo(strISBN);
		
		int point = (int)(dto.getSell_price()*0.05);
		
		req.setAttribute("bookInfo", dto);
		req.setAttribute("point", point);
		return "/view/viewSales/viewBuyNow.jsp";
	}

}
