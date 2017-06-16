package lee.inhong.BMS_JSP.handler.sales;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class CartBuyAllHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■■■CartBuyAllHandler■■■■■");
		
		String customer_id =
				(String) req.getSession().getAttribute("customer_id");
		int employee_id = 0;
		if(req.getSession().getAttribute("employee_id") != null) {
			employee_id = 
					(int) req.getSession().getAttribute("employee_id");
		}
		@SuppressWarnings("unchecked")
		ArrayList<String> ISBNs =
				(ArrayList<String>) req.getSession().getAttribute("cart");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		
		String path = "/view/viewSales/viewCartBuy.jsp";
		
		if(ISBNs != null) {
			System.out.println("DB|addOrder('SE', customer_id, employee_id) : "+customer_id+","+employee_id);
			String order_id = dao.addOrder("SE", customer_id, employee_id);
			System.out.println("DB|addOrder() result : "+order_id);
			
			int check = 0;
			for(int i=0; i<ISBNs.size(); i++) {
				String ISBN = ISBNs.get(i);
				
				System.out.println("DB|selectBookInfo(ISBN) : "+ISBN);
				ViewBook dto = dao.selectBookInfo(ISBN);
				System.out.println("DB|selectBookInfo() result : "+dto);
				
				System.out.println("DB|addOrderDetail(order_id, detail_number, ISBN, order_quentity) : "+order_id+","+ISBN+","+1);
				int cnt = dao.addOrderDetail(order_id, i+1, ISBN, dto.getPurchase_price(), dto.getSell_price(), 1, REQ_SALES);
				System.out.println("DB|addOrderDetail() result : "+cnt);
				if(cnt == 1) check++;
			}
			
			req.setAttribute("check", check); //구매요청된 책의 종류 수	
			req.getSession().setAttribute("cart", null);
			path = "/view/viewSales/cartBuyAll.jsp";
		}
		
		return path;
	}

}
