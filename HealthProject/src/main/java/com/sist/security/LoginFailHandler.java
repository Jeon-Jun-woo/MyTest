package com.sist.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailHandler implements AuthenticationFailureHandler{
    private String defaultFailureUrl;
    
	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String errorMsg="아이디 또는 비밀번호가 일치하지 않습니다!!";
		try
		{
			if(exception instanceof BadCredentialsException)
			{
				//BadCredentialsException :    비밀번호가 틀린 경우
				errorMsg="아이디 또는 비밀번호가 일치하지 않습니다";
			}
			else if(exception instanceof InternalAuthenticationServiceException)
			{
			   // InternalAuthenticationServiceException : 아이디가 없는 경우
				errorMsg="아이디 또는 비밀번호가 일치하지 않습니다!!";
			}
			else if(exception instanceof DisabledException)
			{
				// 계정이 비활성화 된 경우 => enabled = 0
				errorMsg="휴먼 계정입니다!!";
			}
		}catch(Exception ex) {}
		request.setAttribute("message", errorMsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}

}
