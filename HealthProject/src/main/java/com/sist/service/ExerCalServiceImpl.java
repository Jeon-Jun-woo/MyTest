package com.sist.service;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class ExerCalServiceImpl implements ExercalService{
	@Autowired
	private ExerCalDAO eDao;

	@Override
	public List<ExerCalVO> exerListData(Map map) {
		// TODO Auto-generated method stub
		return eDao.exerListData(map);
	}

	@Override
	public int exerciseListCount() {
		// TODO Auto-generated method stub
		return eDao.exerciseListCount();
	}

	@Override
	public ExerCalVO exerDetailData(int eno) {
		// TODO Auto-generated method stub
		return eDao.exerDetailData(eno);
	}

	@Override
	public List<ExerCalVO> exerFindData(Map map) {
		// TODO Auto-generated method stub
		return eDao.exerFindData(map);
	}
	
	
}
