package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.*;

public interface MyPageService {
	// 내 정보
	public MemberVO myInfo(String id);
	public void myInfoUpdate(MemberVO vo);
	public void myProfileUpdate(MemberVO vo);
	public void passwordUpdate(MemberVO vo);
	public String pwdCheck(MemberVO vo);
	
	// my 펀딩
	public int myFundCount(String id);
	public BuyVO myFundInfo(String id);
	public List<BuyVO> myFundDetail(String id);
}