package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class MemberVO {
	private int mno, pwd;
	private String id, email, name, intro, phone, dbday;
	private Date regdate;
}
