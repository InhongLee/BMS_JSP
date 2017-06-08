package lee.inhong.BMS_JSP.handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class DeleteProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ DeleteProHandler");
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String passwd = req.getParameter("passwd");
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|pwdCheck(num, passwd) : "+num+","+passwd);
		int selectCnt = dao.pwdCheck(num, passwd);
		System.out.println("DB|pwdCheck() result : "+selectCnt);
		
		if(selectCnt == 1) {
			System.out.println("DB|delete(num) : "+num);
			int deleteCnt = dao.delete(num);
			System.out.println("DB|delete() result : "+deleteCnt);
			req.setAttribute("deleteCnt", deleteCnt);
		}
		
		req.setAttribute("selectCnt", selectCnt);
		req.setAttribute("pageNum", pageNum);
		
		return "/view/viewBoard/deletePro.jsp";
	}

}
