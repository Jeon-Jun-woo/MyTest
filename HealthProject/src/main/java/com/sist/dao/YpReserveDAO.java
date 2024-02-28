package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class YpReserveDAO {
	 @Autowired
	 private YpReserveMapper mapper;
	
	 public List<SportsReserveVO> sportsReserveData(String type)
	 {
		return mapper.sportsReserveData(type);
	 }
	 public void ypReserveInsert(YpReserveVO vo)
	 {
		 mapper.ypReserveInsert(vo);
	 }
	 public List<YpReserveVO> reserveMypageData(String userId)
	 {
		 return mapper.reserveMypageData(userId);
	 }
	 public void reserveCancel(int rno)
	 {
		 mapper.reserveCancel(rno);
	 }
	 public List<YpReserveVO> reserveAdminpageData()
	 {
		 return mapper.reserveAdminpageData();
	 }
	 public void reserveOk(int rno)
	 {
		 mapper.reserveOk(rno);
	 }
	 public YpReserveVO reserveInfoData(int rno)
	 {
		 return mapper.reserveInfoData(rno);
	 }
}
