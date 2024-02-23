package com.sist.web;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.sist.service.*;
import com.sist.vo.*;


@Controller
public class SomoimController {
	@Autowired
	private SomoimService service;
	
	@GetMapping("somoim/list.do")
	public String somoim_list(String type,Model model)
	{
		if(type==null)
		{
			type="0";
		}
		model.addAttribute("type", type);
		return "somoim_list";
	}
	
	@GetMapping("somoim/before_detail.do")
	   public String somoim_before_detail(int sno,RedirectAttributes ra,
			   HttpServletResponse response)
	   {
		   Cookie cookie=new Cookie("somoim_"+sno, String.valueOf(sno));//cookie는 문자열만 저장이 가능
		   // Cookie(String,String)
		   cookie.setPath("/");
		   cookie.setMaxAge(60*60*24);
		   response.addCookie(cookie);
		   ra.addAttribute("sno", sno);
		   return "redirect:../somoim/detail.do";
	   }
	
	@GetMapping("somoim/detail.do")
	public String somoim_detail(String page,int sno,Model model,HttpSession session,HttpServletRequest request)
	{
		
		SomoimVO vo=service.SomoimDetailData(sno);
		model.addAttribute("vo", vo);
		model.addAttribute("sno", sno); // "sno" 값을 Model에 추가
		System.out.println("컨트롤 디테일 sno의 값:"+sno);
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashedMap();
		
		map.put("somoimno", sno);
		map.put("start", start);
		map.put("end", end);
		
		// 일정
		List<Somoim_scheduleVO> scheduleList=service.ScheduleListData(map);
		model.addAttribute("scheduleList", scheduleList);
		
		// 멤버
		List<MemberVO> mList=service.ScheduleJoinMember(sno);
		model.addAttribute("mList", mList);
		
		int memberCount=service.SomoimMemberCount(sno);
		model.addAttribute("memberCount", memberCount);
		
		//커뮤니티
		List<Somoim_communityVO> cList=service.SomoimCommunityList(map);
		model.addAttribute("cList", cList);
		
		//찜하기
		
//		String Userid=(String)session.getAttribute("userId");
//		
//		Map map2=new HashMap();
//		
//		map2.put("Userid", Userid);
//		map2.put("sno", sno);
//		
//		int jjimcheck=service.somoimjjimcheck(map2);
//		model.addAttribute("map2",map2);
		return "somoim_detail";
	}
	
	@GetMapping("somoim/schedule_detail.do")
	public String somoim_schedule_detail(String page,int sno,int ssdno,Model model)
	{
		SomoimVO lvo=service.SomoimDetailData(sno);
		model.addAttribute("sno", sno);
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashedMap();
		
		map.put("somoimno", sno);
		map.put("start", start);
		map.put("end", end);
		
		
		// 일정
		List<Somoim_scheduleVO> scheduleList=service.ScheduleListData(map);
		model.addAttribute("scheduleList", scheduleList);
		
		Somoim_scheduleVO vo=service.ScheduleDetailData(ssdno);
		model.addAttribute("vo",vo);
		
		// 멤버
		List<MemberVO> mList=service.ScheduleJoinMember(sno);
		model.addAttribute("mList", mList);
		
		int memberCount=service.SomoimMemberCount(sno);
		model.addAttribute("memberCount", memberCount);
		
		// 커뮤니티
		List<Somoim_communityVO> cList=service.SomoimCommunityList(map);
		model.addAttribute("cList", cList);
		
		return "somoim/schedule_detail";
	}
	
	@GetMapping("somoim/chat.do")
	public String somoim_chat(String page,int sno,Model model)
	{
		SomoimVO lvo=service.SomoimDetailData(sno);
		model.addAttribute("sno", sno);
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashedMap();
		
		map.put("somoimno", sno);
		map.put("start", start);
		map.put("end", end);
		
		// 일정
		List<Somoim_scheduleVO> scheduleList=service.ScheduleListData(map);
		model.addAttribute("scheduleList", scheduleList);
		
		// 멤버
		List<MemberVO> mList=service.ScheduleJoinMember(sno);
		model.addAttribute("mList", mList);
		
		int memberCount=service.SomoimMemberCount(sno);
		model.addAttribute("memberCount", memberCount);
		
		// 커뮤니티
		List<Somoim_communityVO> cList=service.SomoimCommunityList(map);
		model.addAttribute("cList", cList);
				
		return "somoim/chat";
	}
	
	@GetMapping("somoim/community.do")
	public String somoim_community(String page, int sno, int scno,Model model,HttpSession session)
	{
		
		SomoimVO lvo=service.SomoimDetailData(sno);
		model.addAttribute("sno", sno);
		
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashedMap();
		
		map.put("somoimno", sno);
		map.put("start", start);
		map.put("end", end);
		
		// 일정
		List<Somoim_scheduleVO> scheduleList=service.ScheduleListData(map);
		model.addAttribute("scheduleList", scheduleList);
		
		// 멤버
		List<MemberVO> mList=service.ScheduleJoinMember(sno);
		model.addAttribute("mList", mList);
		
		int memberCount=service.SomoimMemberCount(sno);
		model.addAttribute("memberCount", memberCount);
		
		//커뮤니티
		List<Somoim_communityVO> cList=service.SomoimCommunityList(map);
		model.addAttribute("cList", cList);
		
		Somoim_communityVO cvo=service.SomoimCommunityDetail(scno);
		model.addAttribute("cvo", cvo);
		
		// 댓글
		String Userid=(String)session.getAttribute("Userid");
		model.addAttribute("Userid", Userid);
		model.addAttribute("scno", scno);
		
		
		
		
		
		return "somoim/community";
	}
}
