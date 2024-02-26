package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.service.*;
import com.sist.vo.TrainingVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.*;
@RestController
@RequestMapping("training/")
public class TrainingRestController {
	@Autowired
	private TrainingService tService;
	
	@GetMapping(value = "training_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String training_list(int page) throws Exception
	{
		   Map map=new HashMap();
		   map.put("start", (20*page)-19);
		   map.put("end",20*page);
		   
		   List<TrainingVO> list=tService.trainListData(map);
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(list);
		   return json; // then(response=>{}) => response.data
	}
	@GetMapping(value="training_page_vue.do",produces = "text/plain;charset=UTF-8")
	public String training_list_page(int page) throws Exception
	{
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		int totalpage=tService.trainListCount();
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
	   public String train_detail(int tno) throws Exception
	   {
		   TrainingVO vo=tService.trainDetailData(tno);//{} => []
		   
		   // JSON 만드는 라이브러리 => jackson
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   return json;
	   }
	
}
