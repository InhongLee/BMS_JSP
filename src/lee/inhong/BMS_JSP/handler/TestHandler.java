package lee.inhong.BMS_JSP.handler;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.ViewStock;


public class TestHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		BMSDAO dao = BMSDAOImpl.getInstance();
		ArrayList<ViewStock> dtos = dao.getStocks(1, 100);
		
		req.setAttribute("dtos", dtos);
		
		return "/view/test/ajaxTest.jsp";
	}

}
