package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.sist.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;

@RestController
public class NgoodsRestController {
	@Autowired 
	private NgoodsService service;
	
	@Autowired
	private NreplyService rService;
	
	@GetMapping(value = "goods/goods_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String goods_list(int page,String fd,int type) throws Exception
	{
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=(rowSize*page);
		   Map map=new HashMap();
		   map.put("start",start);
		   map.put("end", end);
		   map.put("kname", fd);
		   String types="";
		   List<NgoodsVO> list=null;
		   if(type==0)
		   {
			   list=service.goodsListData(map);
		   }
		   else
		   {
			   if(type==1)
			   {
				   types="스포츠";
			   }
			   else if(type==2)
			   {
				   types="오메가3";
			   }
			   else if(type==3)
			   {
				   types="허브";
			   }
			   else if(type==4)
			   {
				   types="유산균";
			   }
			   else if(type==5)
			   {
				   types="비타민";
			   }
			   map.put("type", types);
			   list=service.goodsTypeListData(map);
		   }
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json;
	}
	
	 @GetMapping(value="goods/goods_list_page_vue.do",produces = "text/plain;charset=UTF-8")
	 public String goods_list_page(int page,String fd,int type) throws Exception
	 {
		   final int BLOCK=10;
		   int startPage=((page-1)/BLOCK*BLOCK)+1;
		   int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		   Map map=new HashMap();
		   map.put("kname", fd);
		   int totalpage=0;
		   String types="";
		   if(type==0)
		   {
			  totalpage=service.goodsListCount(map);
		   }
		   else
		   {
			   if(type==1)
			   {
				   types="스포츠";
			   }
			   else if(type==2)
			   {
				   types="오메가3";
			   }
			   else if(type==3)
			   {
				   types="허브";
			   }
			   else if(type==4)
			   {
				   types="유산균";
			   }
			   else if(type==5)
			   {
				   types="비타민";
			   }
			   map.put("type", types);
			   totalpage=service.goodsTypeListCount(map);
		   }
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
	
	@GetMapping(value="goods/goods_detail_vue.do",produces = "text/plain;charset=UTF-8")
	 public String goods_detail_vue(int gno) throws Exception
	 {
		   NgoodsVO vo=service.goodsDetailData(gno);
		   List<NreplyVO> list=rService.replyListData(gno);
		   int rCount=rService.replyCount(gno);
		   Map map=new HashMap();
		   map.put("detail_data", vo);
		   map.put("reply_list", list);
		   map.put("rCount", rCount);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(map);
		   return json; // response.data
	 }
	
	@GetMapping(value="goods/goods_cookie_vue.do",produces = "text/plain;charset=UTF-8")
	 public String goods_cookie(HttpServletRequest request) throws Exception
	 {
		   Cookie[] cookies=request.getCookies();
		   List<NgoodsVO> list=new ArrayList<NgoodsVO>();
		   int k=0;
		   if(cookies!=null)
		   {
			   for(int i=cookies.length-1;i>=0;i--)
			   {
			       if(k<9)
			       {
			    	   if(cookies[i].getName().startsWith("goods_"))
			    	   {
			    		   String gno=cookies[i].getValue();
			    		   NgoodsVO vo=service.goodsDetailData(Integer.parseInt(gno));
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
}
