package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class ReserveyDAO {
	@Autowired
	private ReserveyMapper mapper;
	
	public List<YakgookVO> yakgookReserveData(String address)
	{
		return mapper.yakgookReserveData(address);
	}
	
	public void yakgookReserveInsert(ReserveyVO vo)
	{
		mapper.yakgookReserveInsert(vo);
	}
	
	public List<ReserveyVO> reserveMypageData(String userId)
	{
		return mapper.reserveMypageData(userId);
	}
	
	public void reserveCancel(int rno)
	{
		mapper.reserveCancel(rno);
	}
	
	public List<ReserveyVO> reserveAdminpageData()
	{
		return mapper.reserveAdminpageData();
	}
	
	public void reserveOk(int rno)
	{
		mapper.reserveOk(rno);
	}
	
	public ReserveyVO reserveInfoData(int rno)
	{
		return mapper.reserveInfoData(rno);
	}
}
