package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MypageController {
	@GetMapping("mypage/jjim.do")
	public String mypage_jjim(String page,Model model)
	{

		return "mypage/somoim_jjim";
	}
	
	@GetMapping("member/update.do")
    public String member_update()
    {
    	return "member/update";
    }
	
	@GetMapping("mypage/mypage_menu.do")
	public String mypage_menu()
	{
		return "mypage_menu";
	}
	
	
	@GetMapping("mypage/reserve_list.do")
	public String mypage_reserve()
	{
		return "mypage/reserve_list";
	}
}
