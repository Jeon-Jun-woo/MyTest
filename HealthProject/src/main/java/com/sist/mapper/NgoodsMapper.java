package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface NgoodsMapper {
	//상품 전체 검색 리스트
		@Select("SELECT gno,poster,kName,brand2,price,num "
				 +"FROM (SELECT gno,poster,kName,brand2,price,rownum as num "
				 +"FROM (SELECT gno,poster,kName,brand2,price "
				 +"FROM goods_nut "
				 +"WHERE kname LIKE '%'||#{kname}||'%' "
				 +"ORDER BY gno ASC)) "
				 +"WHERE num BETWEEN #{start} AND #{end}")
		public List<NgoodsVO> goodsListData(Map map);
		  
		@Select("SELECT CEIL(COUNT(*)/12.0) FROM goods_nut "
				 +"WHERE kname LIKE '%'||#{kname}||'%'")
		public int goodsListCount(Map map);
		
		
		@Select("SELECT gno,poster,kName,brand2,price,num "
				 +"FROM (SELECT gno,poster,kName,brand2,price,rownum as num "
				 +"FROM (SELECT gno,poster,kName,brand2,price "
				 +"FROM goods_nut "
				 +"WHERE kname LIKE '%'||#{kname}||'%' AND type=#{type} "
				 +"ORDER BY gno ASC)) "
				 +"WHERE num BETWEEN #{start} AND #{end}")
		public List<NgoodsVO> goodsTypeListData(Map map);
		  
		@Select("SELECT CEIL(COUNT(*)/12.0) FROM goods_nut "
				 +"WHERE kname LIKE '%'||#{kname}||'%' AND type=#{type}")
		public int goodsTypeListCount(Map map);
		
		
		@Select("SELECT gno,kName,eName,poster,price,brand1,brand2,eatSize,eatUse,caution,type,jjim "
			     +"FROM goods_nut "
			     +"WHERE gno=#{gno}")
		public NgoodsVO goodsDetailData(int gno);
	  
		@Update("UPDATE goods_nut SET "
	    		 +"jjim=jjim+1 "
	    		 +"WHERE gno=#{gno}")
		public void goodsJjimIncrement(int gno);
}
