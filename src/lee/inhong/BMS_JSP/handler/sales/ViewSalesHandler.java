package lee.inhong.BMS_JSP.handler.sales;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewSalesHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewSalesHandler");
		
		ArrayList<ViewBook> dtos = new ArrayList<ViewBook>();
		ArrayList<ViewBook> bestSeller2 = new ArrayList<ViewBook>();
		ArrayList<ViewBook> bestSeller = new ArrayList<ViewBook>();
		BMSDAO dao = BMSDAOImpl.getInstance();
		dtos = dao.selectBookList();
		System.out.println("DB|selectBookList() result : "+dtos.size());
		
		bestSeller2 = dao.getBestSeller(); //판매량 많은 순으로 ISBN을 반환
		System.out.println("DB|getBestSeller() result : "+bestSeller2.size());
		
		for(int i=0; i<bestSeller2.size(); i++) {
			String ISBN = bestSeller2.get(i).getISBN();
			ViewBook tempBook = dao.selectBookInfo(ISBN);
			bestSeller.add(tempBook);
		}
		
		req.setAttribute("bookList", dtos);
		req.setAttribute("bestSeller", bestSeller);
		return "/view/viewSales/viewSales.jsp";
	}

}
