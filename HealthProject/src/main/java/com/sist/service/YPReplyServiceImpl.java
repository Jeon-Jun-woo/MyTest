package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

import com.sist.dao.YpReplyDAO;
import com.sist.vo.*;

@Service
public class YPReplyServiceImpl implements YPReplyService{

	@Autowired
	private YpReplyDAO yDao;
	
	@Override
	public List<YPReplyVO> ypReplyListData(int yno) {
		// TODO Auto-generated method stub
		return yDao.ypReplyListData(yno);
	}

	@Override
	public void ypReplyInsert(YPReplyVO vo) {
		// TODO Auto-generated method stub
		yDao.ypReplyInsert(vo);
	}

	@Override
	public void ypReplyUpdate(YPReplyVO vo) {
		// TODO Auto-generated method stub
		yDao.ypReplyUpdate(vo);
	}

	@Override
	public void ypReplyDelete(int no) {
		// TODO Auto-generated method stub
		yDao.ypReplyDelete(no);
	}

	@Override
	public MemberVO memberInfoData(String userId) {
		// TODO Auto-generated method stub
		return yDao.memberInfoData(userId);
	}
		

}
