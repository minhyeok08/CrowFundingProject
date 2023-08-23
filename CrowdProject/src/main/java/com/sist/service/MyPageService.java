package com.sist.service;

import com.sist.vo.MemberVO;

public interface MyPageService {
	public MemberVO myInfo(String id);
	public void myInfoUpdate(MemberVO vo);
	public void myProfileUpdate(MemberVO vo);
}
