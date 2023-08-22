package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminqnaVO {
	private int waqno,filecount;
	private String id,subject, content,dbday,filename,filesize,state;
	private Date regdate;
}
