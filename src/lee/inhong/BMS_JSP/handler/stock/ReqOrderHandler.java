package lee.inhong.BMS_JSP.handler.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ReqOrderHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ReqOrderHandler");
		
		int order_quantity	= Integer.parseInt(req.getParameter("order_quantity"));
		String customer_id		= req.getParameter("customer_id");
		int employee_id		= Integer.parseInt(req.getParameter("employee_id"));
		String ISBN			= req.getParameter("ISBN");
		int tabNo			= Integer.parseInt(req.getParameter("tabNo"));
		String order_code = "PU";
		int order_state	= 0;
		
		if(tabNo == 1) {order_state = REQ_PURCHASE;}
		else if(tabNo == 2) {order_state = REQ_RETURN;}
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|selectBookInfo(ISBN) : "+ISBN);
		ViewBook dto = dao.selectBookInfo(ISBN);
		System.out.println("DB|selectBookInfo() result : "+dto);
		
		System.out.println("DB|addOrder(order_code, customer_id, employee_id) : "+order_code+","+customer_id+","+employee_id);
		String order_id = dao.addOrder(order_code, customer_id, employee_id);
		System.out.println("DB|addOrder() result : "+order_id);
		
		System.out.println("DB|addOrderDetail(order_id,ISBN,purchase_price,sell_price,order_quantity,order_state) : "+
							order_id+","+ISBN+","+dto.getPurchase_price()+","+dto.getSell_price()+","+order_quantity+","+order_state);
		int addCnt = dao.addOrderDetail(order_id, 1, ISBN, dto.getPurchase_price(), dto.getSell_price(), order_quantity, order_state);
		System.out.println("DB|addOrderDetail() result : "+addCnt);
		
		return "/viewStock.do";
	}

}
