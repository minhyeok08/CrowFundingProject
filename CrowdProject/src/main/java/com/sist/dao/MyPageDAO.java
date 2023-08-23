package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MyPageMapper;
import com.sist.vo.MemberVO;

@Repository
public class MyPageDAO {
	@Autowired
	private MyPageMapper mapper;
	
	// myinfo
	public MemberVO myInfo(String id) {
		return mapper.myInfo(id);
	}
	
	//update
	public void myInfoUpdate(MemberVO vo) {
		mapper.myInfoUpdate(vo);
	}
	
	public void myProfileUpdate(MemberVO vo) {
		mapper.myProfileUpdate(vo);
	}
}
