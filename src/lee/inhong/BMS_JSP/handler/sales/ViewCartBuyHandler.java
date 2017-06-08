package lee.inhong.BMS_JSP.handler.sales;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewCartBuyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		String ISBN = (String) req.getParameter("ISBN");
		System.out.println(ISBN);
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		int cnt = dao.ISBNCheck(ISBN);
		if(cnt == 1) {
			if(req.getSession().getAttribute("cart") == null) {
				ArrayList<String> cart = new ArrayList<String>();
				cart.add(ISBN);
				req.getSession().setAttribute("cart", cart);
			} else {
				@SuppressWarnings("unchecked")
				ArrayList<String> cart = (ArrayList<String>) req.getSession().getAttribute("cart");
				if(!cart.contains(ISBN)) cart.add(ISBN);
				req.getSession().setAttribute("cart", cart);
			}
		}
		@SuppressWarnings("unchecked")
		ArrayList<String> ISBNs = (ArrayList<String>) req.getSession().getAttribute("cart");
		ArrayList<ViewBook> bookInfos = new ArrayList<ViewBook>();
		if(ISBNs != null) {
			for(int i=0; i<ISBNs.size(); i++) {
				ViewBook tempBookInfo = dao.selectBookInfo(ISBNs.get(i));
				if(tempBookInfo != null) bookInfos.add(tempBookInfo);
			}
			req.setAttribute("bookInfos", bookInfos);			
		}
		
		return "/view/viewSales/viewCartBuy.jsp";
	}

}
