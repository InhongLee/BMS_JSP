package lee.inhong.BMS_JSP.handler.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewOrder;
import lee.inhong.BMS_JSP.dto.ViewOrderTrend;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewOrderHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewOrderHandler");
		
		int pageSize 	= 100;
		int cnt 		= 0;
		int start 		= 0;
		int end 		= 0;
		String pageNum 	= null;
		int currentPage = 0;
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		cnt = dao.getCount_order();
		System.out.println("DB|getCount_order() result : "+cnt);
		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		if(end > cnt) end = cnt;
		
		if(cnt > 0) {
			
			ArrayList<ViewOrder> dtos = (ArrayList<ViewOrder>) req.getAttribute("dtos");
			if(dtos == null) {
				dtos = dao.getOrders(start, end);
				System.out.println("DB|getOrders() result : "+dtos.size());
			}
			
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
		}
		
		req.setAttribute("cnt", cnt);
		

		int totalSales = dao.reportTotalSales();
		System.out.println("DB|repotTotalSales() result : "+totalSales);
		int totalRefunds = dao.reportTotalRefunds();
		System.out.println("DB|reportTotalRefunds() result : "+totalRefunds);
		int totalCost = dao.reportTotalCost();
		System.out.println("DB|reportTotalCost() result : "+totalCost);
		int totalReturn = dao.reportTotalReturns();
		System.out.println("DB|reportTotalReturns() result : "+totalReturn);
		
		int salesProfit = totalSales - totalCost;
		int tax = Math.abs((int)(salesProfit * 0.1));
		int netProfit = salesProfit - tax;
		
		req.setAttribute("totalSales", totalSales);
		req.setAttribute("totalCost", totalCost);
		req.setAttribute("salesProfit", salesProfit);
		req.setAttribute("tax", tax);
		req.setAttribute("netProfit", netProfit);
		
		if(req.getAttribute("confirmCnt") != null) {
			int confirmCnt = (int) req.getAttribute("confirmCnt");
			req.setAttribute("confirmCnt", confirmCnt);
		}
		
		ArrayList<ViewOrderTrend> trend = dao.getTrend();
		System.out.println("DB|getTrend() result : "+trend);
	
		req.setAttribute("trend", trend);
		
		return "/view/viewOrder/viewOrder.jsp";
	}

}
