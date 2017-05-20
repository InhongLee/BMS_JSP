package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Customer;

public class ViewMemberInfoHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		String customer_id = (String) req.getSession().getAttribute("customer_id");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		Customer dto = dao.selectCustomer(customer_id);
		
		req.setAttribute("memberInfo", dto);
		return "/view/viewMember/viewMemberInfo.jsp";
	}

}
