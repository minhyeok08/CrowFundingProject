package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int wnno, hit;
	private String subject,content,writer, state,dbday,category;
	private Date regdate;
}
