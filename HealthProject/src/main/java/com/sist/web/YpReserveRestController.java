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
public class YpReserveRestController {
   @Autowired
   private YpReserveService yService;
   
   @Autowired
   private MailManager mm;//MailManager mm=new MailManager()
   
   @GetMapping(value="reserve/yp_list_vue.do",produces = "text/plain;charset=UTF-8")
   public String yp_list(String type) throws Exception
   {
	   List<SportsReserveVO> list=yService.sportsReserveData(type);
	   ObjectMapper mapper=new ObjectMapper();
	   String json=mapper.writeValueAsString(list);
	   return json;
   }
   @PostMapping(value="reserve/yp_reserve_ok.do",produces = "text/plain;charset=UTF-8")
   public String yp_reserve_ok(YpReserveVO vo,HttpSession session)
   {
	   String result="no";
	   try {
		   vo.setUserId((String)session.getAttribute("userId"));
//	       System.out.println("fno:"+vo.getFno());
//	       System.out.println("date:"+vo.getRDate());
//	       System.out.println("time:"+vo.getRTime());
//	       System.out.println("inwon:"+vo.getRInwon());
//	       System.out.println("userId:"+vo.getUserId());
		   yService.ypReserveInsert(vo);
	       result="yes";
	   }catch(Exception ex)
	   {
		   result="no";
	   }
	   
	   return result;
   }
   
   @GetMapping(value="reserve/yp_mypage_list_vue.do",produces = "text/plain;charset=UTF-8")
   public String yp_mypage_list(HttpSession session) throws Exception
   {
	   String userId=(String)session.getAttribute("userId");
	   List<YpReserveVO> list=yService.reserveMypageData(userId);
	   ObjectMapper mapper=new ObjectMapper();
	   String json=mapper.writeValueAsString(list);
	   return json;
   }
   @GetMapping(value="reserve/yp_reserve_cancel_vue.do",produces = "text/plain;charset=UTF-8")
   public String reserve_cancel(int rno)
   {
	   String result="";
	   try
	   {
		   result="yes";
		   yService.reserveCancel(rno);
	   }catch(Exception ex) 
	   {
		   result="no";   
	   }
	   return result;
   }
   @GetMapping(value="reserve/yp_reserve_admin_vue.do",produces = "text/plain;charset=UTF-8")
   public String reserve_admin() throws Exception
   {
	   List<YpReserveVO> list=yService.reserveAdminpageData();
	   ObjectMapper mapper=new ObjectMapper();
	   String json=mapper.writeValueAsString(list);
	   return json;
   }
   
   
   @PostMapping(value="reserve/yp_reserve_ok_vue.do",produces = "text/plain;charset=UTF-8")
   public String reserve_ok(int rno)
   {
	   System.out.println("rno="+rno);
	   String result="";
	   try
	   {
		   result="yes";
		   yService.reserveOk(rno);
		   YpReserveVO vo=yService.reserveInfoData(rno);
			
	   }catch(Exception ex)
	   {
		   result=ex.getMessage();
	   }
	   return result;  
   }
   
}
		   