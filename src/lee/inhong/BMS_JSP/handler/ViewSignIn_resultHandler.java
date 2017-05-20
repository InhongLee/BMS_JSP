package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Customer;

public class ViewSignIn_resultHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		int cnt = 0;
		Customer dto = (Customer) req.getSession().getAttribute("customerInfo");
		String agree = req.getParameter("agree");
		
		if(agree.equals("YES")) {
			BMSDAO dao = BMSDAOImpl.getInstance();
			cnt = dao.addCustomer(dto);			
		} else if(agree.equals("NO")) {
			req.getSession().removeAttribute("customer_id");
			req.getSession().removeAttribute("customerInfo");
		}
		
		req.setAttribute("cnt", cnt);
		return "/view/viewMember/viewSignIn_result.jsp";
	}

}
