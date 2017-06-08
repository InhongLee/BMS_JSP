package lee.inhong.BMS_JSP.handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Board;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ContentFormHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ContentFormHandler");
		
		int num = (Integer.parseInt(req.getParameter("num")));
		int pageNum = (Integer.parseInt(req.getParameter("pageNum")));
		int number = (Integer.parseInt(req.getParameter("number")));
		
		//dao 생성(싱글턴, 다형성)
		BMSDAO dao = BMSDAOImpl.getInstance();
		
		//상세페이지 가져오기 - 1건을 가져옴
		Board dto = dao.getArticle(num);
		System.out.println("DB|getArticle() result : "+dto);
		//조회수 증가 (작성자가 조회할 경우는 제외)
		
		if(!req.getRemoteAddr().equals(dto.getIp())) {
			System.out.println("DB|addReadCnt(num) : "+num);
			dao.addReadCnt(num); //웹브라우저의 localhost를 ip값으로 직접입력하면 ip값 제대로 먹힌다.
		}
		req.setAttribute("dto", dto);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("number", number); //db 글번호가 아닌 현재 넘버링한 글번호
	
		return "/view/viewBoard/contentForm.jsp";
	}

}
