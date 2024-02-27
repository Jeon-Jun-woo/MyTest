package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
/*
 	private int sno,typee,hit,jjim;
	private String hostname,title,poster,inwon,content,loc;
 */
public interface SomoimMapper {
	// 회원
	@Select("SELECT userId,userName,userPwd,enabled,sex,birthday,email,post,addr1,addr2,phone,content,regdate,modifyDate,lastLogin,somoimadmin,somoimno,poster,nickname "
		   +"FROM hhfinalMember WHERE somoimno=#{somoimno}")
	public List<MemberVO> ScheduleJoinMember(int somoimno);
			 
	@Select("SELECT COUNT(*) FROM hhfinalMember WHERE somoimno=#{somoimno}")
	public int SomoimMemberCount(int somoimno);
	
	//===================================================================
	// 목록
	@Select("SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,num "
			+"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,rownum as num "
			+"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc "
			+"FROM somoim10 ORDER BY sno ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<SomoimVO> somoimListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM somoim10")
	public int somoimTotalPage();

	
	@Select("SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,num "
		   +"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,rownum as num "
	       +"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc "
		   +"FROM somoim10 WHERE typee='축구' OR typee='야구' OR typee='풋살' OR typee='스포츠관람' ORDER BY sno ASC)) "
		   +"WHERE num BETWEEN #{start} AND #{end}")
	public List<SomoimVO> somoimType1List(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM somoim10 WHERE typee='축구' OR typee='야구' OR typee='풋살' OR typee='스포츠관람'")
	public int somoimType1TotalPage();
	
	
	@Select("SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,num "
		   +"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,rownum as num "
		   +"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc "
		   +"FROM somoim10 WHERE typee='클라이밍' OR typee='등산' OR typee='러닝' OR typee='요가' ORDER BY sno ASC))"
	       +"WHERE num BETWEEN #{start} AND #{end}")
	public List<SomoimVO> somoimType2List(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM somoim10 WHERE typee='클라이밍' OR typee='등산' OR typee='러닝' OR typee='요가'")
	public int somoimType2TotalPage();
	
	@Select("SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,num "
		   +"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,rownum as num "
	       +"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc "
	       +"FROM somoim10 WHERE typee='스키' OR typee='보드' OR typee='스케이트보드' ORDER BY sno ASC))"
		   +"WHERE num BETWEEN #{start} AND #{end}")
	public List<SomoimVO> somoimType3List(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM somoim10 WHERE typee='스키' OR typee='보드' OR typee='스케이트보드'")
	public int somoimType3TotalPage();
	
	@Select("SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,num "
		   +"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,rownum as num "
		   +"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc "
		   +"FROM somoim10 WHERE typee='서핑' OR typee='수영' ORDER BY sno ASC))"
		   +"WHERE num BETWEEN #{start} AND #{end}")
	public List<SomoimVO> somoimType4List(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM somoim10 WHERE typee='서핑' OR typee='수영'")
	public int somoimType4TotalPage();
	
	@Select("SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,num "
		   +"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc,rownum as num "
		   +"FROM (SELECT sno,typee,hit,jjim,hostname,title,poster,inwon,content,loc "
		   +"FROM somoim10 WHERE typee='볼링' OR typee='탁구' OR typee='테니스' ORDER BY sno ASC))"
		   +"WHERE num BETWEEN #{start} AND #{end}")
	public List<SomoimVO> somoimType5List(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM somoim10 WHERE typee='볼링' OR typee='탁구' OR typee='테니스'")
	public int somoimType5TotalPage();
	
	//===================================================================
	//상세보기
	
	//조회수증가
	@Update("UPDATE somoim10 SET "
	         +"hit=hit+1 "
	         +"WHERE sno=#{sno}")
	public void hitIncrement(int sno);
	
	// 상세정보
	@Select("SELECT sno,typee,hit,jjim,hostname,hostposter,title,poster,inwon,content,loc,num "
			+"FROM (SELECT sno,typee,hit,jjim,hostname,hostposter,title,poster,inwon,content,loc,rownum as num "
			+"FROM (SELECT sno,typee,hit,jjim,hostname,hostposter,title,poster,inwon,content,loc "
			+"FROM somoim10 ORDER BY sno ASC)) "
			+"WHERE sno=#{sno}")
	public SomoimVO SomoimDetailData(int sno);
	
	// 가입하기
	@Update("UPDATE hhfinalMember "
		   +"SET somoimno=#{sno}"
		   +"WHERE userId=#{userId}")
	public void SomoimJoinData(Map map);
	
	// 가입 되어있는지 확인
	@Select("SELECT COUNT(*) FROM hhfinalMember WHERE userid=#{userId} AND somoimno=#{sno}")
	public int somoimjoincheck(Map map);
	
	// 모임 탈퇴하기
	@Update("UPDATE hhfinalMember SET somoimno=0"
		   +"WHERE userId=#{userId}")
	public void SomoimExitData(String userId);
	
	//찜 있는지 확인
	@Select("SELECT COUNT(*) FROM somoimjjim WHERE userid=#{userId} AND sno=#{sno}")
	public int somoimjjimcheck(Map map);
	
	//찜 구현
	@Insert("INSERT INTO somoimjjim VALUES(sjj_jjno_seq.nextval,#{userId},#{sno})")
	public void somoimjjimInsertData(Map map);
	
	//찜 삭제
	@Delete("DELETE FROM somoimjjim WHERE userid=#{userId} AND sno=#{sno}")
	public void somoimjjimDeleteData(Map map);
	 
	
	 //===================================================================
	 //소모임 일정
	 @Select("SELECT ssdno,somoimno,somoim,title,regdate,timee,loc,money,inwon,content,hit,poster,num " +
		        "FROM (SELECT ssdno,somoimno,somoim,title,regdate,timee,loc,money,inwon,content,hit,poster,rownum as num " +
		        "FROM (SELECT ssdno,somoimno,somoim,title,regdate,timee,loc,money,inwon,content,hit,poster " +
		        "FROM somoim_schedule10 WHERE somoimno=#{somoimno} ORDER BY ssdno ASC)) " +
		        "WHERE num BETWEEN #{start} AND #{end}")
	 public List<Somoim_scheduleVO> ScheduleListData(Map map);
	 
	 @Select("SELECT CEIL(COUNT(*)/10.0) FROM somoim_schedule9")
	 public int ScheduleTotalPage();
	 
	//===================================================================
	 // 소모임 일정 상세보기
	 @Select("SELECT somoimno,scheduleno,somoim,poster,title,writer,writerimage,regdate,timee,loc,money,inwon,content,hit "
			 +"FROM somoim_schedule10 "
			 +"WHERE ssdno=#{ssdno}")
	 public Somoim_scheduleVO ScheduleDetailData(int ssdno);
	 
	 
	//===================================================================
	 //커뮤니티
	 //TO_CHAR(regdate,'YYYY-MM-DD') as dbday
	
	 @Select("SELECT scno,somoimno,poster,num "
	 		+"FROM (SELECT scno,somoimno,poster,rownum as num "
	 		+"FROM (SELECT scno,somoimno,poster "
	 		+"FROM somoim_community WHERE somoimno=#{somoimno} ORDER BY regdate DESC)) "
	 		+"WHERE num BETWEEN #{start} AND #{end}")
	 public List<Somoim_communityVO> SomoimCommunityList(Map map);
	 
	 @Select("SELECT scno, somoimno, poster, content,"
	 		+"CONCAT(CONCAT(CONCAT(TO_CHAR(regdate, 'YYYY'), '년 '),"
	 		+"CONCAT(CONCAT(TO_CHAR(regdate, 'MM'), '월 '),"
	 		+"TO_CHAR(regdate, 'DD'))), '일') AS dbday,"
	 		+"writer, writerposter "
	 		+"FROM somoim_community "
	 		+"WHERE scno = #{scno}")
	 public Somoim_communityVO SomoimCommunityDetail(int scno);
	 
	 
	 // 커뮤니티 댓글
	 @Select("SELECT rno, communityno, somoimno, writerid, nickname, msg,"
		 	+"CONCAT(CONCAT(CONCAT(TO_CHAR(regdate, 'YYYY'), '년 '),"
		 	+"CONCAT(CONCAT(TO_CHAR(regdate, 'MM'), '월 '),"
		 	+"TO_CHAR(regdate, 'DD'))), '일') AS dbday "
		 	+"FROM somoim_communityReply "
		 	+"WHERE communityno = #{scno}"
		 	+"ORDER BY rno DESC")
	public List<Somoim_replyVO> SomoimCommunityReply(int scno);
	
	// 작성자 이미지 가져오기
	@Select("SELECT DISTINCT hhfinalmember.poster "
		  + "FROM hhfinalmember "
	      + "INNER JOIN somoim_communityReply ON hhfinalmember.userid = somoim_communityReply.writerid "
		  + "WHERE hhfinalmember.userid = #{writerid}")
	public String SomoimReplyPoster(String writerid);
	
	//추가
	@Insert("INSERT INTO somoim_communityReply VALUES("
		   +"scr_rno_seq.nextval,#{communityno},#{somoimno},#{writerid},#{nickname},#{msg},SYSDATE)")
	public void SomoimCommunityReplyInsert(Somoim_replyVO vo);
	  
	// 수정 
	@Update("UPDATE somoim_communityReply SET "
		   +"msg=#{msg} "
		   +"WHERE rno=#{rno}")
	public void SomoimCommunityReplyUpdate(Somoim_replyVO vo);
	// 삭제
	@Delete("DELETE FROM somoim_communityReply WHERE rno=#{rno}")
	public void SomoimCommunityReplyDelete(int rno);
	
	//=====================================================
	// 소모임 추가하기
	@Insert("INSERT INTO SOMOIM10 VALUES("
		   +"smi10_sno_seq.nextval,#{typee},#{hostname},#{hostposter},#{title},#{poster},#{inwon},#{content},#{loc},0,0)")
	public void SomoimInsertData(SomoimVO vo);
	
	
	@Select("SELECT COUNT(*) FROM SOMOIM10 "
			+"WHERE title=#{title}")
	public int SomoimTitleCheck(String title);
	
	@Select("SELECT COUNT(*) FROM SOMOIM10 "
			+"WHERE hostname=#{hostname}")
	public int SomoimMakeCheck(String hostname);
	
	//==================================================================
	
	@Select("SELECT * "
			+ "FROM (SELECT s.sno, s.typee, s.hit, s.jjim, s.hostname, s.title, s.poster, s.inwon, s.content, s.loc,"
			+ "ROW_NUMBER() OVER (ORDER BY s.sno ASC) AS num "
			+ "FROM somoim10 s "
			+ "INNER JOIN somoimjjim j ON s.sno = j.sno "
			+ "WHERE j.userId = #{userId}) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<SomoimVO> somoimJjimListData(Map map);
	
	@Select("SELECT COUNT(*) FROM somoim10 "
		   +"INNER JOIN somoimjjim ON somoim10.sno = somoimjjim.sno "
		   +"WHERE somoimjjim.userId = #{userId}")
	public int SomoimJjimCount(String userId);
	
	@Select("SELECT typee FROM somoim10 WHERE sno=#{somoimno}")
	public String somoimTypeeCheck(int somoimno);

}
