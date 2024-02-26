package com.sist.vo;

import lombok.Data;

/*
 *  FNO  NOT NULL NUMBER        
	NAME          VARCHAR2(100) 
	UNIT          VARCHAR2(200) 
	CAL           VARCHAR2(100) 
	NUT           VARCHAR2(500) 
	EXER          CLOB
 */
@Data
public class FoodCalVO {
	private int fno;
	private String name,unit,cal,nut,exer;
}
