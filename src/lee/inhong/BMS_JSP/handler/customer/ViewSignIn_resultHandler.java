package lee.inhong.BMS_JSP.handler.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Customer;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewSignIn_resultHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		int cnt = 0;
		Customer dto = (Customer) req.getSession().getAttribute("customerInfo");
		String agree = req.getParameter("agree");

		if(agree.equals("YES")) {
			BMSDAO dao = BMSDAOImpl.getInstance();
			cnt = dao.addCustomer(dto);	
			req.getSession().removeAttribute("customerInfo");
		}
		req.setAttribute("cnt", cnt);
		return "/view/viewMember/viewSignIn_result.jsp";
	}

}
