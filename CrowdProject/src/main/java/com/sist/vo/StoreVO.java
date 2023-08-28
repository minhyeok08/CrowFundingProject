package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreVO {
	private String maker_email,maker_picture,maker_tel,maker_totalmoney,maker_poster,
				goods_title,scname,tag,maker_name,delivery,detail_poster,main_poster;
	private int wsno,parti_count,maker_follower,maker_supporter,price,review_count,
				jjim_count,scno,acno;
	private double score;
	private String strparti,strprice,strfollower,strsupporter,strjjim;
}
