package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class YpReplyDAO {
	
	@Autowired
	private YPReplyMapper mapper;
	
	public List<YPReplyVO> ypReplyListData(int yno)
	{
		return mapper.ypReplyListData(yno);
	}
	public void ypReplyInsert(YPReplyVO vo)
	{
		mapper.ypReplyInsert(vo);
	}
	public void ypReplyUpdate(YPReplyVO vo)
	{
		mapper.ypReplyUpdate(vo);
	}
	public void ypReplyDelete(int no)
	{
		mapper.ypReplyDelete(no);
	}
	public MemberVO memberInfoData(String userId)
	{
		return mapper.memberInfoData(userId);
	}
}
