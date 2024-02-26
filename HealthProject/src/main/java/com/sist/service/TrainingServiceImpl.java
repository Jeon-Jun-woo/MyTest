package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
import com.sist.vo.*;
@Service
public class TrainingServiceImpl implements TrainingService{
	@Autowired
	private TrainingDAO tDao;

	@Override
	public List<TrainingVO> trainListData(Map map) {
		// TODO Auto-generated method stub
		return tDao.trainListData(map);
	}

	@Override
	public int trainListCount() {
		// TODO Auto-generated method stub
		return tDao.trainListCount();
	}

	@Override
	public TrainingVO trainDetailData(int tno) {
		// TODO Auto-generated method stub
		return tDao.trainDetailData(tno);
	}
}
