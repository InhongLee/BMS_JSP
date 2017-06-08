package lee.inhong.BMS_JSP.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.inhong.BMS_JSP.dto.BMSCode;

public interface CommandHandler extends BMSCode{

	public String process(HttpServletRequest req, HttpServletResponse res);
}
