package lee.inhong.BMS_JSP.handler.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewBook;
import lee.inhong.BMS_JSP.dto.ViewReview;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewReviewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewReviewHandler");
		
		String ISBN = req.getParameter("ISBN");
		
		
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		
		System.out.println("DB|selectBookInfo(ISBN) : "+ISBN);
		ViewBook dto = dao.selectBookInfo(ISBN);
		System.out.println("DB|selectBookInfo() result : "+dto);
		
		System.out.println("DB|getReviews(ISBN) : "+ISBN);
		ArrayList<ViewReview> dtos = dao.getReviews(ISBN);
		if(dtos != null) {
			System.out.println("DB|getReviews() result : "+dtos.size());			
		} else {
			System.out.println("DB|getReviews() result : "+0);
		}

		req.setAttribute("dto", dto);
		req.setAttribute("dtos", dtos);
		
		return "/view/viewReview/viewReview.jsp";
	}

}
