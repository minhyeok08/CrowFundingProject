package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MyPageMapper;
import com.sist.vo.AdminqnaVO;
import com.sist.vo.BuyVO;
import com.sist.vo.FundVO;
import com.sist.vo.MemberVO;
import com.sist.vo.QnAVO;
import com.sist.vo.RewardVO;
import com.sist.vo.StoreVO;
import com.sist.vo.SupVO;

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
	
	public void passwordUpdate(MemberVO vo) {
		mapper.passwordUpdate(vo);
	}
	
	public String pwdCheck(MemberVO vo) {
		return mapper.pwdCheck(vo);
	}
	
	public int myFundCount(String id) {
		return mapper.myFundCount(id);
	}

	public BuyVO myFundInfo(String id) {
		return mapper.myFundInfo(id);
	}
	
	public List<BuyVO> myFundDetail(String id) {
		return mapper.myFundDetail(id);
	}
	
	public List<FundVO> jjimListData(String id){
		return mapper.jjimListData(id);
	}
	
	public List<QnAVO> myQnaListData(String id){
		return mapper.myQnaListData(id);
	}
	
	public QnAVO myQnaReplyData(int group_id) {
		return mapper.myQnaReplyData(group_id);
	}
	
	public List<SupVO> myFollowing(String id) {
		return mapper.myFollowing(id);
	}
	
	public void qnaInsert(AdminqnaVO vo) {
		mapper.qnaInsert(vo);
	}

	public List<AdminqnaVO> qnaDetailData(String id){
		return mapper.qnaDetailData(id);
	}
	
	public List<StoreVO> storeJjimListData(String id){
		return mapper.storeJjimListData(id);
	}
}
