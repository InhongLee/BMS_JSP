package lee.inhong.BMS_JSP.handler.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ReqRefundHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ReqRefundHandler");
		
		String order_id = req.getParameter("order_id");
		
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|reqRefund(order_id) : "+order_id);
		int cnt = dao.reqRefund(order_id);
		System.out.println("DB|reqRefund() result : "+cnt);
		
		
		return "viewMemberInfo.do";
	}

}
