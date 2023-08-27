package com.sist.vo;
/*
QNO        NOT NULL NUMBER         
WFNO                NUMBER         
ID                  VARCHAR2(51)   
SUBJECT    NOT NULL VARCHAR2(1000) 
CONTENT    NOT NULL CLOB           
REGDATE             DATE           
GROUP_STEP          NUMBER         
GROUP_ID            NUMBER         
GROUP_TAB           NUMBER         
ISREPLY             NUMBER  
 */
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class QnAVO {
	private int qno,wfno,group_step,group_id,group_tab,isreply;
	private String id,subject,content,dbday;
	private Date regdate;
	
}
