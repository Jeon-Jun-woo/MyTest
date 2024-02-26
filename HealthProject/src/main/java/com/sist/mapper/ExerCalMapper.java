package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.Select;
import com.sist.vo.*;
public interface ExerCalMapper {
	@Select("SELECT eno,name,cal,effects,num "
			 +"FROM (SELECT eno,name,cal,effects,rownum as num "
			 +"FROM (SELECT eno,name,cal,effects "
			 +"FROM exercise_cal "
			 +"ORDER BY eno ASC)) "
			 +"WHERE num BETWEEN #{start} AND #{end}")
	  public List<ExerCalVO> exerListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM exercise_cal")
	public int exerciseListCount();
	
	@Select("SELECT eno,name,cal,time,effects "
			 +"FROM exercise_cal "
			 +"WHERE eno=#{eno}")
	  public ExerCalVO exerDetailData(int eno);
	
	@Select("SELECT eno,name,cal,effects,num "
			  +"FROM (SELECT eno,name,cal,effects,rownum as num "
			  +"FROM (SELECT eno,name,cal,effects "
			  +"FROM exercise_cal "
			  +"WHERE name LIKE '%'||#{name}||'%' "
			  +"ORDER BY eno ASC)) "
			  +"WHERE num BETWEEN #{start} AND #{end}")
   public List<ExerCalVO> exerFindData(Map map);
}
