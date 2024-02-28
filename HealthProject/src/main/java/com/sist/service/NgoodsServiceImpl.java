package com.sist.service;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.*;
import com.sist.dao.*;
@Service
public class NgoodsServiceImpl implements NgoodsService{
	@Autowired
	private NgoodsDAO gDao;

	@Override
	public List<NgoodsVO> goodsListData(Map map) {
		// TODO Auto-generated method stub
		return gDao.goodsListData(map);
	}

	@Override
	public int goodsListCount(Map map) {
		// TODO Auto-generated method stub
		return gDao.goodsListCount(map);
	}

	@Override
	public NgoodsVO goodsDetailData(int gno) {
		// TODO Auto-generated method stub
		return gDao.goodsDetailData(gno);
	}

	@Override
	public List<NgoodsVO> goodsTypeListData(Map map) {
		// TODO Auto-generated method stub
		return gDao.goodsTypeListData(map);
	}

	@Override
	public int goodsTypeListCount(Map map) {
		// TODO Auto-generated method stub
		return gDao.goodsTypeListCount(map);
	}

	
	
	
}
