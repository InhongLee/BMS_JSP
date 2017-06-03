package lee.inhong.BMS_JSP.handler.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewStock;
import lee.inhong.BMS_JSP.dto.ViewStockInfo;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewStockHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("SERVICE> ViewStockHandler");
		
		int pageSize	= 100;
		int pageBlock	= 3;
		int cnt			= 0;
		int start		= 0;
		int end			= 0;
		int number		= 0;
		String pageNum	= null;
		int currentPage	= 0;
		
		int pageCount	= 0;
		int	startPage	= 0;
		int endPage		= 0;
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		cnt = dao.getCount_book();
		System.out.println("등록된 책의 총 숫자: "+cnt);
		
		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) { //받아온 페이지 번호가 없는경우(초기시작페이지일 경우) 현재페이지를 1로 설정
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;
		if(cnt > 0) {
			System.out.println("DB|getBooks(start,end) : "+start+","+end);
			ArrayList<ViewStock> dtos = dao.getStocks(start, end);
			System.out.println("DB|getBooks() result : "+dtos);
			req.setAttribute("dtos", dtos);
		}
		
		startPage = (currentPage/pageBlock)*pageBlock+1; //각 pageBlock의 첫페이지를 startPage로 설정
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage+pageBlock-1;
		if(endPage>pageCount) endPage = pageCount;
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("number", number);
		req.setAttribute("pageNum", pageNum);
		
		if(cnt > 0) {
			req.setAttribute("cnt", cnt);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("currentPage", currentPage);
		}
		
		ViewStockInfo dto = dao.getStockInfo();
		req.setAttribute("stockInfo", dto);
		
		return "/view/viewStock/viewStock.jsp";
	}

}
