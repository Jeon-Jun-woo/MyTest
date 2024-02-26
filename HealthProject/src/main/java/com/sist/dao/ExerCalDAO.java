package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class ExerCalDAO {
	@Autowired
	private ExerCalMapper mapper;
	
	public List<ExerCalVO> exerListData(Map map)
	{
		return mapper.exerListData(map);
	}
	public int exerciseListCount()
	{
		return mapper.exerciseListCount();
	}
	public ExerCalVO exerDetailData(int eno)
	{
		return mapper.exerDetailData(eno);
	}
	public List<ExerCalVO> exerFindData(Map map)
	{
		return mapper.exerFindData(map);
	}
}
