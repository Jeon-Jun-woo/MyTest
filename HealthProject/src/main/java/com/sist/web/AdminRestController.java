package com.sist.web;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MemberService;
import com.sist.vo.MemberVO;

@RestController
public class AdminRestController {
	@Autowired
	private MemberService mService;
	
	@GetMapping(value = "admin/member_vue.do",produces = "text/plain;charset=UTF-8")
	public String admin_member(String page) throws Exception
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=15;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashedMap();
		
		map.put("start", start);
		map.put("end", end);
		
		List<MemberVO> mList=mService.memberListData(map);
		//JSON으로 변경
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(mList);
		return json;
	}
	
	@GetMapping(value="admin/page_vue.do",produces= "text/plain;charset=UTF-8")
	public String damin_page(int page) throws Exception
	{
		int totalpage=mService.memberTotalData();
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
	
	@GetMapping(value="admin/detail_vue.do",produces= "text/plain;charset=UTF-8")
	public String admin_detail(String userid) throws Exception
	{
		MemberVO mvo=mService.memberDetailData(userid);
		
		//JSON으로 변경
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(mvo);
		return json;
	}
}
