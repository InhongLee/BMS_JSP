package lee.inhong.BMS_JSP.handler.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewStock;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class StockOpSearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ StockOpSearchHandler");
		
		String searchTitleAuthor = req.getParameter("searchTitleAuthor");
		int publisher_id = Integer.parseInt(req.getParameter("searchPublisher"));
		int stock_state = 0;
		if(req.getParameter("searchStockState") != null) {
			stock_state = Integer.parseInt(req.getParameter("searchStockState"));
		}
		
		int stock = 0;
		String strStock = req.getParameter("searchStockQty");
		if(!strStock.equals("")) stock = Integer.parseInt(strStock);
		
		System.out.println("[searchTitleAuthor,publisher_id, stock_state, stock]: "+searchTitleAuthor+","+publisher_id+","+stock_state+","+stock);
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		ArrayList<ViewStock> dtos = dao.getOpSearchStocks(searchTitleAuthor, publisher_id, stock_state, stock);
		if(dtos != null) {
			System.out.println("DB|getOpSearchStocks() result : "+dtos.size());
			req.setAttribute("dtos", dtos);
		} else {
			System.out.println("DB|getOpSearchStocks() result : "+0);
		}
		
		
		return "viewStock.do";
	}

}
