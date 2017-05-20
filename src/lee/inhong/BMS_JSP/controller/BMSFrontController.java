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
import lee.inhong.BMS_JSP.handler.ViewSignIn_agreeHandler;
import lee.inhong.BMS_JSP.handler.ViewSignIn_resultHandler;

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
		case "/viewLogIn.do":				viewPage = "/view/viewLogIn/viewLogIn.jsp";				System.out.println(viewPage);	break;
		case "/viewLogIn_check.do":			viewPage = "/view/viewLogIn/viewLogIn_check.jsp";		System.out.println(viewPage);	break;
		case "/viewSignIn.do":				viewPage = "/view/viewMember/viewSignIn.jsp";			System.out.println(viewPage);	break;
		case "/confirmId.do":				CommandHandler confirmIdHandler = new ConfirmIdHandler();
											viewPage = confirmIdHandler.process(req, res);			System.out.println(viewPage);	break;
		case "/viewSignIn_agree.do":		CommandHandler viewSignIn_agreeHandler = new ViewSignIn_agreeHandler();
											viewPage = viewSignIn_agreeHandler.process(req, res);	System.out.println(viewPage);	break;
		case "/viewSignIn_result.do":		CommandHandler viewSignIn_resultHandler = new ViewSignIn_resultHandler();
											viewPage = viewSignIn_resultHandler.process(req, res);	System.out.println(viewPage);	break;
		case "/viewMemberInfo.do":			viewPage = "/view/viewMember/viewMemberInfo.jsp";		System.out.println(viewPage);	break;
		case "/viewSales.do":				viewPage = "/view/viewSales/viewSales.jsp";				System.out.println(viewPage);	break;
		default:break;
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		dispatcher.forward(req, res);
	}
}
