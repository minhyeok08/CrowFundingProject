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

	// 펀딩 상품 hit수 증가
	@Update("UPDATE wadiz_fund_detail SET "
			+ "hit = hit+1 "
			+ "WHERE wfno=#{wfno}")
	public void fundhitIncrement(int wfno);
	
	// 사용자 펀딩 취향분석용 테이블 insert/update문
	public void fundTasteInsert(Map map);
	
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
//	@Select("SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok,num "
//			+ "FROM (SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok,rownum as num "
//			+ "FROM (SELECT /*+ INDEX_ASC(fundmaking fm_wfno_pk)*/wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok "
//			+ "FROM fundmaking WHERE id=#{id} AND rewardok=1)) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundVO> projectListData(Map map);
	// 프로젝트 리스트 총 페이지 수(3개씩 출력)
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM fundmaking WHERE id=#{id} AND rewardok=0")
	public int projectrewardnoTotalpage(String id);
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM fundmaking WHERE rewardok=1 AND acno=#{acno} AND id=#{id}")
	public int projectrewardOkTotalpage(Map map);
	@Select("SELECT CEIL(COUNT(*)/4.0) FROM fundmaking WHERE rewardok=1 AND acno=#{acno} AND id=#{id}")
	public int makerpagehomeprojectTotalpage(Map map);
	// 프로젝트 상세=> 리워드 등록 안된 거 => 리워드 등록이 필요함 
	@Select("SELECT * FROM fundmaking WHERE wfno=#{wfno}")
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
	@Update("UPDATE fundmaking SET rewardOk=1,acno = CASE WHEN openday <= SYSDATE THEN 1 ELSE 3 END WHERE wfno=#{wfno}")
	public void project_rewardOk(int wfno); // 리워드가 등록되면 rewardOk를 1로 바꾸고, 개시일 openday가 현 시스템 날짜보다 이전이면 1(오픈된 상품)으로 변경
	
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
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM newstable WHERE id=#{id}")
	public int makerNewsTotalPage(String id); 
	@Select("SELECT no,tno,subject,(SELECT ftitle FROM fundmaking WHERE wfno=aa.wfno) as ftitle,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,"
			+ "filename,filesize,filecount "
			+ "FROM newstable aa WHERE no=#{no}")
	public NewsVO makerNewsDetailData(int no);
	@Update("UPDATE newstable SET subject=#{subject},content=#{content},filename=#{filename},filecount=#{filecount},filesize=#{filesize} WHERE no=#{no}")
	public void makerNewsUpdate(NewsVO vo);
	// 새소식 삭제
	@Select("SELECT filename,filecount FROM newstable "
			+ "WHERE no=#{no}")
	public NewsVO newstableFileInfoData(int no);
	@Delete("DELETE FROM newstable WHERE no=#{no}")
	public void maker_news_delete(int no);
	// 프로젝트 만들기(리워드 없는) 삭제
	@Select("SELECT mainimg,makerphoto,detailimg FROM fundmaking WHERE wfno=#{wfno}")
	public FundVO project_for_rewardFileInfoData(int wfno);
	@Delete("DELETE FROM fundmaking WHERE wfno=#{wfno}")
	public void project_for_rewardDelete(int wfno);
	
}
