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
	
	// 찜하기
	public List<FundVO> jjimListData(String id);
	public List<StoreVO> storeJjimListData(String id);
	
	// 나의 문의
	public List<QnAVO> myQnaListData(String id);
	public QnAVO myQnaReplyData(int group_id);
	
	// my following
	public List<SupVO> myFollowing(String id);
	
	// 관리자에게 문의하기
	public void qnaInsert(AdminqnaVO vo);
	public List<AdminqnaVO> qnaDetailData(String id);
}