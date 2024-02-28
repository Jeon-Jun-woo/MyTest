package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SportsReserveController {
	@GetMapping("yp/yp_find.do")
	public String yp_find()
	{
		return "yp/yp_find";
	}
	
	@GetMapping("yp/yp_list.do")
	public String yp_list()
	{
		return "yp/yp_list";
	}
	
	@GetMapping("yp/yp_before_list_detail.do")
	public String yp_before_detail(int no, RedirectAttributes ra, HttpServletResponse response)
	{
		Cookie cookie=new Cookie("yp_"+no, String.valueOf(no));//cookie는 문자열만 저장이 가능
		// Cookie(String,String)
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		ra.addAttribute("no", no);
		return "redirect:../yp/yp_list_detail.do";
	}
	
	@GetMapping("yp/yp_list_detail.do")
	public String yp_list_detail(int no,Model model, HttpSession session)
	{
		String userId=(String)session.getAttribute("userId");
		String sessionId="";
		if(userId==null)
			sessionId="";
		else
			sessionId=userId;
		model.addAttribute("no", no);
		model.addAttribute("sessionId", sessionId);
		
		return "yp/yp_list_detail"; 
	}
	
	
//	@GetMapping("recipe/recipe_test.do")
//	public String food_test()
//	{
//		return "recipe/recipe_test";
//	}
}