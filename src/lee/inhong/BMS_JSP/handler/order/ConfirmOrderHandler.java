package lee.inhong.BMS_JSP.handler.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ConfirmOrderHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ConfirmOrderHandler");
		
		String order_id = req.getParameter("order_id");
		int order_state = 0;
		if(req.getParameter("order_state") != null) {
			order_state = Integer.parseInt(req.getParameter("order_state"));
		}
		switch(order_state) {
		case REQ_PURCHASE: order_state = APP_PURCHASE; break;
		case REQ_RETURN: order_state = APP_RETURN; break;
		case REQ_SALES: order_state = APP_SALES; break;
		case REQ_REFUND: order_state = APP_REFUND; break;
		default: break;
		}
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|confirmOrder(order_id,order_state) : "+order_id+","+order_state);
		int cnt = dao.confirmOrder(order_id,order_state);
		System.out.println("DB|confirmOrder() result : "+cnt);
		
		req.setAttribute("confirmCnt", cnt);
		return "/viewOrder.do";
	}

}
