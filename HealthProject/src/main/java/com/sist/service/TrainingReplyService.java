package com.sist.service;
import java.util.*;
import com.sist.vo.*;
public interface TrainingReplyService {
	public List<TrainReplyVO> replyListData(int tno);
	public void replyInsert(TrainReplyVO vo);
	public void replyUpdate(TrainReplyVO vo);
	public void replyDelete(int no);
	public MemberVO memberInfoData(String userId);
	
}
