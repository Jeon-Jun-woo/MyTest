package com.sist.vo;
/*
SCNO                                      NOT NULL NUMBER
SOMOIMNO                                           NUMBER
POSTER                                             VARCHAR2(1000)
CONTENT                                            CLOB
REGDATE                                            DATE
WRITER                                             VARCHAR2(100)
WRITERPOSTER                                       VARCHAR2(1000)
*/

import java.util.Date;

import lombok.Data;

@Data
public class Somoim_communityVO {
	private int scno,comunnityno,somoimno;
	private String poster,content,writer,writerposter,dbday;
	private Date regdate;
}
