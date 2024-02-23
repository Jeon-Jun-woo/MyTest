package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.sist.service.*;
import com.sist.vo.*;

@RestController
public class SomoimRestController {
	@Autowired
	private SomoimService service;
	
	@Autowired
	private MemberService Mservice;
	
	@GetMapping(value="somoim/list_vue.do", produces="text/plain;charset=UTF-8")
	public String somoim_list(int page, int type) throws Exception {
	    int rowSize = 10;
	    int start = (rowSize * page) - (rowSize - 1);
	    int end = rowSize * page;
	    
	    Map map = new HashMap();
	    map.put("start", start);
	    map.put("end", end);
	    
	    List<SomoimVO> list = null;
	    
	    
	    if(type == 0) 
	    {
	        list = service.somoimListData(map);
	    } 
	    else if(type >= 1 && type <= 5) 
	    {
	        switch(type) {
	            
	            case 1:
	                list = service.somoimType1List(map);
	                break;
	            case 2:
	                list = service.somoimType2List(map);
	                break;
	            case 3:
	                list = service.somoimType3List(map);
	                break;
	            case 4:
	                list = service.somoimType4List(map);
	                break;
	            case 5:
	                list = service.somoimType5List(map);
	                break;
	            default:
	                // 처리할 작업이 없을 경우
	                break;
	        }
	    }
	    
	    // JSON으로 변경
	    ObjectMapper mapper = new ObjectMapper();
	    String json = mapper.writeValueAsString(list);
	    
	    return json;
	}
	
	
	@GetMapping(value="somoim/cookie_vue.do",produces = "text/plain;charset=UTF-8")
	   public String somoim_cookie(HttpServletRequest request) throws Exception
	   {
		   Cookie[] cookies=request.getCookies();
		   List<SomoimVO> list=new ArrayList<SomoimVO>();
		   int k=0;
		   if(cookies!=null)
		   {
			   for(int i=cookies.length-1;i>=0;i--)
			   {
			       if(k<9)
			       {
			    	   // new Cookie("food_"+fno, String.valueOf(fno))
			    	   //            =======getName() ======= getValue()
			    	   if(cookies[i].getName().startsWith("somoim_"))
			    	   {
			    		   String sno=cookies[i].getValue();
			    		   SomoimVO vo=service.SomoimDetailData(Integer.parseInt(sno));
			    		   list.add(vo);
			    	   }
			    	   k++;
			       }
			   }
		   }
		   
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	   }
	
	@GetMapping(value="somoim/page_vue.do",produces= "text/plain;charset=UTF-8")
	public String somoim_page(int page,int type) throws Exception
	{
		int totalpage=0;
		if(type == 0) 
	    {
			totalpage = service.somoimTotalPage();
	    } 
	    else if(type >= 1 && type <= 5) 
	    {
	        switch(type) {
	            
	            case 1:
	            	totalpage = service.somoimType1TotalPage();
	                break;
	            case 2:
	            	totalpage = service.somoimType2TotalPage();
	                break;
	            case 3:
	            	totalpage = service.somoimType3TotalPage();
	                break;
	            case 4:
	            	totalpage = service.somoimType4TotalPage();
	                break;
	            case 5:
	            	totalpage = service.somoimType5TotalPage();
	                break;
	            default:
	                // 처리할 작업이 없을 경우
	                break;
	        }
	    }
		
		final int BLOCK=10;
		int startpage=((page-1)/BLOCK*BLOCK)+1; // page
		int endpage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endpage>totalpage)
			endpage=totalpage;
		
		Map map=new HashedMap();
		map.put("curpage", page);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("totalpage", totalpage);
		
		//JSON으로 변경
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);
		return json;
	}
	
	
	@GetMapping(value="somoim/jjim_check_vue.do", produces= "text/plain;charset=UTF-8")
	public String somoim_jjim_check(int sno, HttpSession session) throws Exception 
	{
		
		String userId=(String)session.getAttribute("userId");
		
		
		System.out.println("찜체크 userid : "+userId);  
		System.out.println("찜체크 sno : "+sno);
		Map map = new HashMap();
        map.put("userId", userId);
        map.put("sno", sno);
        int jjimCount = service.somoimjjimcheck(map);
        
	    // JSON으로 변경
	    ObjectMapper mapper = new ObjectMapper();
	    String json = mapper.writeValueAsString(jjimCount);
	    return json;
	    
	}

	@PostMapping(value="somoim/jjim_insert_vue.do", produces= "text/plain;charset=UTF-8")
	public String somoim_jjim_insert(int sno, HttpSession session) throws Exception
	{
		
		String result="no";
		try 
		{
			String userId=(String)session.getAttribute("userId");
			System.out.println("찜추가 userid : "+userId);  
			System.out.println("찜추가 sno : "+sno);
			Map map = new HashMap();
	        map.put("userId", userId);
	        map.put("sno", sno);
	        service.somoimjjimInsertData(map);
	        result="yes";
	        
		}catch(Exception ex) 
		{
			result="no";
		}
		
	    // 찜 추가 로직을 구현하고 성공적으로 추가된 경우 메시지를 반환
	    return result;
	}

	@PostMapping(value="somoim/jjim_delete_vue.do", produces= "text/plain;charset=UTF-8")
	public String somoim_jjim_delete(int sno, HttpSession session) throws Exception
	{	
		String result="no";
		try 
		{
			String userId=(String)session.getAttribute("userId");
			System.out.println(userId);
			Map map = new HashMap();
	        map.put("userId", userId);
	        map.put("sno", sno);
	        service.somoimjjimDeleteData(map);
		    // 찜 삭제 로직을 구현하고 성공적으로 삭제된 경우 메시지를 반환
	        result="yes";
		}catch(Exception ex) 
		{
			result="no";
		}
	    
        return result;
	}
	
	
	
	   
