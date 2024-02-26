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
}
