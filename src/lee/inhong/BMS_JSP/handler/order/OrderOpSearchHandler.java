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
		
		String searchTitleAuthor = req.getParameter("searchTitleAuthor");
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
		System.out.println("[searchTitleAuthor]: "+searchTitleAuthor);
		System.out.println("[order_StartDate,order_EndDate]: "+order_StartDate+" ~ "+order_EndDate);
		System.out.println("[selectOrderType,selectOrderState]: "+selectOrderType+","+selectOrderState);
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		
		ArrayList<ViewOrder> dtos = dao.getOpSearchOrder(searchTitleAuthor,order_StartDate,order_EndDate,selectOrderType,selectOrderState);
		if(dtos != null) {
			System.out.println("DB|getOpSearchOrder() result : "+dtos.size());
			for(int i = 0; i < dtos.size(); i++) {
				ViewOrder tempViewOrder = dtos.get(i);
				String order_stateName = null;
				switch(tempViewOrder.getOrder_state()) {
					case REQ_PURCHASE: order_stateName = "REQ_PURCHASE"; break;
					case APP_PURCHASE: order_stateName = "APP_PURCHASE"; break;
					case REJ_PURCHASE: order_stateName = "REJ_PURCHASE"; break;
					case REQ_RETURN: order_stateName = "REQ_RETURN"; break;
					case APP_RETURN: order_stateName = "APP_RETURN"; break;
					case REJ_RETURN: order_stateName = "REJ_RETURN"; break;
					case REQ_SALES: order_stateName = "REQ_SALES"; break;
					case APP_SALES: order_stateName = "APP_SALES"; break;
					case REJ_SALES: order_stateName = "REJ_SALES"; break;
					case REQ_REFUND: order_stateName = "REQ_REFUND"; break;
					case APP_REFUND: order_stateName = "APP_REFUND"; break;
					case REJ_REFUND: order_stateName = "REJ_REFUND"; break;
					default: break;
				}
				
				tempViewOrder.setOrder_stateName(order_stateName);
			}
			req.setAttribute("dtos", dtos);
		} else {
			System.out.println("DB|getOpSearchOrder() result : "+0);
		}
		
		
		return "/view/viewOrder/listOrder.jsp";
	}

}
