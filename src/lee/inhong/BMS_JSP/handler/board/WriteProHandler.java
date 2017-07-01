package lee.inhong.BMS_JSP.handler.board;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Board;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class WriteProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ WriteProHandler");
		
		Board dto = new Board();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setWriter(req.getParameter("writer"));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		dto.setRef(Integer.parseInt(req.getParameter("ref")));
		dto.setRef_step(Integer.parseInt(req.getParameter("ref_step")));
		dto.setRef_level(Integer.parseInt(req.getParameter("ref_level")));
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setIp(req.getRemoteAddr()); //웹브라우저의 localhost를 ip값으로 직접입력하면 ip값 제대로 먹힌다. 
		
		BMSDAO dao = BMSDAOImpl.getInstance();
		System.out.println("DB|insert(dto) : "+dto);
		int cnt = dao.insert(dto);
		System.out.println("DB|insert() result : "+cnt);
		
		req.setAttribute("cnt", cnt);
		
		return "/view/viewBoard/writePro.jsp";
	}

}
