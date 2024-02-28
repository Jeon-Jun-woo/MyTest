package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.manager.MailManager;
import com.sist.service.*;
@RestController
public class ReserveyRestController {
	@Autowired
	private ReserveyService rService;
	
	@Autowired
	private MailManager	mm; //MailManager mm=new MailManager()
	
	@GetMapping(value = "goods/yakgook_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String yakgook_list(String address) throws Exception
	{
		List<YakgookVO> list=rService.yakgookReserveData(address);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	@PostMapping(value = "goods/reserve_ok.do",produces = "text/plain;charset=UTF-8")
	public String reserve_ok(ReserveyVO vo,HttpSession session)
	{
		String result="no";
		try {
			vo.setUserId((String)session.getAttribute("userId"));
			System.out.println("yno:"+vo.getYno());
			System.out.println("date:"+vo.getRDate());
			System.out.println("time:"+vo.getRTime());
			System.out.println("inwon:"+vo.getRInwon());
			System.out.println("userId: "+vo.getUserId());
			rService.yakgookReserveInsert(vo);
			result="yes";
		}catch(Exception ex) 
		{
			result="no";
			ex.printStackTrace();
			
		}
		
		return result;
	}
	
	@GetMapping(value = "goods/mypage_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String mypage_list(HttpSession session) throws Exception
	{
		String userId=(String)session.getAttribute("userId");
		List<ReserveyVO> list=rService.reserveMypageData(userId);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	@GetMapping(value = "goods/reserve_cancel_vue.do",produces = "text/plain;charset=UTF-8")
	public String reserve_cancel(int rno)
	{
		String result="";
		try
		{
			result="yes";
			rService.reserveCancel(rno);
		}catch(Exception ex) 
		{
			result="no";
		}
		return result;
	}
	
	@GetMapping(value = "reserve_y/reserve_admin_vue.do",produces = "text/plain;charset=UTF-8")
	public String reserve_admin() throws Exception
	{
		List<ReserveyVO> list=rService.reserveAdminpageData();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value = "reserve_y/reserve_ok_vue.do",produces = "text/plain;charset=UTF-8")
	public String reserve_ok(int rno)
	{
		String result="";
		try
		{
			result="yes";
			rService.reserveOk(rno);
			ReserveyVO vo=rService.reserveInfoData(rno);
			mm.mailReserveSender(vo);
		}catch(Exception ex)
		{
			result="no";
		}
		return result;
	} 
}
