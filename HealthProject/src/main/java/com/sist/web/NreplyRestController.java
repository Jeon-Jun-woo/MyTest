package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
@RestController
public class NreplyRestController {
	@Autowired
	private NreplyService rService;
	
	// insert , update , delete 
	   public String commonsReplyData(int gno) throws Exception
	   {
		   ObjectMapper mapper=new ObjectMapper();
		   List<NreplyVO> list=rService.replyListData(gno);
		   String json=mapper.writeValueAsString(list);
		   return json;
	   }
	   
	   @PostMapping(value="recipe/reply_insert_vue.do",produces = "text/plain;charset=UTF-8")
	   public String reply_insert(NreplyVO vo,HttpSession session) throws Exception
	   {
		   String userId=(String)session.getAttribute("userId");
		   String userName=(String)session.getAttribute("userName");
		   vo.setUserId(userId);
		   vo.setUserName(userName);
		   // rno,msg
		   rService.replyInsert(vo);
		   
		   return commonsReplyData(vo.getGno());
	   }
	   // 수정 
	   @PostMapping(value="recipe/reply_update_vue.do",produces = "text/plain;charset=UTF-8")
	   public String reply_update(NreplyVO vo) throws Exception
	   {
		   rService.replyUpdate(vo);
		   return commonsReplyData(vo.getGno());
	   }
	   // 삭제
	   @GetMapping(value="recipe/reply_delete_vue.do",produces = "text/plain;charset=UTF-8")
	   public String reply_delete(int no,int gno) throws Exception
	   {
		   rService.replyDelete(no);
		   return commonsReplyData(gno);
	   }
}	
