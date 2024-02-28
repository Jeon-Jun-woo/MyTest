package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import com.sist.vo.*;
@Repository
public class TrainingReplyDAO {
	@Autowired
	private TrainingReplyMapper mapper;
	
	public List<TrainReplyVO> replyListData(int tno)
	{
		return mapper.replyListData(tno);
	}
	public void replyInsert(TrainReplyVO vo)
	{
		mapper.replyInsert(vo);
	}
	public void replyUpdate(TrainReplyVO vo)
	{
		mapper.replyUpdate(vo);
	}
	public void replyDelete(int no)
	{
		mapper.replyDelete(no);
	}
	public MemberVO memberInfoData(String userId)
	{
		return mapper.memberInfoData(userId);
	}
}
