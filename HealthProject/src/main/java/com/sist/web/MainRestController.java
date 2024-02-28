package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.vo.*;
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.*;
@RestController
public class MainRestController {
	@Autowired
	private NgoodsService gService;
	
	
	
	@GetMapping(value = "main/mian.do",produces = "text/plain;charset=UTF-8")
	public String goods_main() throws Exception
	{
		List<NgoodsVO> list=gService.goodsMainData();
		ObjectMapper mapper=new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		return json; 
	}
}
