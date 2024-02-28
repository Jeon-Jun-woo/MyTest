package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.SportsReserveVO;

public interface SportsReserveService {
	public List<SportsReserveVO> sportsFindData(Map map);
	public int sportsFindCount(Map map);
	public SportsReserveVO sportsDetailData(int no);
	public List<SportsReserveVO> sportsListData(Map map);
	public int sportsListCount();
	public SportsReserveVO sportsListDetailData(int no);

}