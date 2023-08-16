package com.skkcandle.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.skkcandle.dto.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginCheckInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//log.info("실행");

		HandlerMethod hm = (HandlerMethod) handler;
		Login login = hm.getMethodAnnotation(Login.class);
				
		if(login != null) {
			// @Login이 붙어있다면
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("ch13Login");
			// 로그인이 되었다면
			if(user != null) {
				return true;
			} else {
				response.sendRedirect(request.getContextPath() + "/ch13/login");
				return false;
			}
		} else {
			return true;
		}
	}
}