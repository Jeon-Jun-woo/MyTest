package com.sist.web;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
import com.sist.vo.*;

@RestController
@RequestMapping("yp/")

public class SportsReserveRestController {
	@Autowired
	private SportsReserveService service;
	
	@Autowired
	private YPReplyService ypService;

	
	@GetMapping(value="find_vue.do",produces = "text/plain;charset=UTF-8")
	public String yp_find(int page, String fd) throws Exception
	{
		int rowSize=20;
		int start=(rowSize*page)-(rowSize-1);
		int end=(rowSize*page);
		Map map=new HashMap();
		map.put("start",start);
		map.put("end", end);
		map.put("address", fd);
		List<SportsReserveVO> list=service.sportsFindData(map);
		//JSON변경
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json;
	}
	
	@GetMapping(value="page_vue.do",produces = "text/plain;charset=UTF-8")
	public String yp_page(int page, String fd) throws Exception
	{
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		Map map=new HashMap();
		map.put("address", fd);
		int totalpage=service.sportsFindCount(map);
		if(endPage>totalpage)
			endPage=totalpage;
		   
		map=new HashMap();
		map.put("curpage",page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		   
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);
		return json;
	}
	
	@GetMapping(value="detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String yp_detail(int no) throws Exception
	{
		SportsReserveVO vo=service.sportsDetailData(no);//{} => []
		// JSON 만드는 라이브러리 => jackson
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(vo);
		return json;
	}
	
	@GetMapping(value="yp_cookie_vue.do",produces = "text/plain;charset=UTF-8")
	public String yp_cookie(HttpServletRequest request) throws Exception
	{
		Cookie[] cookies=request.getCookies();
		List<SportsReserveVO> list=new ArrayList<SportsReserveVO>();
		int k=0;
		if(cookies!=null)
		{
			for(int i=cookies.length-1;i>=0;i--)
			{
			    if(k<9)
			    {
			    	// new Cookie("food_"+fno, String.valueOf(fno))
			    	//            =======getName() ======= getValue()
			    	if(cookies[i].getName().startsWith("yp_"))
			    	{
			    		String no=cookies[i].getValue();
			    		SportsReserveVO vo=service.sportsDetailData(Integer.parseInt(no));
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
	
	@GetMapping(value="yp_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String yp_list(int page) throws Exception
	{
		Map map=new HashMap();
		map.put("start", (20*page)-19);
		map.put("end",20*page);
		   
		List<SportsReserveVO> list=service.sportsListData(map);
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json; // then(response=>{}) => response.data  
	}
	
	@GetMapping(value="yp_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String yp_list_page(int page) throws Exception
	{
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		int totalpage=service.sportsListCount();
		if(endPage>totalpage)
			endPage=totalpage;
		Map map=new HashMap();
		map=new HashMap();
		map.put("curpage",page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		   
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map);
		
		return json;
	}
	
	@GetMapping(value="yp_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String yp_detail_vue(int no) throws Exception
	{
		SportsReserveVO vo=service.sportsListDetailData(no);
		
		List<YPReplyVO> list=ypService.ypReplyListData(no); // 추가
		
		Map map=new HashMap(); // 추가
		map.put("detail_data", vo); // 추가
		map.put("reply_list", list); // 추가
		
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(map); // vo에서 map으로 받음
		return json; // response.data
	}
	
}