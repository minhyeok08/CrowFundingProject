package com.sist.vo;
import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
/*
WFNO          NOT NULL NUMBER         
MAINIMG                VARCHAR2(3000) 
FCNAME                 VARCHAR2(51)   
FCNO                   NUMBER         
TAG                    VARCHAR2(51)   
FTITLE                 VARCHAR2(2000) 
FSUBTITLE              VARCHAR2(2000) 
PARTI_COUNT            NUMBER         
OPENDAY                DATE           
ENDDAY                 DATE           
CUM_AMOUNT             NUMBER         
AIM_AMOUNT             NUMBER         
ACHIEVE_RATE           NUMBER         
JJIM                   NUMBER         
SUPPORT                NUMBER         
DETAILIMG              CLOB           
DETAILCONT             CLOB           
MAKERNAME              VARCHAR2(1000) 
MAKERPHOTO             VARCHAR2(3000) 
MAKEREMAIL             VARCHAR2(2000) 
MAKERTEL               VARCHAR2(100)  
MAKERHOMEPAGE          VARCHAR2(1000) 
MAKERINSTA             VARCHAR2(2000) 
MAKERFACEBOOK          VARCHAR2(2000) 
MAKERTWITTER           VARCHAR2(2000) 
ACNO                   NUMBER         
REWARDOK               NUMBER         
ID                     VARCHAR2(30) 
 */
public class FundVO {
	private int wfno,fcno,parti_count,cum_amount,aim_amount,achieve_rate,jjim,support,acno;
	private String makertwitter,makerfacebook,makerinsta,makerhomepage,makertel,
	makeremail,makerphoto,makername,detailimg,fsubtitle,ftitle,tag,fcname,mainimg,link;
	
	private Date openday, endday;
	
	private List<String> detailimgList;
	//private int rno,rprice,delfee,limitq,curq;
	//private String rname,rcont,delstart;
	
	
	// 태준 추가 내용
	private String stropenday,strendday,detailcont;
	private List<MultipartFile> files;
	private int rewardok;
	private String id;
}
