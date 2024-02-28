package com.sist.vo;

import java.util.*;

import lombok.Data;
/*
 *  rno NUMBER,
	yno NUMBER,
	userId VARCHAR2(20),
	rDate VARCHAR2(100),
	rTime VARCHAR2(20),
	regdate DATE DEFAULT SYSDATE,
	reserve_ok NUMBER DEFAULT 0
 */
@Data
public class YpReserveVO {
	private int rno,yno,type,reserve_ok;
	   private String userId,rDate,rTime,dbday;
	   private Date regdate;
	   private SportsReserveVO rvo=new SportsReserveVO();
}
