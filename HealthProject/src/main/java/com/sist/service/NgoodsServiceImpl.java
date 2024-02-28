package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Service
public class NgoodsServiceImpl implements NgoodsService{
	@Autowired
	private NgoodsDAO gDao;

	@Override
	public List<NgoodsVO> goodsMainData() {
		// TODO Auto-generated method stub
		return gDao.goodsMainData();
	}
	
	
}
