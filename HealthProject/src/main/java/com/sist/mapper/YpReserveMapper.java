package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface YpReserveMapper {
	@Select("SELECT no,poster,title "
			  +"FROM sportsreserve "
			  +"WHERE type LIKE '%'||#{type}||'%'")
	   public List<SportsReserveVO> sportsReserveData(String type);
	
	 @Insert("INSERT INTO sportsreserve VALUES("
			  +"re_rno_seq.nextval,#{no},#{userId},#{rDate},#{rTime},"
			  +"SYSDATE,0)")
	   public void ypReserveInsert(YpReserveVO vo);
	   
	   @Results({ // 조인걸 때마다 가져오기
		   @Result(column = "title",property = "rvo.title"),
		   @Result(column = "poster",property = "rvo.poster")
	   })
	   // 마이페이지 예약내역
	   @Select("SELECT rno,r.no,title,poster,rDate,rTime,"
			  +"reserve_ok,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday "
			  +"FROM ypreserve r,sportsreserve s"
			  +"WHERE r.no=s.no "
			  +"AND userId=#{userId} "
			  +"ORDER BY rno DESC")
	   public List<YpReserveVO> reserveMypageData(String userId);
	   
	   // 마이페이지에서 예약 취소
	   @Delete("DELETE FROM ypreserve "
			  +"WHERE rno=#{rno}")
	   public void reserveCancel(int rno);
	   
	   @Results({
		   @Result(column = "title",property = "rvo.title"),
		   @Result(column = "poster",property = "rvo.poster")
	   })
	   // 관리자 페이지 예약
	   @Select("SELECT rno,r.no,title,poster,rDate,rTime,"
			  +"reserve_ok,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday "
			  +"FROM ypreserve r,sportsreserve s"
			  +"WHERE r.no=s.no "
			  +"ORDER BY rno DESC")
	   public List<YpReserveVO> reserveAdminpageData();
	   
	   // 관리자 페이지 예약 확인
	   @Update("UPDATE ypreserve SET "
			  +"reserve_ok=1 "
			  +"WHERE rno=#{rno}")
	   public void reserveOk(int rno);
	   
	   @Results({
		   @Result(column = "title",property = "rvo.title"),
		   @Result(column = "poster",property = "rvo.poster")
	   })
	   @Select("SELECT rno,r.no,userId,title,poster,rDate,rTime,"
				  +"reserve_ok,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday "
				  +"FROM ypreserve r,sportsreserve s "
				  +"WHERE r.no=s.no "
				  +"AND rno=#{rno}")
	   public YpReserveVO reserveInfoData(int rno);
}
