package com.sist.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO dao;

	@Override
	public int memberIdCheck(String id) {
		return dao.memberIdCheck(id);
	}

	@Override
	public int memberEmailCheck(String email) {
		return dao.memberEmailCheck(email);
	}

	@Override
	public int memberPhoneCheck(String phone) {
		return dao.memberPhoneCheck(phone);
	}

	@Override
	public void memberJoin(MemberVO vo) {
		dao.memberJoin(vo);
	}

	@Override
	public MemberVO memberLogin(String id) {
		return dao.memberLogin(id);
	}
	
	@Override
	public void authKeyUpdate(Map map) {
		dao.authKeyUpdate(map);
	}
	
	@Override
	public void AuthStatusUpdate(Map map) {
		dao.AuthStatusUpdate(map);
	}

	@Override
	public String memberFindID(String email) {
		return dao.memberFindID(email);
	}

	@Override
	public void pwdUpdate(Map map) {
		dao.pwdUpdate(map);
	}

}
