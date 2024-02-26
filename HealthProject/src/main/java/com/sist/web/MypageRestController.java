package com.sist.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.SomoimService;
import com.sist.vo.SomoimVO;

@RestController
public class MypageRestController {
	
	@Autowired
	private SomoimService sService;
	
	@GetMapping(value = "mypage/somoimJjim_vue.do",produces = "text/plain;charset=UTF-8")
	public String mypage_somoimJjim(String page,HttpSession session) throws Exception
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=15;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		String userId=(String)session.getAttribute("userId");
		Map map=new HashedMap();
		
		map.put("userId", userId);
		map.put("start", start);
		map.put("end", end);
		
		List<SomoimVO> mList=sService.somoimJjimListData(map);
		//JSON으로 변경
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(mList);
		return json;
	}
	
	@GetMapping(value="mypage/somoimJjim_page_vue.do",produces= "text/plain;charset=UTF-8")
	public String mypage_somoimJjim_page(int page,HttpSession session) throws Exception
	{
		String userId=(String)session.getAttribute("userId");
		int totalpage=sService.SomoimJjimCount(userId);
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
}
