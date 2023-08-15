package com.sist.mapper;

import com.sist.vo.MemberVO;

public interface MemberMapper {
	//<select id="memberIdCheck" resultType="int" parameterType="String">
	public int memberIdCheck(String id);
	
	//<select id="memberEmailCheck" resultType="int" parameterType="String">
	public int memberEmailCheck(String email);
	
	//<select id="memberPhoneCheck" resultType="int" parameterType="String">
	public int memberPhoneCheck(String phone);
	
	//<insert id="memberJoin" parameterType="memberVO">
	public void memberJoin(MemberVO vo);
	
	//<select id="memberLogin" resultType="memberVO" parameterType="String">
	public MemberVO memberLogin(String id);
}
