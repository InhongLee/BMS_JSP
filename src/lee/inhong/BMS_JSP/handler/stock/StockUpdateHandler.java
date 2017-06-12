package lee.inhong.BMS_JSP.handler.stock;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class StockUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ StockUpdateHandler");
		System.out.println(req.getParameter("test"));
		int updateCnt = 0;
		
		String eId = (String) req.getSession().getAttribute("customer_id");
		String ISBN = req.getParameter("ISBN");
		int columnNo = Integer.parseInt(req.getParameter("columnNo"));
		String updateStr = req.getParameter("updateStr");
		
		System.out.println("eId,ISBN,columNo,updateStr : "+eId+","+ISBN+","+columnNo+","+updateStr);
		BMSDAO dao = BMSDAOImpl.getInstance();
		
		updateCnt = dao.updateStock(ISBN, columnNo, updateStr);
		System.out.println("DB|updateStock() result : "+updateCnt);
		
		req.setAttribute("updateCnt", updateCnt);
		
		return "viewStock.do";
	}

}
