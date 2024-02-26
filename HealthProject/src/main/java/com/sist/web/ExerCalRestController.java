package com.sist.web;
import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
import com.sist.service.*;
@RestController
@RequestMapping("exercise/")
public class ExerCalRestController {
	@Autowired
	private ExercalService eService;
	
	@GetMapping(value = "exercise_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String exercise_list(int page) throws Exception
	{
		   Map map=new HashMap();
		   map.put("start", (10*page)-9);
		   map.put("end",10*page);
		   
		   List<ExerCalVO> list=eService.exerListData(map);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json; // then(response=>{}) => response.data
	}
	@GetMapping(value="exercise_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String exercise_list_page(int page) throws Exception
	{
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		int totalpage=eService.exerciseListCount();
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
	@GetMapping(value="detail_vue.do",produces = "text/plain;charset=UTF-8")
	   public String exer_detail(int eno) throws Exception
	   {
		   ExerCalVO vo=eService.exerDetailData(eno);//{} => []
		   // JSON 만드는 라이브러리 => jackson
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   return json;
	   }
	@GetMapping(value="find_vue.do",produces = "text/plain;charset=UTF-8")
	   public String exercise_find(int page,String ed) throws Exception
	   {
		   int rowSize=20;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=(rowSize*page);
		   Map map=new HashMap();
		   map.put("start",start);
		   map.put("end", end);
		   map.put("name", ed);
		   List<ExerCalVO> list=eService.exerFindData(map);
		   //JSON변경
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	   }
}
