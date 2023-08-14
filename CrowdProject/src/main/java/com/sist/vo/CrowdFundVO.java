package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CrowdFundVO {
	private int wfno, fcno, cum_amount, aim_amount, achieve_rate;
	private String mainimg, fcname, tag, ftitle;
}
