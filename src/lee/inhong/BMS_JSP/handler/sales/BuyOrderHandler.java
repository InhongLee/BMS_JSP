package lee.inhong.BMS_JSP.handler.sales;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class BuyOrderHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ BuyOrderHandler");
		
		String customer_id = (String) req.getSession().getAttribute("customer_id");
		String ISBN = req.getParameter("ISBN");
		int order_quentity = Integer.parseInt(req.getParameter("order_quentity"));
		int employee_id = 0;
		if(req.getSession().getAttribute("employee_id") != null) {
			employee_id = (int) req.getSession().getAttribute("employee_id");
		}
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|selectBookInfo(ISBN) : "+ISBN);
		ViewBook dto = dao.selectBookInfo(ISBN);
		System.out.println("DB|selectBookInfo() result : "+dto);
		
		System.out.println("DB|addOrder('SE', customer_id, employee_id) : "+customer_id+","+employee_id);
		String order_id = dao.addOrder("SE", customer_id, employee_id);
		System.out.println("DB|addOrder() result : "+order_id);
		
		System.out.println("DB|addOrderDetail(order_id, 1, ISBN, order_quentity) : "+order_id+","+ISBN+","+order_quentity);
		int cnt = dao.addOrderDetail(order_id, 1, ISBN, dto.getPurchase_price(), dto.getSell_price(), order_quentity, REQ_SALES);
		System.out.println("DB|addOrderDetail() result : "+cnt);
		
		req.setAttribute("cnt", cnt);
		
		return "/view/viewSales/buyOrder.jsp";
	}

}
