package com.sist.mapper;
import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;
public interface FoodCalMapper {
	// 리스트 출력
	@Select("SELECT fno,name,cal,unit,num "
			 +"FROM (SELECT fno,name,cal,unit,rownum as num "
			 +"FROM (SELECT fno,name,unit,cal "
			 +"FROM food_cal "
			 +"ORDER BY fno ASC)) "
			 +"WHERE num BETWEEN #{start} AND #{end}")
	  public List<FoodCalVO> foodListData(Map map);
	  
	  @Select("SELECT CEIL(COUNT(*)/20.0) FROM food_cal")
	  public int foodListCount();
	  // 상세보기 
	  @Select("SELECT fno,name,unit,cal,nut,exer "
			 +"FROM food_cal "
			 +"WHERE fno=#{fno}")
	  public FoodCalVO foodDetailData(int fno);
	  
	  @Select("SELECT fno,name,cal,unit,num "
			  +"FROM (SELECT fno,name,cal,unit,rownum as num "
			  +"FROM (SELECT fno,name,cal,unit "
			  +"FROM food_cal "
			  +"WHERE name LIKE '%'||#{name}||'%' "
			  +"ORDER BY fno ASC)) "
			  +"WHERE num BETWEEN #{start} AND #{end}")
     public List<FoodCalVO> foodFindData(Map map);
}
