package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CrowdStoreVO {
	private int wsno, price;
	private String main_poster, goods_title, maker_name;
	private double score;
}
