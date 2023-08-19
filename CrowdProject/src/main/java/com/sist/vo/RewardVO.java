package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
RNO      NOT NULL NUMBER         
RPRICE            NUMBER         
RNAME    NOT NULL VARCHAR2(1000) 
RCONT    NOT NULL CLOB           
DELFEE            NUMBER         
DELSTART          VARCHAR2(1000) 
LIMITQ            NUMBER         
CURQ              NUMBER         
WFNO              NUMBER     
 */
@Getter
@Setter
public class RewardVO {
	private int rno,rprice,delfee,limitq,curq,wfno;
	private String rname,rcont,delstart;
}
