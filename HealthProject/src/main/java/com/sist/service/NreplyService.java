package com.sist.service;

import java.util.List;

import com.sist.vo.NreplyVO;

public interface NreplyService {
	public List<NreplyVO> replyListData(int gno);
	public void replyInsert(NreplyVO vo);

	public void replyUpdate(NreplyVO vo);

	public void replyDelete(int no);
	public int replyCount(int gno);

}
