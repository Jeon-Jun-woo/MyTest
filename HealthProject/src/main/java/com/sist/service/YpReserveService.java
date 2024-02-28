package com.sist.service;

import java.util.*;
import com.sist.vo.*;

public interface YpReserveService {
	public List<SportsReserveVO> sportsReserveData(String type);
	public void ypReserveInsert(YpReserveVO vo);
	public List<YpReserveVO> reserveMypageData(String userId);
	public void reserveCancel(int rno);
	public List<YpReserveVO> reserveAdminpageData();
	public void reserveOk(int rno);
	public YpReserveVO reserveInfoData(int rno);
}
