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
	
	// profile insert
	public void myImageInsert(MemberVO vo) {
		mapper.myImageInsert(vo);
	}
	
	//update
	public void myInfoUpdate(MemberVO vo) {
		mapper.myInfoUpdate(vo);
	}
}
