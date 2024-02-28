package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import java.util.*;
import com.sist.vo.*;
public interface TrainingReplyMapper {
	@Select("SELECT no,tno,userId,userName,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday "
			 +"FROM projectTrainReply "
			 +"WHERE tno=#{tno} "
			 +"ORDER BY no DESC")
	  public List<TrainReplyVO> replyListData(int tno);
	  // 추가 
	  @Insert("INSERT INTO projectTrainReply(no,tno,userId,userName,msg) "
			 +"VALUES(prt_no_seq.nextval,#{tno},#{userId},#{userName},#{msg})")
	  public void replyInsert(TrainReplyVO vo);
	  // 수정 
	  @Update("UPDATE projectTrainReply SET "
			 +"msg=#{msg} "
			 +"WHERE no=#{no}")
	  public void replyUpdate(TrainReplyVO vo);
	  // 삭제 
	  @Delete("DELETE FROM projectTrainReply "
			 +"WHERE no=#{no}")
	  public void replyDelete(int no);
	  
	// 사용자 정보 읽기
		@Select("SELECT userId, userName FROM hhfinalMember "
				+ "WHERE userId=#{userId}")
		public MemberVO memberInfoData(String userId);
}

