package com.sist.vo;

/*
	pno NUMBER,
	id varchar2(100),
	profile_img_path VARCHAR2(300),
	img_name varchar2(255),
	img_size varchar2(45),
*/
import java.util.*;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ProfileVO {
	private int pno;
    private String id;
    private String profile_img_path;
    private String img_name;
    private String img_size;
}
