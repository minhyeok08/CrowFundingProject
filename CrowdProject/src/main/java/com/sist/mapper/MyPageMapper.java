package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.BuyVO;
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.QnAVO;
import com.sist.vo.RewardVO;
import com.sist.vo.SupVO;

public interface MyPageMapper {
	//<select id="myInfo" resultType="memberVO" parameterType="String">
	public MemberVO myInfo(String id);
	
	//<update id="myInfoUpdate" parameterType="memberVO">
	public void myInfoUpdate(MemberVO vo);
	
	//	<update id="myProfileUpdate" parameterType="memberVO">
	public void myProfileUpdate(MemberVO vo);
	
	//<update id="passwordUpdate" parameterType="memberVO">
	public void passwordUpdate(MemberVO vo);
	
	@Select("select pwd from wadiz_member where id=#{id}")
	public String pwdCheck(MemberVO vo);
	
	//<select id="myFundCount" parameterType="String" resultType="int">
	public int myFundCount(String id);
	
	//<select id="myFundInfo" parameterType="String" resultType="FundVO">
	public BuyVO myFundInfo(String id);
	
	//<select id="myFundDetail" parameterType="String" resultType="List">
	public List<BuyVO> myFundDetail(String id);
	
	@Select("SELECT wfd.wfno, mainimg, fcname, ftitle, support, makername, to_char(wj.regdate,'YYYY-MM-DD hh:mm:ss') as mydate " + 
			"FROM WADIZ_FUND_DETAIL wfd " + 
			"JOIN wadiz_jjim wj ON wfd.wfno=wj.wfno " + 
			"WHERE wj.id=#{id}")
	public List<FundVO> jjimListData(String id);
	
	@Select("SELECT wfd.wfno, wfd.ftitle, wfd.makername, wq.subject, wq.content, to_char(wq.regdate,'yyyy-MM-dd') AS dbday, wq.group_step, wq.group_id, wq.group_tab, wq.isreply " + 
			"FROM wadiz_qna wq " + 
			"JOIN wadiz_fund_detail wfd ON wq.wfno=wfd.wfno " + 
			"WHERE wq.id=#{id}")
	public List<QnAVO> myQnaListData(String id);
	
	@Select("SELECT wq.wfno, wq.id, wq.subject, wq.content, to_char(wq.regdate,'yyyy-mm-dd') AS dbday, wfd.makername " + 
			"FROM wadiz_qna wq " + 
			"JOIN wadiz_fund_detail wfd ON wq.wfno=wfd.wfno " + 
			"WHERE group_id=#{id} AND group_tab=1")
	public QnAVO myQnaReplyData(int group_id);
	
	//<select id="myFollowing" parameterType="Strng" resultType="SupVO">
	public List<SupVO> myFollowing(String id);
}