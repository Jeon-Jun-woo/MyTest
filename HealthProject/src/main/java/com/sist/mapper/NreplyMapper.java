package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface NreplyMapper {
	// 목록 
	  @Select("SELECT no,gno,userId,userName,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday "
			 +"FROM goodsnReply "
			 +"WHERE gno=#{gno} "
			 +"ORDER BY no DESC")
	  public List<NreplyVO> replyListData(int gno);
	  // 추가 
	  @Insert("INSERT INTO goodsnReply(no,gno,userId,userName,msg) "
			 +"VALUES(gnr_no_seq.nextval,#{gno},#{userId},#{userName},#{msg})")
	  public void replyInsert(NreplyVO vo);
	  // 수정 
	  @Update("UPDATE goodsnReply SET "
			 +"msg=#{msg} "
			 +"WHERE no=#{no}")
	  public void replyUpdate(NreplyVO vo);
	  // 삭제 
	  @Delete("DELETE FROM goodsnReply "
			 +"WHERE no=#{no}")
	  public void replyDelete(int no);
	  
	  @Select("SELECT COUNT(*) FROM goodsnReply "
			  +"WHERE gno=#{gno}")
	  public int replyCount(int gno);
}
