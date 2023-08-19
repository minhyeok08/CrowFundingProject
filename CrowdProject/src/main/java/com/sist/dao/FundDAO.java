package com.sist.dao;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FundDAO {
	@Autowired
	private FundMapper mapper;
	
	public List<FundVO> fundListData(Map map)
	{
		return mapper.fundListData(map);
	}
	//@Insert("INSERT INTO fundmaking(wfno,makername,makerphoto,makeremail,makertel,makerhompage,makerinsta,makerfacebook,makertwitter,fcno,fcname,ftitle,aim_amount,mainimg,openday,endday,tag,detailimg,detailcont) "
	//		+ "VALUSE(fm_wfno_seq.nextval,#{makername},#{makerphoto},#{makeremail},#{makertel},#{makerhompage},#{makerinsta},#{makerfacebook},#{makertwitter},#{fcno},#{fcname},#{ftitle},#{aim_amount},#{mainimg},#{openday},#{endday},#{tag},#{detailimg},#{detailcont})")
	public void fundInsertData(FundVO vo)
	{
		mapper.fundInsertData(vo);
	}
	//@Select("SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,num "
	//		+ "FROM (SELECT wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername,rownum as num "
	//		+ "FROM (SELECT /*+ INDEX_ASC(fundmaking fm_wfno_pk)*/wfno,mainimg,fcname,ftitle,openday,endday,aim_amount,makerphoto,makername "
	//		+ "FROM fundmaking WHERE id=#{id} AND rewardok=0)) "
	//		+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundVO> projectListData(Map map)
	{
		return mapper.projectListData(map);
	}
	// 리워드 등록 안된거
	//@Select("SELECT CEIL(COUNT(*)/3.0) FROM fundmaking WHERE id=#{id} AND rewardok=0")
	public int projectrewardnoTotalpage(String id)
	{
		return mapper.projectrewardnoTotalpage(id);
	}
	// 리워드 등록 된거
	public int projectrewardokTotalpage(String id)
	{
		return mapper.projectrewardokTotalpage(id);
	}
	
	//리워드 등록 안된거
	//@Select("SELECT wfno,mainimg,detailimg,detailcont,fcname,tag,ftitle,fsubtitle,aim_amount FROM fundmaking WHERE wfno=#{wfno}")
	public FundVO projectDetailDataForReward(int wfno)
	{
		return mapper.projectDetailDataForReward(wfno);
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
}
