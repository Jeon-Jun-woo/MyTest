package com.sist.web;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;

import javax.inject.Qualifier;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.sist.service.*;

import com.sist.vo.*;

import lombok.Value;


@Controller
public class SomoimController {

	@Autowired
	private SomoimService service;
	
	@Autowired
	private MemberService mService;
	
	

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
	
	@GetMapping("somoim/insert.do")
	public String somoim_insert(String type, Model model, HttpSession session) throws Exception {
	    

	    // 세션에서 회원 정보 가져오기
	    String nickName = (String) session.getAttribute("nickName");
	    model.addAttribute("nickName", nickName); 
	    
	    // 파일 업로드 후 이동할 페이지 리턴
	    return "somoim/insert";
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
		//System.out.println("컨트롤 디테일 sno의 값:"+sno);
		
		String userId=(String)session.getAttribute("userId");
		//System.out.println("설마 userId가 null..?:"+userId);
		MemberVO mvo=mService.memberInfo(userId);
		//System.out.println("mvo가 왜 null값이야:"+mvo);
		model.addAttribute("somoimno", mvo.getSomoimno());
		
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
		
		
		return "somoim_detail";
	}
	
	@GetMapping("somoim/schedule_detail.do")
	public String somoim_schedule_detail(String page,int sno,int ssdno,Model model,HttpSession session)
	{
		SomoimVO vo=service.SomoimDetailData(sno);
		model.addAttribute("sno", sno);
		model.addAttribute("vo", vo);
		
		String userId=(String)session.getAttribute("userId");
		MemberVO mvo=mService.memberDetailData(userId);
		model.addAttribute("somoimno", mvo.getSomoimno());
		
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
		
		Somoim_scheduleVO svo=service.ScheduleDetailData(ssdno);
		model.addAttribute("svo",svo);
		
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
	public String somoim_chat(String page,int sno,Model model,HttpSession session)
	{
		SomoimVO vo=service.SomoimDetailData(sno);
		model.addAttribute("sno", sno);
		model.addAttribute("vo", vo);
		
		String userId=(String)session.getAttribute("userId");
		MemberVO mvo=mService.memberDetailData(userId);
		model.addAttribute("somoimno", mvo.getSomoimno());
		
		String nickName=(String)session.getAttribute("nickName");
		model.addAttribute("nickName", nickName);
		System.out.println("닉네임이 들어오나:"+nickName);
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
		
		SomoimVO vo=service.SomoimDetailData(sno);
		model.addAttribute("sno", sno);
		model.addAttribute("vo", vo);
		
		String userId=(String)session.getAttribute("userId");
		MemberVO mvo=mService.memberDetailData(userId);
		model.addAttribute("somoimno", mvo.getSomoimno());
		
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
