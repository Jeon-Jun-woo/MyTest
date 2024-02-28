package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.MemberVO;
import com.sist.vo.YPReplyVO;

public interface YPReplyMapper {
	    // 목록
		@Select("SELECT no, yno, userId, userName, msg, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') as dbday "
				+ "FROM projectYPReply "
				+ "WHERE yno=#{yno} "
				+ "ORDER BY no DESC")
		public List<YPReplyVO> ypReplyListData(int yno);
			
		// 추가
		@Insert("INSERT INTO projectYPReply(no, yno, userId, userName, msg) "
				+ "VALUES(ypr_no_seq.nextval, #{yno}, #{userId}, #{userName}, #{msg})")
		public void ypReplyInsert(YPReplyVO vo);
			
		// 수정
		@Update("UPDATE projectYPReply SET "
				+ "msg=#{msg} "
				+ "WHERE no=#{no}")
		public void ypReplyUpdate(YPReplyVO vo);
			
		// 삭제
		@Delete("DELETE FROM projectYPReply "
				+ "WHERE no=#{no}")
		public void ypReplyDelete(int no);
		
		// 사용자 정보 읽기
		@Select("SELECT userId, userName FROM hhfinalMember "
				+ "WHERE userId=#{userId}")
		public MemberVO memberInfoData(String userId);
}
