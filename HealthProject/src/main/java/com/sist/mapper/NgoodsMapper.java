package com.sist.mapper;
import org.apache.ibatis.annotations.Select;

import java.util.*;
import com.sist.vo.*;
public interface NgoodsMapper {
	@Select("SELECT gno,poster,brand2,kName,price FROM goods_nut "
			+"WHERE gno BETWEEN 1 AND 4")
	public List<NgoodsVO> goodsMainData();
}
