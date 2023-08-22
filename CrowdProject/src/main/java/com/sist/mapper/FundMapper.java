package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.expression.spel.ast.Projection;

import com.sist.vo.*;
public interface FundMapper {
	public List<FundVO> fundListData(Map map);
	
	public FundVO fundDetailData(int wfno);
	
	public List<FundRewardVO> fundRewardList(int wfno);
	
	@Select("SELECT * FROM wadiz_funding_reward "
			+ "WHERE rno=#{rno}")
	public FundRewardVO fundBuyData(int rno);
	
	@Insert("INSERT INTO fundmaking(wfno,makername,makerphoto,makeremail,makertel,makerhomepage,makerinsta,makerfacebook,makertwitter,fcno,fcname,ftitle,fsubtitle,aim_amount,mainimg,openday,endday,tag,detailimg,detailcont,id) "
			+ "VALUES(fm_wfno_seq.nextval,#{makername},#{makerphoto},#{makeremail},#{makertel},#{makerhomepage},#{makerinsta},#{makerfacebook},#{makertwitter},#{fcno},#{fcname},#{ftitle},#{fsubtitle},#{aim_amount},#{mainimg},#{openday},#{endday},#{tag},#{detailimg},#{detailcont},#{id})")
	public void fundInsertData(FundVO vo);
	// 프로젝트 리스트 => 리워드 등록 안된 것.
	@Select("SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok,num "
			+ "FROM (SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok,rownum as num "
			+ "FROM (SELECT /*+ INDEX_ASC(fundmaking fm_wfno_pk)*/wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok "
			+ "FROM fundmaking WHERE id=#{id} AND rewardok=0)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundVO> projectListDataForReward(Map map);
	// 프로젝트 리스트 => 리워드 등록 된 것.
	@Select("SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok,num "
			+ "FROM (SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok,rownum as num "
			+ "FROM (SELECT /*+ INDEX_ASC(fundmaking fm_wfno_pk)*/wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok "
			+ "FROM fundmaking WHERE id=#{id} AND rewardok=1)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundVO> projectListData(Map map);
	// 프로젝트 리스트 총 페이지 수(3개씩 출력)
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM fundmaking WHERE id=#{id} AND rewardok=0")
	public int projectrewardnoTotalpage(String id);
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM fundmaking WHERE id=#{id} AND rewardok=1")
	public int projectrewardOkTotalpage(String id);
	// 프로젝트 상세=> 리워드 등록 안된 거 => 리워드 등록이 필요함 
	@Select("SELECT wfno,mainimg,detailimg,detailcont,fcno,fcname,tag,ftitle,fsubtitle,aim_amount,"
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
	@Update("UPDATE fundmaking SET makername=#{makername},makerphoto=#{makerphoto},makeremail=#{makeremail},makertel=#{makertel},makerhomepage=#{makerhomepage},makerinsta=#{makerinsta},makerfacebook=#{makerfacebook},makertwitter=#{makertwitter},fcno=#{fcno},fcname=#{fcname},ftitle=#{ftitle},fsubtitle=#{fsubtitle},aim_amount=#{aim_amount},mainimg=#{mainimg},openday=#{openday},endday=#{endday},tag=#{tag},detailimg=#{detailimg},detailcont=#{detailcont} WHERE wfno=#{wfno}")
	public void project_update(FundVO vo);
	@Select("SELECT wfno,rname,rprice,rcont,delfee,delstart,limitq FROM rewardmaking WHERE rno=#{rno}")
	public RewardVO reward_detail(int rno);
	@Update("UPDATE rewardmaking SET rname=#{rname},rprice=#{rprice},rcont=#{rcont},delfee=#{delfee},delstart=#{delstart},limitq=#{limitq} WHERE rno=#{rno}")
	public void reward_update_ok(RewardVO vo);
	@Delete("DELETE FROM rewardmaking WHERE rno=#{rno}")
	public void reward_delete(int rno);
	// 새소식 등록을 위한 프로젝트 리스트 출력
	@Select("SELECT wfno,ftitle FROM fundmaking WHERE id=#{id} AND rewardOk=1")
	public List<FundVO> project_list_for_news(String id);
	/*
	NO        NOT NULL NUMBER         
	WFNO               NUMBER         
	TNO                NUMBER         
	SUBJECT            VARCHAR2(1000) 
	CONTENT            CLOB           
	REGDATE            DATE           
	HIT                NUMBER         
	FILENAME           VARCHAR2(1000) 
	FILESIZE           VARCHAR2(1000) 
	FILECOUNT          NUMBER
	ID 				   VARCHAR2(100)     
	 */

	@Insert("INSERT INTO newstable VALUES("
			+ "news_no_seq.nextval,#{wfno},#{tno},#{subject},#{content},SYSDATE,0,#{filename},#{filecount},#{filesize},#{id})")
	public void news_insert(NewsVO vo);
	
	//새소식 리스트 출력
	@Select("SELECT no,tno,subject,(SELECT ftitle FROM fundmaking WHERE wfno=aa.wfno) as ftitle,TO_CHAR(regdate,'YYYY-MM-DD') as dbday, hit,num "
			+ "FROM (SELECT no,tno,subject,wfno,regdate,hit,rownum as num "
			+ "FROM (SELECT no,tno,subject,wfno,regdate,hit "
			+ "FROM newstable WHERE id=#{id} ORDER BY no DESC)) aa "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NewsVO> makerNewsListData(Map map);
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM newstable WHERE id=#{id}")
	public int makerNewsTotalPage(String id); 
	@Select("SELECT no,tno,subject,(SELECT ftitle FROM fundmaking WHERE wfno=aa.wfno) as ftitle,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,"
			+ "filename,filesize,filecount "
			+ "FROM newstable aa WHERE no=#{no}")
	public NewsVO makerNewsDetailData(int no);
}
