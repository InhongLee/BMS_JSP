package lee.inhong.BMS_JSP.handler;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewBook;

public class DeSelectCartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		@SuppressWarnings("unchecked")
		ArrayList<String> cart = (ArrayList<String>) req.getSession().getAttribute("cart");
		String ISBN = req.getParameter("ISBN");
		cart.remove(ISBN);
		req.getSession().setAttribute("cart", cart);
		
		@SuppressWarnings("unchecked")
		ArrayList<String> ISBNs = (ArrayList<String>) req.getSession().getAttribute("cart");
		ArrayList<ViewBook> bookInfos = new ArrayList<ViewBook>();
		BMSDAO dao = BMSDAOImpl.getInstance();
		for(int i=0; i<ISBNs.size(); i++) {
			ViewBook tempBookInfo = dao.selectBookInfo(ISBNs.get(i));
			if(tempBookInfo != null) bookInfos.add(tempBookInfo);
		}
		
		req.setAttribute("bookInfos", bookInfos);
		
		return "/view/viewSales/viewCartBuy.jsp";
	}

}
