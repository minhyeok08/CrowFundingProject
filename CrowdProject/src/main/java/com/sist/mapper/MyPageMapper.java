package com.sist.mapper;

import com.sist.vo.MemberVO;

public interface MyPageMapper {
	//<select id="myInfo" resultType="memberVO" parameterType="String">
	public MemberVO myInfo(String id);
	
	//<insert id="myImageInsert" parameterType="memberVO">
	public void myImageInsert(MemberVO vo);
	
	//<update id="myInfoUpdate" parameterType="memberVO">
	public void myInfoUpdate(MemberVO vo);
}
