package com.sist.vo;

import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private int point;
	private String id,pwd,name,nickname,sex,birthday,email,post,
					addr1,addr2,phone,content,admin,dbday,msg;
	private Date regdate;
	private String authKey;
	private int authStatus;
}
