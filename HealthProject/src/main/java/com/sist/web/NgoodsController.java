package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class NgoodsController {
	
	@GetMapping("goods/goods_list.do")
	public String goods_list(Model model,String type)
	{
		if(type==null)
		{
			type="0";
		}
		model.addAttribute("type",type);
		return "goods/goods_list";
	}
	
	@GetMapping("goods/goods_before_detail.do")
	public String goods_before_detail(int gno,RedirectAttributes ra,
			   HttpServletResponse response)
	{
		   Cookie cookie=new Cookie("goods_"+gno, String.valueOf(gno));//cookie는 문자열만 저장이 가능
		   // Cookie(String,String)
		   cookie.setPath("/");
		   cookie.setMaxAge(60*60*24);
		   response.addCookie(cookie);
		   ra.addAttribute("gno", gno);
		   return "redirect:../goods/goods_detail.do";
	}
	@GetMapping("goods/goods_detail.do")
	public String goods_detail(int gno,Model model)
	{
		   model.addAttribute("gno", gno);
		   return "goods/goods_detail";   
	}
	
	
	
	
	//////////////////////////////buy
	
	@GetMapping("goods/goodsBuy.do")
	public String goods_buy()
	{
		return "goods/goodsBuy";
	}

}
