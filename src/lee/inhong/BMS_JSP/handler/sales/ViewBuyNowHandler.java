package lee.inhong.BMS_JSP.handler.sales;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewBuyNowHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewBuyNowHandler");
		
		ViewBook dto = new ViewBook();
		String strISBN = req.getParameter("ISBN");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|selectBookInfo(ISBN) : "+strISBN);
		dto = dao.selectBookInfo(strISBN);
		System.out.println("DB|selectBookInfo() result : "+dto);
		
		int point = (int)(dto.getSell_price()*0.05);
		
		req.setAttribute("bookInfo", dto);
		req.setAttribute("point", point);
		return "/view/viewSales/viewBuyNow.jsp";
	}

}
