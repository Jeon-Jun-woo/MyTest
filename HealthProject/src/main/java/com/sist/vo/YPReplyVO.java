package com.sist.vo;

import java.util.*;

import lombok.Data;

// 요가 필라테스 업체 상세 페이지 댓글
@Data
public class YPReplyVO {
	private int no,yno;
	private String userId,userName,msg,dbday;
	private Date regdate;
}
