package lee.inhong.BMS_JSP.handler.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Book;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class AddBookProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ AddBookProHandler");
		
		Book dto = new Book();
		dto.setISBN(req.getParameter("ISBN"));
		dto.setPublisher_id(Integer.parseInt(req.getParameter("searchPublisher")));
		dto.setBook_title(req.getParameter("book_title"));
		dto.setBook_author(req.getParameter("book_author"));
		dto.setPurchase_price(Integer.parseInt(req.getParameter("purchase_price")));
		dto.setSell_price(Integer.parseInt(req.getParameter("sell_price")));
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		
		System.out.println("DB|addBook(dto) : "+dto);
		int cnt = dao.addBook(dto);
		System.out.println("DB|addBook() result : "+cnt);
		
		req.setAttribute("cnt", cnt);
		
		return "/view/viewStock/addBookPro.jsp";
	}

}
