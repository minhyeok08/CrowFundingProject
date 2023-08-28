package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminqnaVO {
	private int waqno;
	private String id, content,dbday, name, nickname, profile_url,admin;
	private Date regdate;
}
