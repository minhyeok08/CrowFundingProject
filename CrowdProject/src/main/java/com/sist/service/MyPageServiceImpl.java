package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.MyPageDAO;
import com.sist.mapper.MyPageMapper;
import com.sist.vo.*;


@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDAO dao;
	
	@Override
	public MemberVO myInfo(String id) {
		return dao.myInfo(id);
	}

	@Override
	public void myInfoUpdate(MemberVO vo) {
		dao.myInfoUpdate(vo);
	}

	@Override
	public void myProfileUpdate(MemberVO vo) {
		dao.myProfileUpdate(vo);
	}

	@Override
	public void passwordUpdate(MemberVO vo) {
		dao.passwordUpdate(vo);
	}

	@Override
	public String pwdCheck(MemberVO vo) {
		return dao.pwdCheck(vo);
	}

	@Override
	public int myFundCount(String id) {
		return dao.myFundCount(id);
	}

	@Override
	public BuyVO myFundInfo(String id) {
		return dao.myFundInfo(id);
	}

	@Override
	public List<BuyVO> myFundDetail(String id) {
		return dao.myFundDetail(id);
	}

	@Override
	public List<FundVO> jjimListData(String id) {
		return dao.jjimListData(id);
	}

	@Override
	public List<QnAVO> myQnaListData(String id) {
		return dao.myQnaListData(id);
	}

	@Override
	public QnAVO myQnaReplyData(int group_id) {
		return dao.myQnaReplyData(group_id);
	}
	
}
