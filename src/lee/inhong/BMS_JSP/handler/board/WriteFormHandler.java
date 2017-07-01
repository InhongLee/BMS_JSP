package lee.inhong.BMS_JSP.handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.handler.CommandHandler;

public class WriteFormHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ WriteFormHandler");
		
		//제목글(답변글이 아닌 경우)인 경우
		int num = 0;
		int ref = 1; //그룹화 아이디
		int ref_step = 0 ; //원글에 대해서 몇번째 답변글인가(행)
		int ref_level = 0; //들여쓰기

		//답변글인 경우
		//contentForm.jsp에서 get방식으로 넘긴 값 num, ref, ref_step, ref_level을 받는다.
		if(req.getParameter("num") != null) {
			num = Integer.parseInt(req.getParameter("num"));
			ref = Integer.parseInt(req.getParameter("ref"));
			ref_step = Integer.parseInt(req.getParameter("ref_step"));
			ref_level = Integer.parseInt(req.getParameter("ref_level"));
		}
		
		req.setAttribute("num", num);
		req.setAttribute("ref", ref);
		req.setAttribute("ref_step", ref_step);
		req.setAttribute("ref_level", ref_level);
		
		return "/view/viewBoard/writeForm.jsp";
	}

}
