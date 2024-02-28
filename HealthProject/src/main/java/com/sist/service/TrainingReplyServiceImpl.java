package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
@Service
public class TrainingReplyServiceImpl implements TrainingReplyService{
	@Autowired
	private TrainingReplyDAO tDao;

	@Override
	public List<TrainReplyVO> replyListData(int tno) {
		// TODO Auto-generated method stub
		return tDao.replyListData(tno);
	}

	@Override
	public void replyInsert(TrainReplyVO vo) {
		// TODO Auto-generated method stub
		tDao.replyInsert(vo);
	}

	@Override
	public void replyUpdate(TrainReplyVO vo) {
		// TODO Auto-generated method stub
		tDao.replyUpdate(vo);
	}

	@Override
	public void replyDelete(int no) {
		// TODO Auto-generated method stub
		tDao.replyDelete(no);
	}

	@Override
	public MemberVO memberInfoData(String userId) {
		// TODO Auto-generated method stub
		return tDao.memberInfoData(userId);
	}
	
	
}
