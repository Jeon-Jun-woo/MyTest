package com.sist.vo;

import lombok.Data;

/* 
 *      ENO     NOT NULL NUMBER        
		NAME             VARCHAR2(500) 
		TIME             VARCHAR2(500) 
		CAL              VARCHAR2(50)  
		EFFECTS          CLOB
 */
@Data
public class ExerCalVO {
	private int eno;
	private String name,time,cal,effects;
}
