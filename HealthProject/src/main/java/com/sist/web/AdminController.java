package com.sist.web;

import java.util.*;


import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.*;
import com.sist.vo.*;

@Controller
public class AdminController {
	@Autowired
	private MemberService mService;
	
	@GetMapping("admin/member.do")
	public String admin_member(String page,Model model)
	{
//		if(page==null)
//			page="1";
//		int curpage=Integer.parseInt(page);
//		int rowSize=15;
//		int start=(rowSize*curpage)-(rowSize-1);
//		int end=rowSize*curpage;
//		
//		Map map=new HashedMap();
//		
//		
//		map.put("start", start);
//		map.put("end", end);
//		
//		List<MemberVO> mList=mService.memberListData(map);
//		model.addAttribute("mList", mList);
		return "admin/member";
	}
}
