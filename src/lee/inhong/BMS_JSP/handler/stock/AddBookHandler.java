package lee.inhong.BMS_JSP.handler.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Publisher;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class AddBookHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ AddBookHandler");
		
		//출판사 목록
		BMSDAO dao = BMSDAOImpl.getInstance();
		ArrayList<Publisher> publishers = dao.getPublisher();
		System.out.println("DB|getPublisher() result : "+publishers.size());
		req.setAttribute("publishers", publishers);
		
		return "/view/viewStock/addBook.jsp";
	}

}
