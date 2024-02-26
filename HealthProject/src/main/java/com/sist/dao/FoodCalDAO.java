package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class FoodCalDAO {
	@Autowired
	private FoodCalMapper mapper;
	
	public List<FoodCalVO> foodListData(Map map)
	{
		return mapper.foodListData(map);
	}
	public int foodListCount()
	{
		return mapper.foodListCount();
	}
	public FoodCalVO foodDetailData(int fno)
	{
		return mapper.foodDetailData(fno);
	} 
	public List<FoodCalVO> foodFindData(Map map)
	{
		return mapper.foodFindData(map);
	}
}
