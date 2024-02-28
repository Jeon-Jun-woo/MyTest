package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Service
public class NreplyServiceImpl implements NreplyService{
	@Autowired
	private NreplyDAO dao;

	@Override
	public List<NreplyVO> replyListData(int gno) {
		// TODO Auto-generated method stub
		return dao.replyListData(gno);
	}

	@Override
	public void replyInsert(NreplyVO vo) {
		// TODO Auto-generated method stub
		dao.replyInsert(vo);
	}

	@Override
	public void replyUpdate(NreplyVO vo) {
		// TODO Auto-generated method stub
		dao.replyUpdate(vo);
	}

	@Override
	public void replyDelete(int no) {
		// TODO Auto-generated method stub
		dao.replyDelete(no);
	}

	@Override
	public int replyCount(int gno) {
		// TODO Auto-generated method stub
		return dao.replyCount(gno);
	}
	
	
}
