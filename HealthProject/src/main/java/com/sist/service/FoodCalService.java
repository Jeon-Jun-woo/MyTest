package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.FoodCalVO;

public interface FoodCalService {
	public List<FoodCalVO> foodListData(Map map);
	public int foodListCount();
	public FoodCalVO foodDetailData(int fno);
	public List<FoodCalVO> foodFindData(Map map);
}
