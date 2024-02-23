package com.sist.vo;
/*
	SSDNO                                     NOT NULL NUMBER
	SOMOIM                                             VARCHAR2(100)
	TITLE                                              VARCHAR2(200)
	REGDATE                                            VARCHAR2(100)
	TIMEE                                              VARCHAR2(100)
	LOC                                                VARCHAR2(100)
	MONEY                                              NUMBER
	INWON                                              VARCHAR2(100)
	CONTENT                                            CLOB
*/

import java.util.Date;

import lombok.Data;

@Data
public class Somoim_scheduleVO {
	private int ssdno,money,hit,somoimno,scheduleno;
	private String somoim,title,regdate,timee,loc,inwon,content,poster,writer,writerimage;
}
