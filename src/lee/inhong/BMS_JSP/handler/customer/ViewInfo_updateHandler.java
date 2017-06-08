package lee.inhong.BMS_JSP.handler.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Customer;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewInfo_updateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewInfo_updateHandler");
		
		int cnt = 0;
		Customer dto = new Customer();
		dto.setCustomer_id((String)req.getSession().getAttribute("customer_id"));
		dto.setCustomer_pw(req.getParameter("customer_pw"));
		dto.setCustomer_name(req.getParameter("customer_name"));

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
		
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|updateCustomer(dto) : "+dto);
		cnt = dao.updateCustomer(dto);			
		System.out.println("DB|updateCustomer() result : "+cnt);
		
		req.setAttribute("cnt", cnt);
		return "/view/viewMember/viewInfo_update.jsp";
	}

}
