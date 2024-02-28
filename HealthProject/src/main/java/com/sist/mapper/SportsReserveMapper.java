package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface SportsReserveMapper {
	@Select("SELECT no, poster, title, num "
			+ "FROM (SELECT no, poster, title, rownum as num "
			+ "FROM (SELECT no, poster, title "
			+ "FROM sportsReserve "
			+ "WHERE address LIKE '%'||#{address}||'%' "
			+ "ORDER BY no ASC)) "
			+ "WHERE num  BETWEEN #{start} AND #{end}")
	public List<SportsReserveVO> sportsFindData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sportsReserve "
			+"WHERE address LIKE '%'||#{address}||'%'")
	public int sportsFindCount(Map map);
	
	@Select("SELECT no, title, poster, address, time, phone "
			+ "FROM sportsReserve "
			+ "WHERE no=#{no}")
	public SportsReserveVO sportsDetailData(int no);
	
	@Update("UPDATE sportsReserve SET "
			+ "hit=hit+1 "
			+ "WHERE no=#{no}")
    public void sportsHitIncrement(int no);
	
	@Select("SELECT no, poster, title, num "
			+"FROM (SELECT no, poster, title, rownum as num "
			+"FROM (SELECT no, poster, title "
			+"FROM sportsReserve "
			+"ORDER BY no ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<SportsReserveVO> sportsListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sportsReserve")
	public int sportsListCount();
	
	@Select("SELECT no, title , rownum "
			+"FROM (SELECT no, title "
			+"FROM SportsReserve ORDER BY hit DESC) "
			+"WHERE rownum<=7")
	public List<SportsReserveVO> YPTop7();
	  
	@Select("SELECT no, title, poster, rownum "
			+ "FROM (SELECT no, title, poster "
			+ "FROM SportsReserve ORDER BY hit DESC) "
			+ "WHERE rownum<=12")
	public List<SportsReserveVO> YPHome12();
}