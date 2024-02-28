package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
@Repository
public class NreplyDAO {
	@Autowired
	private NreplyMapper mapper;
	
	public List<NreplyVO> replyListData(int gno)
	{
		return mapper.replyListData(gno);
	}

	public void replyInsert(NreplyVO vo)
	{
		mapper.replyInsert(vo);
	}

	public void replyUpdate(NreplyVO vo)
	{
		mapper.replyUpdate(vo);
	}

	public void replyDelete(int no)
	{
		mapper.replyDelete(no);
	}
	public int replyCount(int gno)
	{
		return mapper.replyCount(gno);
	}
}
