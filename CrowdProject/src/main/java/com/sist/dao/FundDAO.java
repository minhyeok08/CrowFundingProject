package com.sist.dao;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class FundDAO {
	@Autowired
	private FundMapper mapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private NoticeMapper nmapper;
	
	public List<FundVO> fundListData(Map map)
	{
		return mapper.fundListData(map);
	}
	
	public List<FundVO> openListData(Map map)
	{
		return mapper.openListData(map);
	}
	
	
	public FundVO fundDetailData(int wfno)
	{
		return mapper.fundDetailData(wfno);
	}
	
	public void fundhitIncrement(int wfno) {
		mapper.fundhitIncrement(wfno);
	}
	
	public void fundTasteInsert(Map map) {
		mapper.fundTasteInsert(map);
	}
	
	public List<FundRewardVO> fundRewardList(int wfno)
	{
		return mapper.fundRewardList(wfno);
	}
	
	//@Select("SELECT wmp.profile_url , wmp.profile_name wbi.id , wbi.wfno, wbi.tprice FROM WADIZ_MEMBER_PROFILE wmp , WADIZ_BUY_INFO wbi "
		//		+ "WHERE wbi.wfno=#{wfno} AND wmp.id=wbi.id ORDER BY regdate desc")
		public List<SupVO> SupListData(int wfno)
		{
			return mapper.SupListData(wfno);
		}
		
		// 뉴스 데이터 리스트 출력
		//@Select("SELECT * FROM NewsTable WHERE id=#{id} AND wfno=#{wfno}")
		public List<NewsVO> NewsDataList(int wfno)
		{
			return mapper.NewsDataList(wfno);
		}
		
		@Select("SELECT (COUNT(*)) FROM NewsTable WHERE wfno=#{wfno} ORDER BY regdate DESC")
		public int NewsDataCount(int wfno)
		{
			return mapper.NewsDataCount(wfno);
		}
		
		@Select("SELECT * FROM NewsTable WHERE no=#{no} ORDER BY regdate DESC")
		public NewsVO NewsDetail(int no)
		{
			return mapper.NewsDetail(no);
		}
		
	//@Insert("INSERT INTO fundmaking(wfno,makername,makerphoto,makeremail,makertel,makerhompage,makerinsta,makerfacebook,makertwitter,fcno,fcname,ftitle,aim_amount,mainimg,openday,endday,tag,detailimg,detailcont) "
	//		+ "VALUSE(fm_wfno_seq.nextval,#{makername},#{makerphoto},#{makeremail},#{makertel},#{makerhompage},#{makerinsta},#{makerfacebook},#{makertwitter},#{fcno},#{fcname},#{ftitle},#{aim_amount},#{mainimg},#{openday},#{endday},#{tag},#{detailimg},#{detailcont})")
	public void fundInsertData(FundVO vo)
	{
		mapper.fundInsertData(vo);
	}
	//@Select("SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok,num "
	//		+ "FROM (SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok,rownum as num "
	//		+ "FROM (SELECT /*+ INDEX_ASC(fundmaking fm_wfno_pk)*/wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,id,rewardok "
	//		+ "FROM fundmaking WHERE id=#{id} AND rewardok=0)) "
	//		+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundVO> projectListDataForReward(Map map)
	{
		return mapper.projectListDataForReward(map);
	}
	//@Select("SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,num "
	//		+ "FROM (SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,rownum as num "
	//		+ "FROM (SELECT /*+ INDEX_ASC(fundmaking fm_wfno_pk)*/wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername "
	//		+ "FROM fundmaking WHERE id=#{id} AND rewardok=1)) "
	//		+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundVO> projectListData(Map map)
	{
		return mapper.projectListData(map);
	}
	// 리워드 등록 안된거
	//@Select("SELECT CEIL(COUNT(*)/6.0) FROM fundmaking WHERE id=#{id} AND rewardok=0")
	public int projectrewardnoTotalpage(String id)
	{
		return mapper.projectrewardnoTotalpage(id);
	}
	// 리워드 등록 된거
	public int projectrewardOkTotalpage(Map map)
	{
		return mapper.projectrewardOkTotalpage(map);
	}
	
	//리워드 등록 안된거
	//@Select("SELECT wfno,mainimg,detailimg,detailcont,fcname,tag,ftitle,fsubtitle,aim_amount FROM fundmaking WHERE wfno=#{wfno}")
	public FundVO projectDetailData(int wfno)
	{
		return mapper.projectDetailData(wfno);
	}
	
	// 리워드 등록
//	@Update("UPDATE fundmaking SET rewardOk=1 WHERE wfno=#{wfno}")
	public void project_rewardOk(int wfno) 
	{
		mapper.project_rewardOk(wfno);		
	}
	
//	@Insert("INSERT INTO (rno,rname,rprice,rcont,delfee,delstart,limitq,wfno) "
//			+ "VALUES(rem_rno_seq.nextval,#{rname},#{rprice},#{rcont},#{delfee},#{delstart},#{limitq},#{wfno})")
	public void rewardInsertData(RewardVO vo)
	{
		mapper.rewardInsertData(vo);
	}
	// 리워드 출력
//	@Select("SELECT rno,rprice,rcont,delfee,delstart,limitq FROM rewardmaking WHERE wfno=#{wfno}")
	public List<RewardVO> rewardListData(int wfno)
	{
		return mapper.rewardListData(wfno);
	}
//	@Update("UPDATE fundmaking SET makername=#{makername},makerphoto=#{makerphoto},makeremail=#{makeremail},makertel=#{makertel},makerhomepage=#{makerhomepage},makerinsta=#{makerinsta},makerfacebook=#{makerfacebook},makertwitter=#{makertwitter},fcno=#{fcno},fcname=#{fcname},ftitle=#{ftitle},fsubtitle=#{fsubtitle},aim_amount=#{aim_amount},mainimg=#{mainimg},openday=#{openday},endday=#{endday},tag=#{tag},detailimg=#{detailimg},detailcont=#{detailcont} WHERE wfno=#{wfno}")
	public void project_update(FundVO vo)
	{
		mapper.project_update(vo);
	}
	//리워드 상세정보
//	@Select("SELECT rname,rprice,rcont,delfee,delstart,limiq FROM rewardmaking WHERE rno=#{rno}")
	public RewardVO reward_detail(int rno)
	{
		return mapper.reward_detail(rno);
	}
//	@Update("UPDATE rewardmaking SET rname=#{rname},rprice=#{rprice},rcont=#{rcont},delfee=#{delfee},delstart=#{delstart},limitq=#{limitq} WHERE rno=#{rno}")
	public void reward_update_ok(RewardVO vo)
	{
		mapper.reward_update_ok(vo);
	}
//	@Delete("DELETE FROM rewardmaking WHERE rno=#{rno}")
	public void reward_delete(int rno)
	{
		mapper.reward_delete(rno);
	}
	// 새소식 등록을 위한 프로젝트 리스트 출력
//	@Select("SELECT wfno,ftitle FROM fundmaking WHERE id=#{id} AND rewardOk=1")
	public List<FundVO> project_list_for_news(String id)
	{
		return mapper.project_list_for_news(id);
	}
	// 고객 문의 리스트를 프로젝트별로 출력하기 위한 프로젝트 리스트 출력
//	@Select("SELECT wfno,ftitle FROM wadiz_fund_detail WHERE id=#{id} AND rewardOk=1 AND acno=1 ORDER BY regdate ASC")
	public List<FundVO> project_list_for_qna(String id)
	{
		return mapper.project_list_for_qna(id);
	}
//	@Insert("INSERT INTO newstable VALUES("
//			+ "news_no_seq.nextval,#{wfno},#{tno},#{subject},#{content},SYSDATE,0,#{filename},#{filecount},#{filesize})")
	public void news_insert(NewsVO vo)
	{
		mapper.news_insert(vo);
	}
//	@Select("SELECT no,tno,subject,(SELECT ftitle FROM fundmaking WHERE wfno=newstable.wfno) as ftitle,TO_CHAR(regdate,'YYYY-MM-DD') as dbday, hit,num "
//			+ "FROM (SELECT no,tno,subject,wfno,regdate,hit,rownum as num "
//			+ "FROM (SELECT no,tno,subject,wfno,regdate,hit "
//			+ "FROM newstable WHERE id=#{id} ORDER BY no DESC)) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NewsVO> makerNewsListData(Map map)
	{
		return mapper.makerNewsListData(map);
	}
//	@Select("SELECT CEIL(COUNT(*)/10.0) FROM newstable WHERE id=#{id}")
	public int makerNewsTotalPage(String id)
	{
		return mapper.makerNewsTotalPage(id);
	}
	//@Select("SELECT no,tno,subject,(SELECT ftitle FROM fundmaking WHERE wfno=aa.wfno) as ftitle,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,"
	//		+ "filename,filesize,filecount "
	//		+ "FROM newstable aa WHERE no=#{no}")
	public NewsVO makerNewsDetailData(int no)
	{
		return mapper.makerNewsDetailData(no);
	}
	
	/*@Select("SELECT * FROM wadiz_funding_reward "
			+ "WHERE rno=#{rno}")*/
	public FundRewardVO fundBuyData(int rno)
	{
		return mapper.fundBuyData(rno);
	}
//	@Update("UPDATE newstable SET subject=#{subject},content=#{content},filename=#{filename},filecount=#{filecount},filesize=#{filesize} WHERE no=#{no}")
	public void makerNewsUpdate(NewsVO vo)
	{
		mapper.makerNewsUpdate(vo);
	}
//	@Select("SELECT filename,filecount FROM newstable "
//			+ "WHERE no=#{no}")
	public NewsVO newstableFileInfoData(int no)
	{
		return mapper.newstableFileInfoData(no);
	}
//	@Delete("DELETE FROM newstable WHERE no=#{no}")
	public void maker_news_delete(int no)
	{
		mapper.maker_news_delete(no);
	}
	// 프로젝트 만들기 삭제(리워드 등록 안된)
//	@Select("SELECT mainimg,makerphoto,detailimg FROM fundmaking WHERE wfno=#{wfno}")
	public FundVO projectFileInfoData(int wfno)
	{
		return mapper.projectFileInfoData(wfno);
	}
//	@Delete("DELECT FROM fundmaking WHERE wfno=#{wfno}")
	public void projectDelete(int wfno)
	{
		mapper.projectDelete(wfno);
	}
//	@Select("SELECT CEIL(COUNT(*)/4.0) FROM fundmaking WHERE rewardok=1 AND acno=#{acno} AND id=#{id}")
	public int makerpagehomeprojectTotalpage(Map map)
	{
		return mapper.makerpagehomeprojectTotalpage(map);
	}
	public List<NewsVO> newsFindListData(Map map)
	{
		return mapper.newsFindListData(map);
	}
	public int newsFindListTotalPage(Map map) {
		return mapper.newsFindListTotalPage(map);
	}
	@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public Boolean projectDeleteAll(String id, String pwd, int wfno)
	{
		Boolean bCheck = false;
		String db_pwd = mapper.passwordCheck(id);
		if(encoder.matches(pwd, db_pwd)) 
		{
			bCheck=true;
			mapper.reward_delete(wfno);
			mapper.newsDelete(wfno);
			mapper.reviewDelete(wfno);
			mapper.rankDelete(wfno);
			mapper.buyInfoDelete(wfno);
			mapper.qnaListDelete(wfno);
			mapper.projectDeleteAll(wfno);
		}
		return bCheck;
	}
	
	// 찜하기
	public void fundJjimInsert(Map map) {
		mapper.fundJjimInsert(map);
	}
	
	public int fundJjimCount(Map map) {
		return mapper.fundJjimCount(map);
	}
	
	public void fundJjimCancel(Map map) {
		mapper.fundJjimCancel(map);
	}
//	@Select("SELECT * FROM (SELECT ftitle,cum_amount FROM wadiz_fund_detail WHERE id=#{id} ORDER BY cum_amount DESC) WHERE rownum<=5")
	public List<FundVO> cum_amount_Top5(String id)
	{
		return mapper.cum_amount_Top5(id);
	}
	
	//@Update("UPDATE wadiz_fund_detail SET "
	//		+ "support = support+1 "
	//		+ "WHERE wfno=#{wfno}")
	public void fundSupIncrement(int wfno)
	{
		nmapper.fundSupIncrement(wfno);
	}
	
	
}
