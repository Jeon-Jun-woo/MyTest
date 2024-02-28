package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class NgoodsDAO {
	@Autowired
	private NgoodsMapper mapper;
	
	public List<NgoodsVO> goodsListData(Map map)
	{
		return mapper.goodsListData(map);
	}
	  
	public int goodsListCount(Map map)
	{
		return mapper.goodsListCount(map);
	}
	
	public List<NgoodsVO> goodsTypeListData(Map map)
	{
		return mapper.goodsTypeListData(map);
	}
	  
	public int goodsTypeListCount(Map map)
	{
		return mapper.goodsTypeListCount(map);
	}
	
	
	public NgoodsVO goodsDetailData(int gno)
	{
		   return mapper.goodsDetailData(gno);
	}
}
