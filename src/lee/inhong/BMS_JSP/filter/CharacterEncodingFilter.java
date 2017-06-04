package lee.inhong.BMS_JSP.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * @author amaco78
 * @version 1.0
 * @since 2017-06-04
 * @
 * jsp페이지에서 캐릭터인코딩을 별도로 하지 않도록 필터로 처리
 * urlPatterns : 필터를 적용할 url
 * UTF-8 : 인코딩 할 캐릭터set
 */
@WebFilter(filterName="CharacterEncodingFilter", urlPatterns={"/*"})
public class CharacterEncodingFilter implements Filter {

	private String encoding;
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		encoding = config.getInitParameter("encoding");
		if(encoding == null) {
			encoding = "UTF-8";
		}
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		req.setCharacterEncoding(encoding);
		chain.doFilter(req, res);
	}
	
	@Override
	public void destroy() {
	}
}
