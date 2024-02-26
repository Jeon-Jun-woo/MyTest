package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.FoodCalDAO;
import com.sist.service.*;
@RestController
@RequestMapping("food/")
public class FoodCalRestController {
	@Autowired
	private FoodCalService fService;
	
	@GetMapping(value="food_list_vue.do",produces = "text/plain;charset=UTF-8")
	   public String food_list(int page) throws Exception
	   {
		   Map map=new HashMap();
		   map.put("start", (20*page)-19);
		   map.put("end",20*page);
		   
		   List<FoodCalVO> list=fService.foodListData(map);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json; // then(response=>{}) => response.data
		   
	   }
	   @GetMapping(value="food_page_vue.do",produces = "text/plain;charset=UTF-8")
	   public String food_list_page(int page) throws Exception
	   {
		   final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   int totalpage=fService.foodListCount();
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
	   public String food_detail(int fno) throws Exception
	   {
		   FoodCalVO vo=fService.foodDetailData(fno);//{} => []
		   // JSON 만드는 라이브러리 => jackson
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   return json;
	   }
	   @GetMapping(value="find_vue.do",produces = "text/plain;charset=UTF-8")
	   public String food_find(int page,String fd) throws Exception
	   {
		   int rowSize=20;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=(rowSize*page);
		   Map map=new HashMap();
		   map.put("start",start);
		   map.put("end", end);
		   map.put("name", fd);
		   List<FoodCalVO> list=fService.foodFindData(map);
		   //JSON변경
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	   }
}
