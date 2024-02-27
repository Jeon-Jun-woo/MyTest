package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.manager.WordManager;
import com.sist.service.*;
import com.sist.vo.*;

@Controller
public class AdminController {
	@Autowired
	private MemberService mService;
	
	@Autowired
	private SomoimService sService;
	
	 @Autowired
	   private WordManager mgr;
	 
	@GetMapping("admin/member.do")
	public String admin_member(String page,Model model)
	{
		List<MemberVO> mlist = mService.AllmemberInfo();
		String somoimtypee="";
		for (MemberVO member : mlist) 
		{
			int somoimnum=member.getSomoimno();
			String typee=sService.somoimTypeeCheck(somoimnum);
			somoimtypee+=" "+typee;
		}
		System.out.println("소모임타입문장 : "+somoimtypee);
		List<WordVO> list=mgr.wordListData(somoimtypee);
		
		model.addAttribute("list", list);
		
		return "admin/member";
	}
}
