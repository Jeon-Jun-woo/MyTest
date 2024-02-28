package com.sist.vo;

import java.util.Date;

import lombok.Data;
@Data
public class NreplyVO {
	private int no,gno;
	  private String userId,userName,msg,dbday;
	  private Date regdate;
}
