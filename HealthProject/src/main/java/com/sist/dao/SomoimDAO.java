package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;


@Repository
public class SomoimDAO {
	@Autowired
	private SomoimMapper Smapper;
	
	@Autowired
	private MemberMapper Mmapper;
	
	public List<SomoimVO> somoimListData(Map map)
	{
		return Smapper.somoimListData(map);
	}
	
	public int somoimTotalPage()
	{
		return Smapper.somoimTotalPage();
	}
	
	public int SomoimTitleCheck(String title)
	{
		return Smapper.SomoimTitleCheck(title);
	}
	
	public int SomoimMakeCheck(String hostname)
	{
		return Smapper.SomoimMakeCheck(hostname);
	}
	
    public List<SomoimVO> somoimType1List(Map map)
    {
    	return Smapper.somoimType1List(map);
    }
	
	
	public List<SomoimVO> somoimType2List(Map map)
	{
    	return Smapper.somoimType2List(map);
    }
	
	
	public List<SomoimVO> somoimType3List(Map map)
	{
    	return Smapper.somoimType3List(map);
    }
	
	
	public List<SomoimVO> somoimType4List(Map map)
	{
    	return Smapper.somoimType4List(map);
    }
	
	
	public List<SomoimVO> somoimType5List(Map map)
	{
    	return Smapper.somoimType5List(map);
    }
	
	public int somoimType1TotalPage()
	{
		return Smapper.somoimType1TotalPage();
	}
	
	public int somoimType2TotalPage()
	{
		return Smapper.somoimType2TotalPage();
	}
	
	public int somoimType3TotalPage()
	{
		return Smapper.somoimType3TotalPage();
	}
	
	public int somoimType4TotalPage()
	{
		return Smapper.somoimType4TotalPage();
	}
	
	public int somoimType5TotalPage()
	{
		return Smapper.somoimType5TotalPage();
	}
	//상세보기
	public SomoimVO SomoimDetailData(int sno)
	{
		Smapper.hitIncrement(sno);
		return Smapper.SomoimDetailData(sno);
	}
	
	// 가입되어있는지 확인
	public int somoimjoincheck(Map map)
	{
		return Smapper.somoimjoincheck(map);
	}
	
	public void SomoimExitData(String userId)
	{
		Smapper.SomoimExitData(userId);
	}

	public int somoimjjimcheck(Map map)
	{
		return Smapper.somoimjjimcheck(map);
	}
	
	public void SomoimJoinData(Map map)
	{
		Smapper.SomoimJoinData(map);
	}
	
	public void somoimjjimInsertData(Map map)
	{
		Smapper.somoimjjimInsertData(map);
	}
	
	public void somoimjjimDeleteData(Map map)
	{
		Smapper.somoimjjimDeleteData(map);
	}
	
	
	// 스케쥴 
	 public List<Somoim_scheduleVO> ScheduleListData(Map map)
	 {
		 return Smapper.ScheduleListData(map);
	 }
	 
	 public int ScheduleTotalPage()
	 {
		 return Smapper.ScheduleTotalPage();
	 }
	 
	 public Somoim_scheduleVO ScheduleDetailData(int ssdno)
	 {
		 return Smapper.ScheduleDetailData(ssdno);
	 }
	 
	 // 회원
	 public List<MemberVO> ScheduleJoinMember(int somoimno)
	 {
		 return Smapper.ScheduleJoinMember(somoimno);
	 }
	 
	 public int SomoimMemberCount(int somoimno)
	 {
		 return Smapper.SomoimMemberCount(somoimno);
	 }
	 
	 
	 
	 //커뮤니티
	 public List<Somoim_communityVO> SomoimCommunityList(Map map)
	 {
		 return Smapper.SomoimCommunityList(map);
	 }
	 
	 public Somoim_communityVO SomoimCommunityDetail(int scno)
	 {
		 return Smapper.SomoimCommunityDetail(scno);
	 }
	 
	 // 커뮤니티 댓글
	 public List<Somoim_replyVO> SomoimCommunityReply(int scno)
	 {
		 return Smapper.SomoimCommunityReply(scno);
	 }
	 
	 public void SomoimCommunityReplyInsert(Somoim_replyVO vo)
	 {
		 Smapper.SomoimCommunityReplyInsert(vo);
	 }
	 
	 public void SomoimCommunityReplyUpdate(Somoim_replyVO vo)
	 {
		 Smapper.SomoimCommunityReplyUpdate(vo);
	 }
	 
	 public void SomoimCommunityReplyDelete(int rno)
	 {
		 Smapper.SomoimCommunityReplyDelete(rno);
	 }
	 
	 public String SomoimReplyPoster(String writerid)
	 {
		 return Smapper.SomoimReplyPoster(writerid);
	 }
	 
	 //소모임 추가
	 public void SomoimInsertData(SomoimVO vo)
	 {
		  Smapper.SomoimInsertData(vo);
	 }
	 
	 public List<SomoimVO> somoimJjimListData(Map map)
	 {
		 return Smapper.somoimJjimListData(map);
	 }
	 public int SomoimJjimCount(String userId)
	 {
		 return Smapper.SomoimJjimCount(userId);
	 }
	 public String somoimTypeeCheck(int somoimno)
	 {
		 return Smapper.somoimTypeeCheck(somoimno);
	 }
	 
	 
}