//	   public String commonsData(int scno) throws Exception
//	   {
//		  
//		  List<Somoim_replyVO> list=service.SomoimCommunityReply(scno);
//
//			for (Somoim_replyVO reply : list) {
//			    String id = reply.getWriterid();
//			    String writerposter=service.SomoimReplyPoster(id);
//			    System.out.println("poster값:::"+writerposter);
//			    ObjectMapper mapper1=new ObjectMapper();
//				String json=mapper1.writeValueAsString(writerposter);
//			    System.out.println("id 값::: " + id);
//			}
//		  
//		  ObjectMapper mapper=new ObjectMapper();
//		  String json=mapper.writeValueAsString(list);
//		  System.out.println("json======>"+json);
//		  return json;
//	   }
	
	public String commonsData(int scno) throws Exception {
	    List<Somoim_replyVO> list = service.SomoimCommunityReply(scno);
	    ObjectMapper mapper = new ObjectMapper();

	    // 새로운 JSON 객체를 만듭니다.
	    ObjectNode rootNode = mapper.createObjectNode();

	    // 새로운 JSON 배열을 만듭니다.
	    ArrayNode jsonArray = mapper.createArrayNode();
	    System.out.println("aaaaa");
	    try {
	    for (Somoim_replyVO reply : list) {
	    	//System.out.println("reply:"+reply);
	    	int rno=reply.getRno();
	        String id = reply.getWriterid();
	        String writerposter = service.SomoimReplyPoster(id);
	        String msg = reply.getMsg();
	        String nickname=reply.getNickname();
	        String dbday=reply.getDbday();
	        // 새로운 JSON 객체를 만들고 id와 writerposter를 속성으로 추가합니다.
	        ObjectNode jsonObject = mapper.createObjectNode();
	        jsonObject.put("rno", rno);
	        jsonObject.put("id", id);
	        jsonObject.put("msg", msg);
	        jsonObject.put("nickname", nickname);
	        jsonObject.put("dbday", dbday);
	        jsonObject.put("writerposter", writerposter);
	        
//	     // JSON 객체를 문자열로 변환하여 출력합니다.
//	        String jsonString = mapper.writeValueAsString(jsonObject);
//	        System.out.println(jsonString);

	        // JSON 배열에 JSON 객체를 추가합니다.
	        jsonArray.add(jsonObject);
	    }
	    }catch(Exception ex) {
	    	ex.printStackTrace();
	    }

	    // 루트 JSON 객체에 JSON 배열을 추가합니다.
	    rootNode.set("reply_list", jsonArray);

	    // JSON 문자열로 변환하여 반환합니다.
	    return rootNode.toString();
	}
	   
	   @GetMapping(value="reply/list_vue.do",produces = "text/plain;charset=UTF-8")
	   public String reply_list(int scno,HttpSession session,HttpServletRequest request) throws Exception
	   {
		   //SessionInfo info=(SessionInfo)session.getAttribute("member");
		   //System.out.println(info.getNickname());
		   System.out.println("세션에 저장된 아이디 : "+(String)session.getAttribute("userId"));
		   String Nickname=(String)session.getAttribute("nickName");
		   
		   HttpSession session2 = request.getSession();
		   
					   //세션에 저장된 값 확인     
					   System.out.println("Session Attributes=>");
					        java.util.Enumeration<String> attributeNames = session2.getAttributeNames();
					        while (attributeNames.hasMoreElements()) 
					        {
					        	
					            String attributeName = attributeNames.nextElement();
					            Object attributeValue = session2.getAttribute(attributeName);
					            System.out.println("세션에 저장된값:"+attributeName + ": " + attributeValue);
					        }
					        
					        
					        
		   return commonsData(scno);  
	   }
	   
	   @GetMapping(value="reply/insert_vue.do",produces = "text/plain;charset=UTF-8")
	   public String reply_insert(int scno,int sno,String msg,HttpSession session)
	   throws Exception
	   {
		   String userId=(String)session.getAttribute("userId");
		   System.out.println("댓글 인서트 userId="+userId);
		   String Nickname=(String)session.getAttribute("nickName");
		   Somoim_replyVO vo=new Somoim_replyVO();
		   vo.setCommunityno(scno);
		   vo.setSomoimno(sno);
		   vo.setWriterid(userId);
		   vo.setNickname(Nickname);
		   vo.setMsg(msg);
		   service.SomoimCommunityReplyInsert(vo);
		   return commonsData(scno);
	   }
	   
	   @GetMapping(value="reply/delete_vue.do",produces = "text/plain;charset=UTF-8")
	   public String reply_delete(int rno,int scno) throws Exception
	   {
		   service.SomoimCommunityReplyDelete(rno);
		   return commonsData(scno);
	   }
	   
	   @GetMapping(value="reply/update_vue.do",produces = "text/plain;charset=UTF-8")
	   public String reply_update(Somoim_replyVO vo) throws Exception
	   {
		   service.SomoimCommunityReplyUpdate(vo);
		   
		   return commonsData(vo.getScno());
		   
	   }
	
	
	
}
