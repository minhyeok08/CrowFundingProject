package com.sist.vo;

import lombok.Getter;

import lombok.Setter;
import java.util.*;
@Getter
@Setter
public class BuyVO {
	private int bino,acno,wfno,wsno,tprice,gcount,rno,rprice,delfee,usepoint,totalPrice,
	fcount,scount,cucount;
	private String name,poster,rname,idopen,priceopen,
				id,rcont,delstart,myday,fcname,makername,fundStatus,msg,mainimg;
	private Date regdate,endday;
	private Boolean usePoints;
}
