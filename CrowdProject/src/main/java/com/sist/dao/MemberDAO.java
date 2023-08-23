package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class MemberDAO {
	@Autowired
	private MemberMapper mapper;
	
	public int memberIdCheck(String id) {
		return mapper.memberIdCheck(id);
	}
	
	public int memberEmailCheck(String email) {
		return mapper.memberEmailCheck(email);
	}
	
	public int memberPhoneCheck(String phone) {
		return mapper.memberPhoneCheck(phone);
	}
	
	public void memberJoin(MemberVO vo) {
		mapper.memberJoin(vo);
	}
	
	public void memberProfileInsert(MemberVO vo) {
		mapper.memberProfileInsert(vo);
	}
	
	public MemberVO memberLogin(String id) {
		return mapper.memberLogin(id);
	}
	
	public void authKeyUpdate(Map map) {
		mapper.authKeyUpdate(map);
	}
	
	public void AuthStatusUpdate(Map map) {
		mapper.AuthStatusUpdate(map);
	}
	
	public String memberFindID(String email) {
		return mapper.memberFindID(email);
	}
	
	public void pwdUpdate(Map map) {
		mapper.pwdUpdate(map);
	}
}
