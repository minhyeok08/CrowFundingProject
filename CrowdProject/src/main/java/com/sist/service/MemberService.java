package com.sist.service;

import java.util.Map;

import com.sist.vo.MemberVO;

public interface MemberService {

	public int memberIdCheck(String id);

	public int memberEmailCheck(String email);

	public int memberPhoneCheck(String phone);

	public void memberJoin(MemberVO vo);

	public MemberVO memberLogin(String id);
	
	public void authKeyUpdate(Map map);
	
	public void AuthStatusUpdate(Map map);
}
