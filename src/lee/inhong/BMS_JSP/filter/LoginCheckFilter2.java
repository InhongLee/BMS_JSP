package lee.inhong.BMS_JSP.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="LoginCheckFilter2",
			urlPatterns={"/viewStock.do",
						"/viewOrder.do"})
public class LoginCheckFilter2 implements Filter {
	@Override
	public void init(FilterConfig config) throws ServletException {
	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("---FILTER--- LoginCheckFilter2");
		HttpServletRequest httpRequest = (HttpServletRequest) req;
		HttpSession session = httpRequest.getSession(false);
		
		boolean login = false;
		if(session != null) {
			if(session.getAttribute("employee_id") != null) {
				login = true;
			}
		}
		if(login) {
			chain.doFilter(req, res);
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("viewLogIn.do");
			dispatcher.forward(req, res);
		}
	}
	@Override
	public void destroy() {
	}
}
