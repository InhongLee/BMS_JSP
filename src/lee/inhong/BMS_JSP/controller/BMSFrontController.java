package lee.inhong.BMS_JSP.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.handler.CommandHandler;
import lee.inhong.BMS_JSP.handler.ConfirmIdHandler;
import lee.inhong.BMS_JSP.handler.ViewBuyNowHandler;
import lee.inhong.BMS_JSP.handler.ViewInfo_updateHandler;
import lee.inhong.BMS_JSP.handler.ViewLogIn_checkHandler;
import lee.inhong.BMS_JSP.handler.ViewLogOutHandler;
import lee.inhong.BMS_JSP.handler.ViewMemberInfoHandler;
import lee.inhong.BMS_JSP.handler.ViewSalesHandler;
import lee.inhong.BMS_JSP.handler.ViewSearchHandler;
import lee.inhong.BMS_JSP.handler.ViewSignIn_agreeHandler;
import lee.inhong.BMS_JSP.handler.ViewSignIn_resultHandler;
import lee.inhong.BMS_JSP.handler.ViewSignOut_checkHandler;

@WebServlet("*.do")
public class BMSFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BMSFrontController() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		actionDo(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		actionDo(req, res);
	}

	public void actionDo(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String url = uri.substring(contextPath.length());
		
		switch(url) {
		case "/viewSearch.do":				CommandHandler viewSearchHandler = new ViewSearchHandler();
											viewSearchHandler.process(req, res);					System.out.println(url);	break;
		case "/viewLogIn.do":				viewPage = "/view/viewLogIn/viewLogIn.jsp";				System.out.println(url);	break;
		case "/viewLogIn_check.do":			CommandHandler viewLogIn_checkHandler = new ViewLogIn_checkHandler();
											viewPage = viewLogIn_checkHandler.process(req, res);	System.out.println(url);	break;
		case "/viewLogOut.do":				CommandHandler viewLogOutHandler = new ViewLogOutHandler();
											viewPage = viewLogOutHandler.process(req, res);			System.out.println(url);	break;
		case "/viewSignIn.do":				viewPage = "/view/viewMember/viewSignIn.jsp";			System.out.println(url);	break;
		case "/confirmId.do":				CommandHandler confirmIdHandler = new ConfirmIdHandler();
											viewPage = confirmIdHandler.process(req, res);			System.out.println(url);	break;
		case "/viewSignIn_agree.do":		CommandHandler viewSignIn_agreeHandler = new ViewSignIn_agreeHandler();
											viewPage = viewSignIn_agreeHandler.process(req, res);	System.out.println(url);	break;
		case "/viewSignIn_result.do":		CommandHandler viewSignIn_resultHandler = new ViewSignIn_resultHandler();
											viewPage = viewSignIn_resultHandler.process(req, res);	System.out.println(url);	break;
		case "/viewMemberInfo.do":			CommandHandler viewMemberInfoHandler = new ViewMemberInfoHandler();
											viewPage = viewMemberInfoHandler.process(req, res);		System.out.println(url);	break;
		case "/viewInfo_update.do":			CommandHandler viewInfo_updateHandler = new ViewInfo_updateHandler();
											viewPage = viewInfo_updateHandler.process(req, res);	System.out.println(url);	break;
		case "/viewSignOut.do":				viewPage = "/view/viewMember/viewSignOut.jsp";			System.out.println(url);	break;
		case "/viewSignOut_check.do":		CommandHandler viewSignOut_checkHandler = new ViewSignOut_checkHandler();
											viewPage = viewSignOut_checkHandler.process(req, res);	System.out.println(url);	break;
		case "/viewSales.do":				CommandHandler viewSalesHandler = new ViewSalesHandler();
											viewPage = viewSalesHandler.process(req, res);			System.out.println(url);	break;
		case "/viewBuyNow.do":				CommandHandler viewBuyNowHandler = new ViewBuyNowHandler();
											viewPage = viewBuyNowHandler.process(req, res);			System.out.println(url);	break;
		default:break;
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		dispatcher.forward(req, res);
	}
}
