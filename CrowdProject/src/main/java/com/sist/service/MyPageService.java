package com.sist.service;

import java.util.Map;

import com.sist.vo.MemberVO;

public interface MyPageService {
	public MemberVO myInfo(String id);
	public void myInfoUpdate(MemberVO vo);
	public void myProfileUpdate(MemberVO vo);
	public void passwordUpdate(MemberVO vo);
	public String pwdCheck(MemberVO vo);
}
