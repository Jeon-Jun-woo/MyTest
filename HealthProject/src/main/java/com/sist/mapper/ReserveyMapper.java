package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface ReserveyMapper {
	@Select("SELECT yno,subject,phone "
			+"FROM yakgook "
			+"WHERE address LIKE '%'||#{address}||'%'")
	public List<YakgookVO> yakgookReserveData(String address); // 지역
	
	@Insert("INSERT INTO reserve_y VALUES("
			+"yre_rno_seq.nextval,#{yno},#{userId},#{rDate},#{rTime},"
			+"#{rInwon},SYSDATE,0)")
	public void yakgookReserveInsert(ReserveyVO vo);
	
	@Results({
		@Result(column = "subject",property = "yvo.subject"),
		@Result(column = "phone",property = "yvo.phone"),
		@Result(column = "address",property = "yvo.address")
	}) //조인
	@Select("SELECT rno,r.yno,subject,phone,address,rDate,rTime,"
			+"rInwon,reserve_ok,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday "
			+"FROM reserve_y r,yakgook y "
			+"WHERE r.yno=y.yno "
			+"AND userId=#{userId} "
			+"ORDER BY rno DESC")
	public List<ReserveyVO> reserveMypageData(String userId);
	
	@Delete("DELETE FROM reserve_y "
			+"WHERE rno=#{rno}")
	public void reserveCancel(int rno);
	
	
	@Results({
		@Result(column = "subject",property = "yvo.subject"),
		@Result(column = "phone",property = "yvo.phone"),
		@Result(column = "address",property = "yvo.address")
	}) //조인
	@Select("SELECT rno,r.yno,subject,phone,address,rDate,rTime,"
			+"rInwon,reserve_ok,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday "
			+"FROM reserve_y r,yakgook y "
			+"WHERE r.yno=y.yno "
			+"ORDER BY rno DESC")
	public List<ReserveyVO> reserveAdminpageData();
	
	@Update("UPDATE reserve_y SET "
			+"reserve_ok=1 "
			+"WHERE rno=#{rno}")
	public void reserveOk(int rno);
	
	
	@Results({
		@Result(column = "subject",property = "yvo.subject"),
		@Result(column = "phone",property = "yvo.phone"),
		@Result(column = "address",property = "yvo.address")
	}) //조인
	@Select("SELECT rno,r.yno,subject,phone,address,rDate,rTime,"
			+"rInwon,reserve_ok,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday "
			+"FROM reserve_y r,yakgook y "
			+"WHERE r.yno=y.yno "
			+"AND rno=#{rno}")
	public ReserveyVO reserveInfoData(int rno); 
}
