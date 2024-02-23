package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.MemberVO;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO mDao;
	
	@Override
	public int memberIdCount(String userid) {
		// TODO Auto-generated method stub
		return mDao.memberIdCount(userid); 
	}

	@Override
	public void memberInsert(MemberVO vo) {
		// TODO Auto-generated method stub
			mDao.memberInsert(vo);
	}

	@Override
	public void memberAuthorityInsert(String userId) {
		// TODO Auto-generated method stub
			mDao.memberAuthorityInsert(userId);
	}

	@Override
	public MemberVO memberLogin(String userId, String userPwd) {
		// TODO Auto-generated method stub
		return mDao.memberLogin(userId, userPwd);
	}

	@Override
	public MemberVO memberInfo(String userId) {
		// TODO Auto-generated method stub
		return mDao.memberInfo(userId);
	}

	@Override
	public MemberVO memberSessionData(String userId) {
		// TODO Auto-generated method stub
		return mDao.memberSessionData(userId);
	}

	@Override
	public void lastLoginUpdate(String userId) {
		// TODO Auto-generated method stub
		mDao.lastLoginUpdate(userId);
	}

	@Override
	public MemberVO memberSessionInfoData(String userId) {
		// TODO Auto-generated method stub
		return mDao.memberSessionInfoData(userId);
	}
	
	//선미 추가 부분 (관리자 메뉴 - 회원목록)
	@Override
	public List<MemberVO> memberListData(Map map) {
		// TODO Auto-generated method stub
		return mDao.memberListData(map);
	}

	@Override
	public int memberTotalData() {
		// TODO Auto-generated method stub
		return mDao.memberTotalData();
	}

	@Override
	public MemberVO memberDetailData(String userid) {
		// TODO Auto-generated method stub
		return mDao.memberDetailData(userid);
	}
	
	
}
