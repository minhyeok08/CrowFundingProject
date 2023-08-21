package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.expression.spel.ast.Projection;

import com.sist.vo.*;
public interface FundMapper {
	public List<FundVO> fundListData(Map map);
	
	public FundVO fundDetailData(int wfno);
	
	public List<FundRewardVO> fundRewardList(int wfno);
	
	@Insert("INSERT INTO fundmaking(wfno,makername,makerphoto,makeremail,makertel,makerhomepage,makerinsta,makerfacebook,makertwitter,fcno,fcname,ftitle,fsubtitle,aim_amount,mainimg,openday,endday,tag,detailimg,detailcont,id) "
			+ "VALUES(fm_wfno_seq.nextval,#{makername},#{makerphoto},#{makeremail},#{makertel},#{makerhomepage},#{makerinsta},#{makerfacebook},#{makertwitter},#{fcno},#{fcname},#{ftitle},#{fsubtitle},#{aim_amount},#{mainimg},#{openday},#{endday},#{tag},#{detailimg},#{detailcont},#{id})")
	public void fundInsertData(FundVO vo);
	// 프로젝트 리스트 => 리워드 등록 안된 것.
	@Select("SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok,num "
			+ "FROM (SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok,rownum as num "
			+ "FROM (SELECT /*+ INDEX_ASC(fundmaking fm_wfno_pk)*/wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok "
			+ "FROM fundmaking WHERE id=#{id})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundVO> projectListData(Map map);
	// 프로젝트 리스트 총 페이지 수(3개씩 출력)
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM fundmaking WHERE id=#{id} AND rewardok=0")
	public int projectrewardnoTotalpage(String id);
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM fundmaking WHERE id=#{id} AND rewardok=1")
	public int projectrewardOkTotalpage(String id);
	// 프로젝트 상세=> 리워드 등록 안된 거 => 리워드 등록이 필요함 
	@Select("SELECT wfno,mainimg,detailimg,detailcont,fcname,tag,ftitle,fsubtitle,aim_amount,"
			+ "makername,makerphoto,makeremail,makertel,makerhomepage,makerinsta,makerfacebook,makertwitter "
			+ "FROM fundmaking "
			+ "WHERE wfno=#{wfno}")
	public FundVO projectDetailData(int wfno);
	
	/*
	    RNO      NOT NULL NUMBER         
		RPRICE            NUMBER         
		RNAME    NOT NULL VARCHAR2(1000) 
		RCONT    NOT NULL CLOB           
		DELFEE            NUMBER         
		DELSTART          VARCHAR2(1000) 
		LIMITQ            NUMBER         
		CURQ              NUMBER         
		WFNO              NUMBER     
	 */
	//리워드 등록
	@Update("UPDATE fundmaking SET rewardOk=1 WHERE wfno=#{wfno}")
	public void project_rewardOk(int wfno);
	
	@Insert("INSERT INTO rewardmaking (rno,rname,rprice,rcont,delfee,delstart,limitq,wfno) "
			+ "VALUES(rem_rno_seq.nextval,#{rname},#{rprice},#{rcont},#{delfee},#{delstart},#{limitq},#{wfno})")
	public void rewardInsertData(RewardVO vo);
	@Select("SELECT rno,rname,rprice,rcont,delfee,delstart,limitq FROM rewardmaking WHERE wfno=#{wfno}")
	public List<RewardVO> rewardListData(int wfno);
}
