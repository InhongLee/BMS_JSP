package lee.inhong.BMS_JSP.handler.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ConfirmIdHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		String customer_id = req.getParameter("customer_id");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		int cnt = dao.idCheck(customer_id);
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("customer_id", customer_id);
		return "/view/viewMember/confirmId.jsp";
	}

	
}
