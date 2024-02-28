package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.NgoodsVO;

public interface NgoodsService {
	public List<NgoodsVO> goodsListData(Map map);
	public int goodsListCount(Map map);
	public NgoodsVO goodsDetailData(int gno);
	public List<NgoodsVO> goodsTypeListData(Map map);
	public int goodsTypeListCount(Map map);
}
