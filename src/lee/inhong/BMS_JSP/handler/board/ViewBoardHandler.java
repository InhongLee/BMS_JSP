package lee.inhong.BMS_JSP.handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dao.BMSDAO;
import lee.inhong.BMS_JSP.dao.BMSDAOImpl;
import lee.inhong.BMS_JSP.dto.Board;
import lee.inhong.BMS_JSP.handler.CommandHandler;

public class ViewBoardHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("■■■SERVICE■■■ ViewBoardHandler");
		
		
		int pageSize 	= 10; //한 페이지당 출력할 글 개수
		int pageBlock 	= 3; //하단에 표시할 페이지 개수
		int cnt 		= 0; //글 개수
		int start 		= 0; //현재 페이지 시작번호 : rownum
		int end 		= 0; //현재 페이지 끝번호: rownum
		int number 		= 0; //출력할 글번호
		String pageNum	= null; //페이지 번호
		int currentPage	= 0; //현재 페이지
		
		int pageCount	= 0; //페이지 개수
		int startPage	= 0; //출력되는 페이지목록의 시작 페이지
		int endPage		= 0; //출력되는 페이지목록의 마지막 페이지
		
		//dao 객체 생성(싱글톤, 다형성)
		BMSDAO dao = BMSDAOImpl.getInstance();
		
		//글의 개수 구하기
		cnt = dao.getCount_board();
		System.out.println("DB|getCount_board() result : "+cnt);
		
		if(cnt > 0) {
			ArrayList<Board> announce = dao.getAnnounce();
			if(announce != null) {
				System.out.println("DB|getAnnounce() result : "+announce.size());
				pageSize -= announce.size();
				req.setAttribute("announce", announce);
			} else {
				System.out.println("DB|getAnnounce() result : "+0);
			}
		}
		
		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1"; //첫페이지를 1페이지로 설정
		}
		
		currentPage = (Integer.parseInt(pageNum)); // 가장 최신페이지가 1페이지
		pageCount = (cnt/pageSize) + ((cnt%pageSize > 0) ? 1 : 0);
		//데이터베이스 검색할 때 전체 글을 검색하지 말고 필요한 부분만을 검색하기 위해 사용
		start = (currentPage - 1) * pageSize + 1; //현재 페이지의 시작 번호  (5-1)*5+1 = 21
		end = start + pageSize - 1; //현재 페이지의 마지막 번호 21+5-1 = 25
		
		if(end > cnt) end = cnt;
		
		//글번호
		number = cnt - (currentPage - 1) * pageSize;
		
		if(cnt > 0) {
			System.out.println("DB|getArticles(start,end) : "+start+","+end);
			ArrayList<Board> dtos = dao.getArticles(start, end);
			System.out.println("DB|getArticles() result : "+dtos.size());
			req.setAttribute("dtos", dtos);
			
			
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1; //(5/3)*3+1 = 1*3+1 = 4
		if((currentPage % pageBlock) == 0) startPage -= pageBlock; //(5%3) == 0
		
		endPage = startPage + pageBlock - 1; //4+3-1 = 6
		if(endPage > pageCount) endPage = pageCount; //(6 > 5) endPage = 5

		req.setAttribute("cnt", cnt);					//글개수
		req.setAttribute("number", number);				//글번호
		req.setAttribute("pageNum", pageNum);			//페이지번호
		
		if(cnt > 0) {
			req.setAttribute("cnt", cnt);				//글개수
			req.setAttribute("startPage", startPage);	//시작페이지
			req.setAttribute("endPage", endPage);		//마지막페이지
			req.setAttribute("pageBlock", pageBlock);	//출력할페이지 개수 =3
			req.setAttribute("pageCount", pageCount);	//페이지개수
			req.setAttribute("currentPage", currentPage); //현재페이지
		}
		
		
		
		return "/view/viewBoard/viewBoard.jsp";
	}

}
