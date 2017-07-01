package lee.inhong.BMS_JSP.handler.customer;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Customer;
import lee.inhong.BMS_JSP.dto.ViewMyOrder;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewMemberInfoHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewMemberInfoHandler");
		
		String customer_id = (String) req.getSession().getAttribute("customer_id");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|selectCustomer(customer_id) : "+customer_id);
		Customer dto = dao.selectCustomer(customer_id);
		System.out.println("DB|selectCustomer() result : "+dto);
		
		
		System.out.println("DB|getMyOrders(customer_id) : "+customer_id);
		ArrayList<ViewMyOrder> dtos = dao.getMyOrders(customer_id);
		if(dtos != null) {
			System.out.println("DB|getMyOrders() result : "+dtos.size());			
		} else {
			System.out.println("DB|getMyOrders() result : "+0);
		}
		
		req.setAttribute("memberInfo", dto);
		req.setAttribute("myOrders", dtos);
		return "/view/viewMember/viewMemberInfo.jsp";
	}
}
