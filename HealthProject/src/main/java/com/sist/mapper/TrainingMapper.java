package com.sist.mapper;

import java.util.*;


import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface TrainingMapper {
	@Select("SELECT tno,uri,explain,jjim,num "
			 +"FROM (SELECT tno,uri,explain,jjim,rownum as num "
			 +"FROM (SELECT tno,uri,explain,jjim "
			 +"FROM training "
			 +"ORDER BY tno ASC)) "
			 +"WHERE num BETWEEN #{start} AND #{end}")
	  public List<TrainingVO> trainListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM training")
	public int trainListCount();
	
	// 상세보기
	@Select("SELECT tno,uri,explain,kcal,explain,img "
			 +"FROM training "
			 +"WHERE tno=#{tno}")
	public TrainingVO trainDetailData(int tno);
}
