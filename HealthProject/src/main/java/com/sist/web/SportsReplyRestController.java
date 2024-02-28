package com.sist.web;

import java.security.Principal;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;

@RestController
public class SportsReplyRestController {
	@Autowired
	private YPReplyService yService;
	
	// insert, update, delete
	public String commonsReplyData(int yno) throws Exception
	{
		ObjectMapper mapper=new ObjectMapper();
		List<YPReplyVO> list=yService.ypReplyListData(yno);
		String json=mapper.writeValueAsString(list);
		return json;
	}
		
	@PostMapping(value = "yp/reply_insert_vue.do", produces = "text/plain; charset=UTF-8")
	public String reply_insert(YPReplyVO vo, Principal p) throws Exception
	{
		String userId=p.getName();
		MemberVO mvo=yService.memberInfoData(userId);
		String userName=mvo.getUserName();
		vo.setUserId(userId);
		vo.setUserName(userName);
		// rno, msg
		yService.ypReplyInsert(vo);
			
		return commonsReplyData(vo.getYno());
	}
		
	// 수정
	@PostMapping(value = "yp/reply_update_vue.do", produces = "text/plain; charset=UTF-8")
	public String reply_update(YPReplyVO vo) throws Exception
	{
		yService.ypReplyUpdate(vo);
		return commonsReplyData(vo.getYno());
	}
		
	// 삭제
	@GetMapping(value = "yp/reply_delete_vue.do", produces = "text/plain; charset=UTF-8")
	public String reply_delete(int no, int yno) throws Exception
	{
		yService.ypReplyDelete(no);
		return commonsReplyData(yno);
	}
}
