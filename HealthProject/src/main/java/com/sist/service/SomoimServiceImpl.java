package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.vo.MemberVO;
import com.sist.vo.SomoimVO;
import com.sist.vo.Somoim_communityVO;
import com.sist.vo.Somoim_replyVO;
import com.sist.vo.Somoim_scheduleVO;
@Service
public class SomoimServiceImpl implements SomoimService {
	@Autowired
	private SomoimDAO dao;
	
	@Override
	public List<SomoimVO> somoimListData(Map map) {
		// TODO Auto-generated method stub
		return dao.somoimListData(map);
	}

	@Override
	public int somoimTotalPage() {
		// TODO Auto-generated method stub
		return dao.somoimTotalPage();
	}

	@Override
	public SomoimVO SomoimDetailData(int sno) {
		// TODO Auto-generated method stub
		return dao.SomoimDetailData(sno);
	}

	@Override
	public List<Somoim_scheduleVO> ScheduleListData(Map map) {
		// TODO Auto-generated method stub
		return dao.ScheduleListData(map);
	}

	@Override
	public int ScheduleTotalPage() {
		// TODO Auto-generated method stub
		return dao.ScheduleTotalPage();
	}

	@Override
	public Somoim_scheduleVO ScheduleDetailData(int ssdno) {
		// TODO Auto-generated method stub
		return dao.ScheduleDetailData(ssdno);
	}

	@Override
	public List<MemberVO> ScheduleJoinMember(int somoimno) {
		// TODO Auto-generated method stub
		return dao.ScheduleJoinMember(somoimno);
	}

	@Override
	public int SomoimMemberCount(int somoimno) {
		// TODO Auto-generated method stub
		return dao.SomoimMemberCount(somoimno);
	}

	@Override
	public List<Somoim_communityVO> SomoimCommunityList(Map map) {
		// TODO Auto-generated method stub
		return dao.SomoimCommunityList(map);
	}

	@Override
	public Somoim_communityVO SomoimCommunityDetail(int scno) {
		// TODO Auto-generated method stub
		return dao.SomoimCommunityDetail(scno);
	}

	@Override
	public List<Somoim_replyVO> SomoimCommunityReply(int scno)
	{
		return dao.SomoimCommunityReply(scno);
	}

	@Override
	public void SomoimCommunityReplyInsert(Somoim_replyVO vo) {
		dao.SomoimCommunityReplyInsert(vo);
		
	}

	@Override
	public void SomoimCommunityReplyUpdate(Somoim_replyVO vo) {
		dao.SomoimCommunityReplyUpdate(vo);
		
	}

	@Override
	public void SomoimCommunityReplyDelete(int rno) {
		dao.SomoimCommunityReplyDelete(rno);
		
	}

	@Override
	public String SomoimReplyPoster(String writerid) {
		// TODO Auto-generated method stub
		return dao.SomoimReplyPoster(writerid);
	}

	

	@Override
	public List<SomoimVO> somoimType1List(Map map) {
		// TODO Auto-generated method stub
		return dao.somoimType1List(map);
	}

	@Override
	public List<SomoimVO> somoimType2List(Map map) {
		// TODO Auto-generated method stub
		return dao.somoimType2List(map);
	}

	@Override
	public List<SomoimVO> somoimType3List(Map map) {
		// TODO Auto-generated method stub
		return dao.somoimType3List(map);
	}

	@Override
	public List<SomoimVO> somoimType4List(Map map) {
		// TODO Auto-generated method stub
		return dao.somoimType4List(map);
	}

	@Override
	public List<SomoimVO> somoimType5List(Map map) {
		// TODO Auto-generated method stub
		return dao.somoimType5List(map);
	}

	@Override
	public int somoimType1TotalPage() {
		// TODO Auto-generated method stub
		return dao.somoimType1TotalPage();
	}

	@Override
	public int somoimType2TotalPage() {
		// TODO Auto-generated method stub
		return dao.somoimType2TotalPage();
	}

	@Override
	public int somoimType3TotalPage() {
		// TODO Auto-generated method stub
		return dao.somoimType3TotalPage();
	}

	@Override
	public int somoimType4TotalPage() {
		// TODO Auto-generated method stub
		return dao.somoimType4TotalPage();
	}

	@Override
	public int somoimType5TotalPage() {
		// TODO Auto-generated method stub
		return dao.somoimType5TotalPage();
	}

	@Override
	public int somoimjjimcheck(Map map) {
		// TODO Auto-generated method stub
		return dao.somoimjjimcheck(map);
	}

	@Override
	public void somoimjjimInsertData(Map map) {
		// TODO Auto-generated method stub
		dao.somoimjjimInsertData(map);
	}

	@Override
	public void somoimjjimDeleteData(Map map) {
		// TODO Auto-generated method stub
		dao.somoimjjimDeleteData(map);
	}

	

	

	

	

}
