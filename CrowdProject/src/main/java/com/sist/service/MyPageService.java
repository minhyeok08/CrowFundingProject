package com.sist.service;

import com.sist.vo.MemberVO;

public interface MyPageService {
	public MemberVO myInfo(String id);
	public void myImageInsert(MemberVO vo);
	public void myInfoUpdate(MemberVO vo);
}
