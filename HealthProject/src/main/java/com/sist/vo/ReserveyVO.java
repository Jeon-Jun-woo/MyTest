package com.sist.vo;

import java.util.Date;

import lombok.Data;
@Data
public class ReserveyVO {
	private int rno,yno,reserve_ok;
	private String userId,rDate,rTime,rInwon,dbday;
	private Date regdate;
	private YakgookVO yvo=new YakgookVO(); //조인
}
