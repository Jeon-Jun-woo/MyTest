package com.sist.service;

import java.util.List;

import org.apache.ibatis.annotations.Insert;

import com.sist.vo.ReserveyVO;
import com.sist.vo.YakgookVO;

public interface ReserveyService {
	public List<YakgookVO> yakgookReserveData(String address); 
	public void yakgookReserveInsert(ReserveyVO vo);
	public List<ReserveyVO> reserveMypageData(String userId);
	public void reserveCancel(int rno);
	public List<ReserveyVO> reserveAdminpageData();
	public void reserveOk(int rno);
	public ReserveyVO reserveInfoData(int rno);
}
