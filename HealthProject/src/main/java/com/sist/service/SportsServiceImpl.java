package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.GymReplyDAO;
import com.sist.dao.SportsReserveDAO;
import com.sist.vo.SportsReserveVO;

@Service
public class SportsServiceImpl implements SportsReserveService {
	@Autowired
	private SportsReserveDAO sDao;

	@Override
	public List<SportsReserveVO> sportsFindData(Map map) {
		// TODO Auto-generated method stub
		return sDao.sportsFindData(map);
	}

	@Override
	public int sportsFindCount(Map map) {
		// TODO Auto-generated method stub
		return sDao.sportsFindCount(map);
	}

	@Override
	public SportsReserveVO sportsDetailData(int no) {
		// TODO Auto-generated method stub
		return sDao.sportsDetailData(no);
	}

	@Override
	public List<SportsReserveVO> sportsListData(Map map) {
		// TODO Auto-generated method stub
		return sDao.sportsListData(map);
	}

	@Override
	public int sportsListCount() {
		// TODO Auto-generated method stub
		return sDao.sportsListCount();
	}

	@Override
	public SportsReserveVO sportsListDetailData(int no) {
		// TODO Auto-generated method stub
		return sDao.sportsListDetailData(no);
	}
}