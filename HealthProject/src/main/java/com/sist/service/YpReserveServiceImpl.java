package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.YpReserveDAO;
import com.sist.vo.SportsReserveVO;
import com.sist.vo.YpReserveVO;

@Service
public class YpReserveServiceImpl implements YpReserveService {

	@Autowired
	private YpReserveDAO yDao;
	
	@Override
	public List<SportsReserveVO> sportsReserveData(String type) {
		// TODO Auto-generated method stub
		return yDao.sportsReserveData(type);
	}

	@Override
	public void ypReserveInsert(YpReserveVO vo) {
		// TODO Auto-generated method stub
		yDao.ypReserveInsert(vo);
	}

	@Override
	public List<YpReserveVO> reserveMypageData(String userId) {
		// TODO Auto-generated method stub
		return yDao.reserveMypageData(userId);
	}

	@Override
	public void reserveCancel(int rno) {
		// TODO Auto-generated method stub
		yDao.reserveCancel(rno);
	}

	@Override
	public List<YpReserveVO> reserveAdminpageData() {
		// TODO Auto-generated method stub
		return yDao.reserveAdminpageData();
	}

	@Override
	public void reserveOk(int rno) {
		// TODO Auto-generated method stub
		yDao.reserveOk(rno);
	}

	@Override
	public YpReserveVO reserveInfoData(int rno) {
		// TODO Auto-generated method stub
		return yDao.reserveInfoData(rno);
	}
	
}
