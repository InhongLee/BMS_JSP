package lee.inhong.BMS_JSP.handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Board;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ModifyViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ModifyViewHandler");
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String passwd = req.getParameter("passwd");
		
		//dao 객체생성(싱글톤, 다형성)
		BMSDAO dao = BMSDAOImpl.getInstance();
		
		//selectCnt = pwdCheck(num, passwd)
		System.out.println("DB|pwdCheck(num, passwd) : "+num+","+passwd);
		int selectCnt = dao.pwdCheck(num, passwd);
		System.out.println("DB|pwdCheck() result : "+selectCnt);
		//패스워드 일치시 dto = getArticle(num) 호출
		if(selectCnt == 1) {
			System.out.println("DB|getArticle(num) : "+num);
			Board dto = dao.getArticle(num);
			System.out.println("DB|getArticle() result : "+dto);
			req.setAttribute("dto", dto);
		}
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("selectCnt", selectCnt);
		
		return "/view/viewBoard/modifyView.jsp";
	}

}
