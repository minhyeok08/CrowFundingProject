package com.sist.vo;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

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

	// profile용
	private int mpno;
	private long profile_size;
	private String profile_name,profile_content_type,profile_url;
	
	@JsonIgnore
	private MultipartFile image;
}