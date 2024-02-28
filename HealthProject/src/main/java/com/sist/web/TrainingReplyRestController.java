package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.vo.*;
@RestController
public class TrainingReplyRestController {
   @Autowired
   private TrainingReplyService tService;
   
   // insert , update , delete 
   public String commonsReplyData(int tno) throws Exception
   {
	   ObjectMapper mapper=new ObjectMapper();
	   List<TrainReplyVO> list=tService.replyListData(tno);
	   String json=mapper.writeValueAsString(list);
	   return json;
   }
   
   @PostMapping(value="training/reply_insert_vue.do",produces = "text/plain;charset=UTF-8")
   public String reply_insert(TrainReplyVO vo, Principal p) throws Exception
   {
	   String userId=p.getName();
	   MemberVO mvo=tService.memberInfoData(userId);
	   String userName=mvo.getUserName();
	   vo.setUserId(userId);
	   vo.setUserName(userName);
	   // rno,msg
	   tService.replyInsert(vo);
	   
	   return commonsReplyData(vo.getTno());
   }
   // 수정 
   @PostMapping(value="training/reply_update_vue.do",produces = "text/plain;charset=UTF-8")
   public String reply_update(TrainReplyVO vo,int tno) throws Exception
   {
	   tService.replyUpdate(vo);
	   return commonsReplyData(tno);
   }
   // 삭제
   @GetMapping(value="training/reply_delete_vue.do",produces = "text/plain;charset=UTF-8")
   public String reply_delete(int no,int tno) throws Exception
   {
	   tService.replyDelete(no);
	   return commonsReplyData(tno);
   }
}