package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Service
public class ReserveyServiceImpl implements ReserveyService{
	@Autowired
	private ReserveyDAO rDao;

	@Override
	public List<YakgookVO> yakgookReserveData(String address) {
		// TODO Auto-generated method stub
		return rDao.yakgookReserveData(address);
	}

	@Override
	public void yakgookReserveInsert(ReserveyVO vo) {
		// TODO Auto-generated method stub
		rDao.yakgookReserveInsert(vo);
	}

	@Override
	public List<ReserveyVO> reserveMypageData(String userId) {
		// TODO Auto-generated method stub
		return rDao.reserveMypageData(userId);
	}

	@Override
	public void reserveCancel(int rno) {
		// TODO Auto-generated method stub
		rDao.reserveCancel(rno);
	}

	@Override
	public List<ReserveyVO> reserveAdminpageData() {
		// TODO Auto-generated method stub
		return rDao.reserveAdminpageData();
	}

	@Override
	public void reserveOk(int rno) {
		// TODO Auto-generated method stub
		rDao.reserveOk(rno);
	}

	@Override
	public ReserveyVO reserveInfoData(int rno) {
		// TODO Auto-generated method stub
		return rDao.reserveInfoData(rno);
	}
	
	
}
