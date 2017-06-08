package lee.inhong.BMS_JSP.handler.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lee.inhong.BMS_JSP.dto.Customer;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewSignIn_agreeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		Customer dto = new Customer();
		dto.setCustomer_id(req.getParameter("customer_id"));
		dto.setCustomer_pw(req.getParameter("customer_pw"));
		dto.setCustomer_name(req.getParameter("customer_name"));
		dto.setCustomer_sid1(req.getParameter("customer_sid1"));
		dto.setCustomer_sid2(req.getParameter("customer_sid2"));
		
		String hp = "";
		String hp1 = req.getParameter("customer_hp1");
		String hp2 = req.getParameter("customer_hp2");
		String hp3 = req.getParameter("customer_hp3");
		if(!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
			hp = hp1+"-"+hp2+"-"+hp3;
			dto.setCustomer_hp(hp);
		}
		
		String email  = "";
		String email1 = req.getParameter("customer_email1");
		String email2 = req.getParameter("customer_email2");
		String email3 = req.getParameter("customer_email3");
		if(email3.equals("0")) {email = email1+"@"+email2;}
		else {email = email1+"@"+email3;}
		dto.setCustomer_email(email);

		req.setAttribute("customerInfo", dto);
		return "/view/viewMember/viewSignIn_agree.jsp";
	}

}
