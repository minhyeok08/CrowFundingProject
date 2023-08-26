package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.BuyVO;
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.RewardVO;

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
	
}