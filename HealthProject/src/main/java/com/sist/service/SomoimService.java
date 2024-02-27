package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.MemberVO;
import com.sist.vo.SomoimVO;
import com.sist.vo.Somoim_communityVO;
import com.sist.vo.Somoim_replyVO;
import com.sist.vo.Somoim_scheduleVO;

public interface SomoimService {
	public List<SomoimVO> somoimListData(Map map);
	public int somoimTotalPage();
	public SomoimVO SomoimDetailData(int sno);
	public List<Somoim_scheduleVO> ScheduleListData(Map map);
	public int ScheduleTotalPage();
	public Somoim_scheduleVO ScheduleDetailData(int ssdno);
	public List<MemberVO> ScheduleJoinMember(int somoimno);
	public int SomoimMemberCount(int somoimno);
    public List<Somoim_communityVO> SomoimCommunityList(Map map);
    public Somoim_communityVO SomoimCommunityDetail(int scno);
    public List<Somoim_replyVO> SomoimCommunityReply(int scno);
    public void SomoimCommunityReplyInsert(Somoim_replyVO vo);
	public void SomoimCommunityReplyUpdate(Somoim_replyVO vo);
	public void SomoimCommunityReplyDelete(int rno);
	public String SomoimReplyPoster(String writerid);
	public List<SomoimVO> somoimType1List(Map map);
	public List<SomoimVO> somoimType2List(Map map);
	public List<SomoimVO> somoimType3List(Map map);
	public List<SomoimVO> somoimType4List(Map map);
	public List<SomoimVO> somoimType5List(Map map);
	public int somoimType1TotalPage();
	public int somoimType2TotalPage();
	public int somoimType3TotalPage();
	public int somoimType4TotalPage();
	public int somoimType5TotalPage();
	public int somoimjjimcheck(Map map);
	public void somoimjjimInsertData(Map map);
	public void somoimjjimDeleteData(Map map);
	public void SomoimInsertData(SomoimVO vo);
	public int SomoimTitleCheck(String title);
	public int SomoimMakeCheck(String hostname); 
	public void SomoimJoinData(Map map);
	public int somoimjoincheck(Map map);
	public void SomoimExitData(String userId);
	public List<SomoimVO> somoimJjimListData(Map map);
	public int SomoimJjimCount(String userId);
	public String somoimTypeeCheck(int somoimno);
	
}
