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
/**
 * @author amaco78
 * @version 1.0
 * @since 2017-06-04
 * @
 * 허가되지 않은 사용자가 지정된 페이지로 접근시 로그인 페이지로 보낸는 필터
 * urlPatterns : 필터를 적용할 url
 * customer_id : session에 저장된 로그인계정의 id
 */
@WebFilter(filterName="LoginCheckFilter",
		   urlPatterns={"/viewStock.do",
				   		"/viewMemberInfo.do",
				   		"/stockOpSearch.do",
				   		"/buyOrder.do",
				   		"/viewOrder.do",
				   		"/reviewPro.do"})
public class LoginCheckFilter implements Filter {
	@Override
	public void init(FilterConfig config) throws ServletException {
	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("---FILTER--- LoginCheckFilter");
		HttpServletRequest httpRequest = (HttpServletRequest) req;
		HttpSession session = httpRequest.getSession(false);
		
		boolean login = false;
		if(session != null) {
			if(session.getAttribute("customer_id") != null) {
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
