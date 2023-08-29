package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminTotalVO {
	private int buy_info_count,member_count,admin_qna_count,fund_review_count,fund_count;
	private String dbday;
	private Date regdate;
}
