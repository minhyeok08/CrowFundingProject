package com.sist.vo;
/*
NO        NOT NULL NUMBER         
WFNO               NUMBER         
TNO                NUMBER         
SUBJECT            VARCHAR2(1000) 
CONTENT            CLOB           
REGDATE            DATE           
HIT                NUMBER         
FILENAME           VARCHAR2(1000) 
FILESIZE           VARCHAR2(1000) 
FILECOUNT          NUMBER     
 */

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class NewsVO {
	private int no,wfno,tno,hit,filecount;
	private String subject,content,filename,filesize,dbday,strRegdate;
	private Date regdate;
	private List<MultipartFile> fundfiles;
	private String ftitle,id,tname;
}
