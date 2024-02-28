package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class NgoodsDAO {
	@Autowired
	private NgoodsMapper mapper;
	
	public List<NgoodsVO> goodsMainData()
	{
		return mapper.goodsMainData();
	}
}
