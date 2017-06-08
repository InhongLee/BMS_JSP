package lee.inhong.BMS_JSP.handler.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Review;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ReviewProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ReviewProHandler");
		
		String ISBN = req.getParameter("ISBN");
		int starpoint = 0;
		if(req.getParameter("starpoint") != "") {
			starpoint = Integer.parseInt(req.getParameter("starpoint"));
		}
		String content = req.getParameter("content");
		String customer_id = (String) req.getSession().getAttribute("customer_id");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		Review dto = new Review();
		dto.setISBN(ISBN);
		dto.setCustomer_id(customer_id);
		dto.setContent(content);
		dto.setStarpoint(starpoint);
		
		System.out.println("DB|addReview(dto) : "+dto);
		int cnt = dao.addReview(dto);
		System.out.println("DB|addReview() result : "+cnt);
		
		return "viewReview.do";
	}

}
