package lee.inhong.BMS_JSP.handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Board;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ModifyProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ModifyProHandler");
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String passwd = req.getParameter("passwd");
		
		Board dto = new Board();
		dto.setNum(num);
		dto.setPasswd(passwd);
		dto.setSubject(subject);
		dto.setContent(content);
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|update(dto) : "+dto);
		int cnt = dao.update(dto);
		System.out.println("DB|update() result : "+cnt);
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("pageNum", pageNum);
		
		return "/view/viewBoard/modifyPro.jsp";
	}

}
