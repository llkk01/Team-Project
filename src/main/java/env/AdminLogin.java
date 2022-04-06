package env;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminLogin extends HandlerInterceptorAdapter {
	
	//Admin 관리자용
	@Override
	public boolean preHandle(HttpServletRequest request,
							HttpServletResponse response,
							Object handler) throws Exception {
		
		HttpSession session = request.getSession(false);
		// 로그인중인지 확인
		boolean loginIn = false;
		
		if((session!=null && session.getAttribute("id")!=null) && session.getAttribute("id").equals("admin")) {
			loginIn = true;
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자만 이용 가능합니다.'); "
				+ "location.href='/adminlogin';</script>");
			return false;
		} 
		
		return loginIn;
	}

}