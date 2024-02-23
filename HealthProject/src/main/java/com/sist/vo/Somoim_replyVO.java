package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*
RNO                                       NOT NULL NUMBER
COMMUNITYNO                                        NUMBER
SOMOIMNO                                           NUMBER
WRITERID                                           VARCHAR2(100)
WRITERPOSTER                                       VARCHAR2(200)
NICKNAME                                           VARCHAR2(100)
MSG                                                CLOB
REGDATE                                            DATE
*/
@Data
public class Somoim_replyVO {
	private int rno,communityno,somoimno,scno;
	private String writerid,nickname,msg,dbday;
	private Date regdate;
}
