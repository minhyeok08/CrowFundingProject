package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CuponVO {
	private int cpno,mcpno,discount,category;
	private String title,id;
	private Date regdate,startday,endday;
}
