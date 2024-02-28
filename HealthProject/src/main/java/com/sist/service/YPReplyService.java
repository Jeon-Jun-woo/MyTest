package com.sist.service;

import java.util.*;
import com.sist.vo.*;

public interface YPReplyService {
	public List<YPReplyVO> ypReplyListData(int yno);
	public void ypReplyInsert(YPReplyVO vo);
	public void ypReplyUpdate(YPReplyVO vo);
	public void ypReplyDelete(int no);
	public MemberVO memberInfoData(String userId);
}
