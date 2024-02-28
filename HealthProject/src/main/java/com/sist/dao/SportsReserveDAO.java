package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class SportsReserveDAO {
	@Autowired
	private SportsReserveMapper mapper;
	
	public List<SportsReserveVO> sportsFindData(Map map)
	{
		return mapper.sportsFindData(map); 
	}
	public int sportsFindCount(Map map)
	{
		return mapper.sportsFindCount(map);
	}
	public SportsReserveVO sportsDetailData(int no)
	{
		return mapper.sportsDetailData(no);
	}

	public List<SportsReserveVO> sportsListData(Map map)
	{
		return mapper.sportsListData(map);
	}
	
	public int sportsListCount()
	{
		return mapper.sportsListCount();
	}
	
	public SportsReserveVO sportsListDetailData(int no)
	{
		mapper.sportsHitIncrement(no);
		return mapper.sportsDetailData(no);
	}
	
}
