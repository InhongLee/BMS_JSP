package lee.inhong.BMS_JSP.handler.order;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewOrder;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class OrderOpSearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ OrderOpSearchHandler");
		Date order_StartDate = null;
		Date order_EndDate = null;
		if(req.getParameter("order_StartDate") != "") {
			order_StartDate = Date.valueOf((req.getParameter("order_StartDate")));			
		}
		if(req.getParameter("order_EndDate") != "") {
			order_EndDate = Date.valueOf((req.getParameter("order_EndDate")));
		}
		String selectOrderType = req.getParameter("selectOrderType");
		int selectOrderState = 0;
		if(req.getParameter("selectOrderState") != null) {
			selectOrderState = Integer.parseInt(req.getParameter("selectOrderState"));
		};
		System.out.println("[order_StartDate,order_EndDate]: "+order_StartDate+" ~ "+order_EndDate);
		System.out.println("[selectOrderType,selectOrderState]: "+selectOrderType+","+selectOrderState);
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		
		ArrayList<ViewOrder> dtos = dao.getOpSearchOrder(order_StartDate,order_EndDate,selectOrderType,selectOrderState);
		if(dtos != null) {
			System.out.println("DB|getOpSearchOrder() result : "+dtos.size());
			req.setAttribute("dtos", dtos);
		} else {
			System.out.println("DB|getOpSearchOrder() result : "+0);
		}
		
		
		return "viewOrder.do";
	}

}
