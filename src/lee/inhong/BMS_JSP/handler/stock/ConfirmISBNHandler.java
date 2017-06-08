package lee.inhong.BMS_JSP.handler.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ConfirmISBNHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ConfirmISBNHandler");
		
		String ISBN = req.getParameter("ISBN");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		
		System.out.println("DB|ISBNCheck(ISBN) result : "+ISBN);
		int	checkCnt = dao.ISBNCheck(ISBN);
		System.out.println("DB|ISBNCheck() result : "+checkCnt);
		
		req.setAttribute("checkCnt", checkCnt);			
		req.setAttribute("ISBN", ISBN);
		
		return "/view/viewStock/confirmISBN.jsp";
	}

}
