package com.sist.mapper;

import com.sist.vo.MemberVO;

public interface MyPageMapper {
	//<select id="myInfo" resultType="memberVO" parameterType="String">
	public MemberVO myInfo(String id);
	
	//<update id="myInfoUpdate" parameterType="memberVO">
	public void myInfoUpdate(MemberVO vo);
	
	//	<update id="myProfileUpdate" parameterType="memberVO">
	public void myProfileUpdate(MemberVO vo);
}
