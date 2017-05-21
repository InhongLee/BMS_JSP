package lee.inhong.BMS_JSP.handler;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewBook;

public class ViewSearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		ArrayList<ViewBook> dtos = new ArrayList<ViewBook>();
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		dtos = dao.selectBookList();
		
		req.setAttribute("bookList", dtos);
		return "/view/viewMain/viewSearch.jsp";
	}

}
